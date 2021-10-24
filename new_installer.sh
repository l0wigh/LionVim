#!/bin/bash

declare -a npm_deps=(
	"neovim"
	"tree-sitter-cli"
)

declare -a pip_deps=(
	"pynvim"
)

install_nodejs_deps_npm () {
	for dep in "${npm_deps[@]}"; do
		if ! npm ls -g "$dep" &>/dev/null; then
			printf "installing %s .." "$dep"
			yarn global add "$dep"
		fi
	done
	echo "< 🦁 > Nodejs deps installed"
}

install_python_deps () {
	for dep in "${pip_deps[@]}"; do
		python3 -m pip install --user "$dep"
	done
	echo "< 🦁 > Python deps installed"
}

installLion () {
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
		~/.local/share/nvim/site/pack/packer/start/packer.nvim
	cp ./lionvim $HOME/.config/ -r
	cp ./lion $HOME/.local/bin/
	sudo cp ./lion /usr/bin/
	# sudo apt-get install --yes ripgrep python3-venv yarn npm git
	nvim -u "$HOME/.config/lionvim/bootstrap.lua" --headless -c "au User PackerComplete quitall" -c "PackerSync"
	echo "< 🦁 > Installation finished"
	echo "< 🦁 > Use the command 'lion' to RrrrRRRR"
}

main () {
	install_nodejs_deps_npm
	install_python_deps
	installLion
}

main
