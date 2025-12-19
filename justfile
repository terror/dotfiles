set dotenv-load

export EDITOR := 'nvim'

alias c := check

default:
  just --list

all: rustup formulae crates tpm

[group: 'dev']
check:
  shellcheck bin/*
  stylua --check .

[group: 'install']
crates:
  ./bin/crates

[group: 'install']
formulae:
  brew bundle install --file=brew/Brewfile

[group: 'install']
rustup:
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

[group: 'install']
tpm:
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

[group: 'dev']
update-brewfile:
  cd brew && brew dump
