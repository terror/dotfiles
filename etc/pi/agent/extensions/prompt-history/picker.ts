import type {
  KeybindingsManager,
  Theme,
} from "@earendil-works/pi-coding-agent";
import {
  type Component,
  type Focusable,
  fuzzyFilter,
  Input,
  Key,
  matchesKey,
  SelectList,
  stripTerminalSequences,
  type TUI,
  truncateToWidth,
  wrapTextWithAnsi,
} from "@earendil-works/pi-tui";
import type { Prompt } from "./history.ts";

function displayText(text: string): string {
  return stripTerminalSequences(text)
    .replace(/\r\n?/g, "\n")
    .replace(/\t/g, "  ")
    .replace(/[\x00-\x08\x0b-\x1f\x7f-\x9f]/g, "");
}

export class HistoryPicker implements Component, Focusable {
  private input: Input;
  private list!: SelectList;
  private matches: Prompt[] = [];
  private maxVisible = 8;

  constructor(
    private tui: TUI,
    private theme: Theme,
    private keybindings: KeybindingsManager,
    private prompts: Prompt[],
    query: string,
    private done: (value: string | undefined) => void,
  ) {
    this.input = new Input({
      placeholder: "Search prompts or project paths…",
      placeholderStyle: (text) => theme.fg("dim", text),
    });

    this.pasteQuery(query);

    this.filter();
  }

  get focused(): boolean {
    return this.input.focused;
  }

  set focused(value: boolean) {
    this.input.focused = value;
  }

  private pasteQuery(text: string) {
    this.input.handleInput(
      `\x1b[200~${displayText(text).replace(/\s+/g, " ")}\x1b[201~`,
    );
  }

  private filter() {
    this.matches = fuzzyFilter(
      this.prompts,
      this.input.getValue(),
      (prompt) => `${prompt.text}\n${prompt.cwd}`,
    );
    this.createList();
  }

  private createList(index = 0) {
    this.list = new SelectList(
      this.matches.map((prompt, index) => ({
        value: String(index),
        label: displayText(prompt.text).replace(/\s+/g, " ").slice(0, 200),
      })),
      this.maxVisible,
      {
        selectedPrefix: (text) => this.theme.fg("accent", text),
        selectedText: (text) => this.theme.fg("accent", text),
        description: (text) => this.theme.fg("muted", text),
        scrollInfo: (text) => this.theme.fg("dim", text),
        noMatch: (text) => this.theme.fg("warning", text),
      },
    );

    this.list.setSelectedIndex(index);
  }

  private selectedIndex(): number {
    return Number(this.list.getSelectedItem()?.value ?? 0);
  }

  handleInput(data: string) {
    const kb = this.keybindings;

    const index = this.selectedIndex();
    const count = this.matches.length;

    if (kb.matches(data, "tui.select.cancel")) {
      this.done(undefined);
      return;
    }

    if (kb.matches(data, "tui.select.confirm")) {
      if (count) {
        this.done(this.matches[index].text);
      }

      return;
    }

    if (kb.matches(data, "tui.select.up")) {
      if (count) {
        this.list.setSelectedIndex((index + count - 1) % count);
      }
    } else if (
      kb.matches(data, "tui.select.down") ||
      matchesKey(data, Key.ctrl("r"))
    ) {
      if (count) this.list.setSelectedIndex((index + 1) % count);
    } else if (kb.matches(data, "tui.select.pageUp")) {
      this.list.setSelectedIndex(index - this.maxVisible);
    } else if (kb.matches(data, "tui.select.pageDown")) {
      this.list.setSelectedIndex(index + this.maxVisible);
    } else {
      const query = this.input.getValue();

      if (data.startsWith("\x1b[200~") && data.endsWith("\x1b[201~")) {
        this.pasteQuery(data.slice(6, -6));
      } else {
        this.input.handleInput(data);
      }

      if (this.input.getValue() !== query) {
        this.filter();
      }
    }

    this.tui.requestRender();
  }

  render(width: number): string[] {
    if (width < 1) {
      return [];
    }

    const rows = Math.max(1, Math.floor(this.tui.terminal.rows / 2));
    const maxVisible = Math.max(1, Math.min(8, Math.floor((rows - 6) / 2)));

    if (maxVisible !== this.maxVisible) {
      this.maxVisible = maxVisible;
      this.createList(this.selectedIndex());
    }

    const lines = [
      this.theme.fg(
        "accent",
        this.theme.bold(
          `Prompt history · ${this.matches.length}/${this.prompts.length}`,
        ),
      ),
      ...this.input.render(width),
      ...(this.matches.length
        ? this.list.render(Math.max(4, width))
        : [this.theme.fg("warning", "No matching prompts")]),
    ];

    const selected = this.matches[this.selectedIndex()];
    const previewRows = Math.min(6, rows - lines.length - 4);

    if (selected && previewRows > 0) {
      const date = selected.timestamp
        ? new Date(selected.timestamp).toLocaleString()
        : "Unknown date";

      lines.push(
        "",
        this.theme.fg(
          "muted",
          `${date} · ${displayText(selected.cwd).replace(/\n/g, " ")}`,
        ),
      );

      const preview = wrapTextWithAnsi(displayText(selected.text), width);

      lines.push(...preview.slice(0, previewRows));

      if (preview.length > previewRows) {
        lines[lines.length - 1] = this.theme.fg("dim", "…");
      }
    }

    const keys = (action: Parameters<KeybindingsManager["getKeys"]>[0]) =>
      this.keybindings.getKeys(action).join("/");

    lines.push(
      this.theme.fg(
        "dim",
        `${keys("tui.select.up")}/${keys("tui.select.down")} navigate · ctrl+r next · ${keys("tui.select.confirm")} insert · ${keys("tui.select.cancel")} cancel`,
      ),
    );

    return lines.map((line) => truncateToWidth(line, width));
  }

  invalidate() {
    this.input.invalidate();
    this.list.invalidate();
  }
}
