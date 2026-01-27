use super::*;

pub(crate) fn run(source: PathBuf, target: PathBuf) -> Result {
  let dotfiles = PathBuf::from(DOTFILES).canonicalize()?;

  let source = dotfiles.join(&source);

  if !source.exists() {
    bail!("source does not exist: {}", source.display());
  }

  let target =
    PathBuf::from(shellexpand::tilde(target.to_str().unwrap()).as_ref());

  if target.exists() || target.symlink_metadata().is_ok() {
    bail!("target already exists: {}", target.display());
  }

  if let Some(parent) = target.parent() {
    if !parent.exists() {
      fs::create_dir_all(parent)?;
    }
  }

  symlink(&source, &target)?;

  let style = Style::stdout();

  println!(
    "{} {} {} {}",
    style.apply(style::GREEN, "✓"),
    style.apply(style::DIM, target.display()),
    style.apply(style::DIM, "->"),
    style.apply(style::DIM, source.display()),
  );

  Ok(())
}
