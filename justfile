all:
  just rustup
  just formulae
  just crates
  just tpm

crates:
  cargo install cargo-audit
  cargo install cargo-check
  cargo install cargo-edit
  cargo install cargo-expand
  cargo install cargo-sort
  cargo install cargo-tarpaulin
  cargo install cargo-watch
  cargo install loc
  cargo install present
  cargo install ripgrep
  cargo install skeleton-cli
  cargo install stylua
  cargo install typos-cli
  cargo install vim-profiler

formulae:
  brew bundle install --file=brew/Brewfile

rustup:
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

tpm:
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

update-brewfile:
  cd brew && brew dump
