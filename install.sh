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

echo "Moving old spacemacs from ~ to $olddir"
mv ~/.spacemacs ~/dotfiles_old/spacemacs
echo "Creating symlink to .spacemacs in home directory."
ln -s $dir/spacemacs ~/.spacemacs

echo "Moving old karabiner.json from ~ to $olddir"
mv ~/.config/karabiner/karabiner.json ~/dotfiles_old/karabiner
echo "Creating symlink to karabiner.json in karabiner directory."
ln -s $dir/karabiner ~/.config/karabiner/karabiner.json

echo "Moving old bash_profile from ~ to $olddir"
mv ~/.bash_profile ~/dotfiles_old/bash_profile
echo "Creating symlink to .bash_profile in home directory."
ln -s $dir/bash_profile ~/.bash_profile

echo "Moving old mark_herald (color scheme) from ~/.vim/colors to $olddir"
mv ~/.vim/colors/mark_herald.vim $olddir/mark_herald.vim
echo "Creating symlink to mark_herald.vim in ~/.vim/colors"
ln -s $dir/mark_herald.vim ~/.vim/colors/mark_herald.vim

echo "Moving old gitconfig from ~ to $olddir"
mv ~/.gitconfig $olddir/gitconfig
echo "Creating symlink to .gitconfig in home directory."
ln -s $dir/gitconfig ~/.gitconfig


