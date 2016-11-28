#!/bin/bash

PLUGIN=nerdtree
[ ! -d $PLUGIN ] && git clone git://github.com/scrooloose/$PLUGIN.git ~/.dotfiles/.vim/bundle/$PLUGIN
[ -d $PLUGIN ] && git -C $PLUGIN pull

PLUGIN=vim-fireplace
[ ! -d $PLUGIN ] && git clone git://github.com/tpope/$PLUGIN.git ~/.dotfiles/.vim/bundle/$PLUGIN
[ -d $PLUGIN ] && git -C $PLUGIN pull
