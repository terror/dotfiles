export BASH_SILENCE_DEPRECATION_WARNING=1
export BLOCKSIZE=K
export CLICOLOR=1
export EDITOR='nvim'
export EDMV_EDITOR=nvim
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/*' --glob '!*.pyc'"
export HISTFILE=~/.history
export HISTSIZE=5500000
export HOMEBREW_NO_AUTO_UPDATE=1
export HOST=$(hostname)
export KEYTIMEOUT=1
export LANG=en_US.UTF-8
export LESS=-ifRMx2
export LS_OPTIONS='--color=auto'
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export NVM_DIR="$HOME/.nvm"
export PAGER=less
export RIPGREP_CONFIG_PATH=~/.ripgreprc
export SAVEHIST=5000000
export TERM=xterm-color
export VISUAL=nvim

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

for file in ~/.{aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

eval "$(starship init bash)"
eval "$(thefuck --alias)"

shopt -s globstar
unset file;
