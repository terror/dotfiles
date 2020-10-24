export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init bash)"
eval "$(thefuck --alias)"
export EDITOR='vim'

# load functions and aliases
for file in ~/.{aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

# book note :)
cd /Users/liam/Github/bookshelf && py generate.py && cd ~ || exit

unset file;
