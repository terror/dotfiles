use super::*;

#[derive(Parser)]
pub(crate) struct Arguments {
  /// Path to the source file relative to dotfiles root
  source: Option<PathBuf>,
  /// Path where the symlink will be created
  target: Option<PathBuf>,
  #[command(subcommand)]
  subcommand: Option<Subcommand>,
}

impl Arguments {
  pub(crate) fn run(self) -> Result {
    match self.subcommand {
      Some(subcommand) => subcommand.run(),
      None => match (self.source, self.target) {
        (Some(source), Some(target)) => link::run(source, target),
        _ => {
          Self::command().print_help()?;
          Ok(())
        }
      },
    }
  }
}
