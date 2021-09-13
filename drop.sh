#!/bin/bash -l

case $1 in

    #setting up a usable somewhat light vim environment
    vim)
      if [ -f ~/.vimrc ] 
      then
        echo "vimrc already present. mv to .vimrc_old"
        mv ~/.vimrc ~/.vimrc_old
      fi
      cp .vimrc ~/.vimrc

      mkdir -p ~/.vim/pack/plugins/start/
      cd ~/.vim/pack/plugins/start/
      echo "installing plugins"
      git clone https://github.com/vim-airline/vim-airline.git
      git clone https://github.com/preservim/nerdtree.git
      git clone https://github.com/vim-scripts/AutoComplPop.git
      mkdir -p ~/.vim/pack/default/start/
      cd  ~/.vim/pack/default/start/
      git clone  https://github.com/morhetz/gruvbox.git
    ;;
esac
