export EDITOR='vim'           # text editor
export NVM_DIR="$HOME/.nvm"   # node version manager

eval "$(starship init bash)"
eval "$(thefuck --alias)"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                    # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

for file in ~/.{aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

unset file;
