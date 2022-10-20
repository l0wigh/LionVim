#!/bin/bash

mv ~/.config/lionvim ~/.config/lionvim-old
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
cp -r ./lionvim $HOME/.config/
cp ./lion $HOME/.local/bin/
sudo cp ./lion /usr/local/bin/
sudo cp ./lion /usr/bin/
nvim -u "$HOME/.config/lionvim/bootstrap.lua" --headless -c "au User PackerComplete quitall" -c "PackerSync"
echo "Installation finished"
echo "Use the command \"lion\" to RrrrRRRR"
