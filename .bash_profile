export PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:$PATH"     # python3.7
export PATH="/Library/Framework/Python.framework/Versions/3.7/bin/pip:$PATH"  # pip3.7

export PATH="$HOME/Desktop/kattis-cli:$PATH"   # cli for submitting solutions to kattis
export PATH="$HOME/Desktop/contest-cli:$PATH"  # cli for viewing programming contest times
export PATH="$PATH:$HOME/.bin"                 # various scripts
export PATH="$HOME/.cargo/bin:$PATH"           # rust package registry

export BASH_SILENCE_DEPRECATION_WARNING=1      # disable dep warning
export TERM=xterm-color                        # set colors

if [ -f "$HOME"/.bashrc ];then
    source "$HOME"/.bashrc
fi
