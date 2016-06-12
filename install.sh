#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

echo "Moving old vimrc from ~ to $olddir"
mv ~/.vimrc ~/dotfiles_old/vimrc
echo "Creating symlink to .vimrc in home directory."
ln -s $dir/vimrc ~/.vimrc

echo "Moving old gitconfig from ~ to $olddir"
mv ~/.gitconfig ~/dotfiles_old/gitconfig
echo "Creating symlink to .gitconfig in home directory."
ln -s $dir/gitconfig ~/.gitconfig

echo "Moving old xmonad.hs from ~/.xmonad to $olddir"
mv ~/.xmonad/xmonad.hs ~/dotfiles_old/xmonad
echo "Creating symlink to .xmonad/xmonad.hs in home directory"
ln -s $dir/xmonad.hs ~/.xmonad/xmonad.hs
