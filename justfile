set dotenv-load

export EDITOR := 'nvim'

alias c := check

default:
  just --list

all: codex rustup formulae mise agent-browser crates tpm

[group: 'dev']
check:
  shellcheck bin/*
  stylua --check .

[group: 'install']
agent-browser:
  agent-browser install

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
  brew bundle install --file=etc/brew/Brewfile

[group: 'install']
mise:
  mise install

[group: 'install']
rustup:
  command -v rustup > /dev/null || curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

[group: 'install']
tpm:
  test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

[group: 'dev']
update-brewfile:
  cd etc/brew && brew dump
