# Setting PATH
export PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:$PATH"
export PATH="/Library/Framework/Python.framework/Versions/3.7/bin/pip:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="/Users/liam/Desktop/kattis-cli:$PATH"
export PATH="/Users/liam/Desktop/contest-cli:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# Neofetch
neofetch
cd ~

# shhh
export BASH_SILENCE_DEPRECATION_WARNING=1

# Load dotfiles
for file in ~/.{bashrc,aliases,functions}; do
	  source "$file";
done;
unset file;
  
