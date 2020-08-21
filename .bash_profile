# Setting PATH
export PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:$PATH"
export PATH="/Library/Framework/Python.framework/Versions/3.7/bin/pip:$PATH"
export PATH="/Users/liam/Desktop/kattis-cli:$PATH"
export PATH="/Users/liam/Desktop/contest-cli:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# Shhh
export BASH_SILENCE_DEPRECATION_WARNING=1

# Set colors to match iTerm2 Terminal Colors
export TERM=xterm-color

cd ~
# Load dotfiles
if [ -f $HOME/.bashrc ];then
    source $HOME/.bashrc
fi
