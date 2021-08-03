# exported variables

export EDITOR='nvim'
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export NVM_DIR="$HOME/.nvm"
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/*' --glob '!*.pyc'"
export BASH_SILENCE_DEPRECATION_WARNING=1
export TERM=xterm-color

# config files

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

for file in ~/.{aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

eval "$(starship init bash)"
eval "$(thefuck --alias)"

shopt -s globstar
unset file;
