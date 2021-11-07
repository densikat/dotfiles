        #!/bin/bash

        rm -rf ~/.bashrc ~/.gitignore ~/.vimrc ~/.vim ~/.alacritty.yml
        stow -vSt ~ bash
        stow -vSt ~ vim
        stow -vSt ~ alacritty

        rm -f ~/.gitignore
        echo "tags" > ~/.gitignore
        git config --global core.excludesFile '~/.gitignore'

