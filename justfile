all: rustup formulae crates tpm

crates:
  ./bin/install-crates

formulae:
  brew bundle install --file=brew/Brewfile

rustup:
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

tpm:
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

update-brewfile:
  cd brew && brew dump
