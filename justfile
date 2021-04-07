default:
	git submodule update --init --recursive .
	SHELL=sh ./submodules/dotbot/bin/dotbot -c default.yaml

rustup:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

crates:
	cargo install bat
	cargo install cargo-check
	cargo install cargo-watch
	cargo install just
	cargo install ripgrep

homebrew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

formulae:
	brew bundle install
