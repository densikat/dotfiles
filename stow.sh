        #!/bin/bash

        rm -rf ~/.bashrc ~/.gitignore ~/.vimrc ~/.vim ~/.alacritty.yml ~/.config/kitty
        stow -vSt ~ bash
        stow -vSt ~ vim
        stow -vSt ~ alacritty
        stow -vSt ~ kitty

        rm -f ~/.gitignore
        echo "tags" > ~/.gitignore
        git config --global core.excludesFile '~/.gitignore'

