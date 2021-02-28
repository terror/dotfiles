export PATH="/usr/local/bin/python3:$PATH"    # python3
export PATH="/usr/local/bin/pip3:$PATH"       # pip3
export PATH="$HOME/Desktop/kattis-cli:$PATH"  # cli for submitting solutions to kattis
export PATH="$HOME/Desktop/contest-cli:$PATH" # cli for viewing programming contest times
export PATH="$HOME/.cargo/bin:$PATH"          # rust package registry
export PATH="$PATH:$HOME/.bin"                # various scripts

export BASH_SILENCE_DEPRECATION_WARNING=1     # disable dep warning
export TERM=xterm-color                       # set colors

if [ -f "$HOME"/.bashrc ];then
    source "$HOME"/.bashrc
fi
