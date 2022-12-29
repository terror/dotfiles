bootstrap:
  ./boostrap

crates:
  cargo install bat
  cargo install cargo-audit
  cargo install cargo-check
  cargo install cargo-edit
  cargo install cargo-expand
  cargo install cargo-sort
  cargo install cargo-tarpaulin
  cargo install cargo-watch
  cargo install fd
  cargo install just
  cargo install loc
  cargo install present
  cargo install ripgrep
  cargo install stylua
  cargo install typos-cli
  cargo install vim-profiler

formulae: homebrew
  brew bundle install

homebrew:
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

rustup:
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
