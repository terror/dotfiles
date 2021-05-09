# path exports

export PATH="/usr/local/bin/python3:$PATH"
export PATH="/usr/local/bin/pip3:$PATH"
export PATH="$HOME/Desktop/kattis-cli:$PATH"
export PATH="$HOME/Desktop/contest-cli:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.bin"

if [ -f "$HOME"/.bashrc ]; then
    source "$HOME"/.bashrc
fi
