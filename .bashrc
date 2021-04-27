export EDITOR='nvim'                                                              # text editor
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/*' --glob '!*.pyc'" # use fzf with ripgrep
export MANPAGER='nvim +Man!'																											# man page viewing
export MANWIDTH=999																																# man page width
export NVM_DIR="$HOME/.nvm"                                                       # node version manager

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                                  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"                # This loads nvm bash_completion

eval "$(starship init bash)"
eval "$(thefuck --alias)"

for file in ~/.{aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

shopt -s globstar
unset file;
