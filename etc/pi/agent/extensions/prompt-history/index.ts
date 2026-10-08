import { join } from "node:path";
import {
  BorderedLoader,
  type ExtensionAPI,
  type ExtensionContext,
  getAgentDir,
} from "@earendil-works/pi-coding-agent";
import { isFocusable, Key } from "@earendil-works/pi-tui";
import {
  getPrompt,
  HistoryStore,
  isSubagentSession,
  uniquePrompts,
} from "./history.ts";
import { HistoryPicker } from "./picker.ts";

function aboveEditor<T>(
  ctx: ExtensionContext,
  factory: Parameters<typeof ctx.ui.custom<T>>[0],
): Promise<T> {
  return ctx.ui.custom<T>(
    async (tui, theme, keybindings, done) => {
      const component = await factory(tui, theme, keybindings, done);

      ctx.ui.setWidget("prompt-history", () => component, {
        placement: "aboveEditor",
      });

      return {
        get focused() {
          return isFocusable(component) && component.focused;
        },
        set focused(value: boolean) {
          if (isFocusable(component)) component.focused = value;
        },
        render: () => [],
        invalidate: () => component.invalidate(),
        handleInput: (data: string) => component.handleInput?.(data),
        dispose: () => ctx.ui.setWidget("prompt-history", undefined),
      };
    },
    { overlay: true },
  );
}

export default function (pi: ExtensionAPI) {
  const store = new HistoryStore();

  let open = false;

  async function showHistory(ctx: ExtensionContext, query: string) {
    if (ctx.mode !== "tui") {
      ctx.ui.notify("Prompt history requires interactive mode", "error");
      return;
    }

    if (open) {
      return;
    }

    open = true;

    try {
      const history = await aboveEditor<
        Awaited<ReturnType<HistoryStore["load"]>> | Error | undefined
      >(ctx, (tui, theme, _keybindings, done) => {
        const loader = new BorderedLoader(
          tui,
          theme,
          "Loading prompt history…",
        );

        loader.onAbort = () => done(undefined);

        store
          .load(
            join(getAgentDir(), "sessions"),
            ctx.sessionManager.getSessionDir(),
            loader.signal,
          )
          .then((result) => {
            if (!loader.signal.aborted) done(result);
          })
          .catch((error) => {
            if (!loader.signal.aborted)
              done(error instanceof Error ? error : new Error(String(error)));
          });

        return loader;
      });

      if (!history) {
        return;
      }

      if (history instanceof Error) {
        throw history;
      }

      if (history.skipped) {
        ctx.ui.notify(
          `Prompt history skipped ${history.skipped} unreadable files or directories`,
          "warning",
        );
      }

      const entries = ctx.sessionManager.getEntries();
      const parentSession = ctx.sessionManager.getHeader()?.parentSession;

      const subagent = entries.some(
        (entry) =>
          entry.type === "session_info" &&
          isSubagentSession(parentSession, entry.name),
      );

      const current = subagent
        ? []
        : entries.flatMap((entry) => {
            const prompt = getPrompt(entry, ctx.sessionManager.getCwd());
            return prompt ? [prompt] : [];
          });

      const prompts = uniquePrompts([...current, ...history.prompts]);

      if (!prompts.length) {
        ctx.ui.notify("No prompt history found", "info");
        return;
      }

      await aboveEditor<void>(
        ctx,
        (tui, theme, keybindings, done) =>
          new HistoryPicker(
            tui,
            theme,
            keybindings,
            prompts,
            query,
            (selected) => {
              done();

              if (selected !== undefined) {
                ctx.ui.setEditorText(selected);
                tui.requestRender();
              }
            },
          ),
      );
    } catch (error) {
      ctx.ui.notify(
        `Could not load prompt history: ${error instanceof Error ? error.message : String(error)}`,
        "error",
      );
    } finally {
      open = false;
    }
  }

  pi.registerCommand("history", {
    description: "Fuzzy-search prompts across all sessions",
    handler: (args, ctx) => showHistory(ctx, args.trim()),
  });

  pi.registerShortcut(Key.ctrl("r"), {
    description: "Search global prompt history",
    handler: (ctx) => showHistory(ctx, ctx.ui.getEditorText()),
  });
}
