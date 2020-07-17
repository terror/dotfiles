export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add colors to Terminal
	export PS1="\[\033[38;5;51m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;10m\]\h\[$(tput sgr0)\]\[\033[38;5;226m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\\$\[$(tput sgr0)\]"
	export EDITOR='vim'

# Functions
function run_cpp {
  g++ "$@" && ./a.out;
}

function run_python {
  python3 "$@";
}

function mkcd {
  mkdir -p "$@" && cd "$@"
}

# Git Aliases
alias ga="git add"
alias gc="git commit"
alias gp="git pull"
alias gd="git diff"
alias gch="git checkout"
alias gst="git status"

# Commands
alias v="vim"
alias run="run_cpp"
alias py="run_python"
alias mkcd="mkcd"

# CD
alias c="cd ~/Github/CompetitiveProgramming"
