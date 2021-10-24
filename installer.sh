#!/bin/bash

function installbrew {
	sudo apt update
	sudo apt-get install build-essential procps curl file git -y
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
}

function installnvim {
	brew install neovim
}

function installconfig {
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
		~/.local/share/nvim/site/pack/packer/start/packer.nvim
	cp ./lionvim $HOME/.config/ -r
	cp ./lion $HOME/.local/bin/
	sudo cp ./lion /usr/bin/
	# sudo apt-get install --yes ripgrep python3-venv yarn npm git
	lion --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
	echo "Installation finished"
	echo "Use the command "lion" to RrrrRRRR"
}

function main {
	# Don't care for now
	if [[ $1 == "yes" ]]
	then
		if ! command -v brew &> /dev/null
		then
			echo "Brew Installation..."
			installbrew
		fi

		if ! command -v nvim &> /dev/null
		then
			echo "Nvim Installation..."
			installnvim
		else
			version=$(nvim --version | head -1 | cut -d 'v' -f 2 | cut -d "." -f 2)
			if [[ $version < "6" ]]; then
				echo "Remove your nvim version and launch the installer again"
				exit
			fi
		fi
	fi
	installconfig
}

main
