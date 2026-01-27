use super::*;

mod check;

#[derive(Parser)]
pub(crate) enum Subcommand {
  /// Check that all symlinks are correctly configured
  Check,
}

impl Subcommand {
  pub(crate) fn run(self) -> Result {
    match self {
      Self::Check => check::run(),
    }
  }
}
