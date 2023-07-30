#!/bin/bash

mv ~/.config/lionvim ~/.config/lionvim-old
cp -r ./lionvim $HOME/.config/
cp ./lion $HOME/.local/bin/
sudo cp ./lion /usr/local/bin/
sudo cp ./lion /usr/bin/
echo "Installation finished"
echo "Use the command \"lion\" to RrrrRRRR"
