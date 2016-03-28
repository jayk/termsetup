#!/bin/bash

termsetup_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

base_dir=$(echo $termsetup_dir | sed "s#${HOME}/##")

echo "This will create symlinks for your .tmux and .vim files to the"
echo "termsetup directory here: " $base_dir
echo ""
echo "hit ctrl-c to abort"
read
cd $HOME
ln -s ${base_dir}/vim .vim
ln -s ${base_dir}/vim/vimrc .vimrc
ln -s ${base_dir}/tmux/tmux.conf .tmux.conf

echo "Done"

