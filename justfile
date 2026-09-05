set dotenv-load

export EDITOR := 'nvim'

alias c := check

default:
  just --list

all: codex rustup formulae crates tpm

[group: 'dev']
check:
  shellcheck bin/*
  stylua --check .

[group: 'install']
codex:
  #!/usr/bin/env bash
  set -euo pipefail
  codex_config={{quote(justfile_directory() / "etc/codex/config.toml")}}
  if [[ "$(readlink /etc/codex/config.toml || true)" != "$codex_config" ]]; then
    sudo /usr/bin/install -d -m 755 /etc/codex
    sudo /bin/ln -s "$codex_config" /etc/codex/config.toml
  fi

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
