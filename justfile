default:
  git submodule update --init --recursive .
  SHELL=sh ./submodules/dotbot/bin/dotbot -c default.yaml

rustup:
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

crates:
  cargo install bat
  cargo install cargo-check
  cargo install cargo-watch
  cargo install cargo-edit
  cargo install just
  cargo install ripgrep
  cargo install loc

homebrew:
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

formulae:
  brew bundle install

brew-dump:
  brew bundle dump --describe
