export EDITOR='vim'                                                               # text editor
export NVM_DIR="$HOME/.nvm"                                                       # node version manager
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git/*' --glob '!*.pyc'" # use FZF with ripgrep

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                                  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"                # This loads nvm bash_completion

eval "$(starship init bash)"
eval "$(thefuck --alias)"

for file in ~/.{aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

shopt -s globstar
unset file;
