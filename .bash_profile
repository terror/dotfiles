# Setting PATH
export PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:$PATH"
export PATH="/Library/Framework/Python.framework/Versions/3.7/bin/pip:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="/Users/liam/Desktop/kattis-cli:$PATH"

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

# bashrc
if [ -f $HOME/.bashrc ];then
    source $HOME/.bashrc
fi
