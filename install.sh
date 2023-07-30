#!/bin/bash

mv ~/.config/lionvim ~/.config/lionvim-old 2> /dev/null
cp -r ./lionvim $HOME/.config/
cp ./lion $HOME/.local/bin/
lion --headless
echo "Installation finished"
echo "Use the command \"lion\" to RrrrRRRR"
