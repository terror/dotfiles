use {
  anyhow::bail,
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

const CONFIG: &str = include_str!("../../../default.yaml");
const DOTFILES: &str = concat!(env!("CARGO_MANIFEST_DIR"), "/../..");

#[derive(Deserialize)]
struct Entry {
  #[serde(default)]
  link: BTreeMap<String, String>,
}

fn links() -> BTreeMap<String, String> {
  serde_yaml::from_str::<Vec<Entry>>(CONFIG)
    .unwrap()
    .into_iter()
    .flat_map(|entry| entry.link)
    .collect()
}

type Result<T = (), E = anyhow::Error> = std::result::Result<T, E>;

fn main() {
  if let Err(error) = Arguments::parse().run() {
    let style = Style::stdout();
    eprintln!("{} {error}", style.apply(style::BOLD_RED, "error:"));
    process::exit(1);
  }
}
