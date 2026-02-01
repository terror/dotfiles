use {
  anyhow::{Context, bail},
  arguments::Arguments,
  clap::{CommandFactory, Parser},
  serde::Deserialize,
  std::{
    collections::BTreeMap,
    env,
    fmt::{self, Display, Formatter},
    fs,
    io::{self, IsTerminal},
    os::unix::fs::symlink,
    path::PathBuf,
    process,
  },
  style::Style,
  subcommand::Subcommand,
};

mod arguments;
mod link;
mod style;
mod subcommand;

const DOTFILES: &str = concat!(env!("CARGO_MANIFEST_DIR"), "/../..");

#[derive(Deserialize)]
struct Entry {
  #[serde(default)]
  link: BTreeMap<String, String>,
}

fn links() -> Result<BTreeMap<String, String>> {
  let config_path = PathBuf::from(DOTFILES).join("default.yaml");

  let config = fs::read_to_string(&config_path).with_context(|| {
    format!("failed to read config file: {}", config_path.display())
  })?;

  let entries =
    serde_yaml::from_str::<Vec<Entry>>(&config).with_context(|| {
      format!("failed to parse config file: {}", config_path.display())
    })?;

  Ok(entries.into_iter().flat_map(|entry| entry.link).collect())
}

type Result<T = (), E = anyhow::Error> = std::result::Result<T, E>;

fn main() {
  if let Err(error) = Arguments::parse().run() {
    let style = Style::stdout();
    eprintln!("{} {error}", style.apply(style::BOLD_RED, "error:"));
    process::exit(1);
  }
}
