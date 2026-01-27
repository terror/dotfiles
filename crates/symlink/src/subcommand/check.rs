use super::*;

pub(crate) fn run() -> Result {
  let dotfiles = PathBuf::from(DOTFILES).canonicalize()?;

  let style = Style::stdout();

  let mut errors = 0;

  for (destination, source) in links() {
    let (source, destination) = (
      dotfiles.join(&source),
      PathBuf::from(shellexpand::tilde(&destination).as_ref()),
    );

    match fs::read_link(&destination) {
      Ok(target) => {
        if target == source {
          println!(
            "{} {} {} {}",
            style.apply(style::GREEN, "✓"),
            style.apply(style::DIM, destination.display()),
            style.apply(style::DIM, "->"),
            style.apply(style::DIM, target.display()),
          );
        } else {
          println!(
            "{} {} {} {} {} {}",
            style.apply(style::RED, "✗"),
            destination.display(),
            style.apply(style::DIM, "->"),
            style.apply(style::YELLOW, target.display()),
            style.apply(style::DIM, "(expected"),
            style.apply(style::DIM, format!("{})", source.display())),
          );

          errors += 1;
        }
      }
      Err(_) => {
        println!(
          "{} {} {} {}",
          style.apply(style::RED, "✗"),
          destination.display(),
          style.apply(style::DIM, "->"),
          style.apply(style::RED, "missing"),
        );

        errors += 1;
      }
    }
  }

  if errors > 0 {
    bail!("{errors} symlink(s) need attention");
  }

  Ok(())
}
