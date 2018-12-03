#!/usr/bin/env bash

function install_vim() {
  # Install vim
  sudo apt-get install vim
  
  # Create directories
  mkdir -p $PWD/vim/bundle
  
  # Download the vundle 
  git clone https://github.com/gmarik/vundle.git $PWD/vim/bundle/vundle
  
  # Backup the origin vim vimrc  
  DATE=`date +%F-%T`
  if [ -f "$HOME/.vimrc" ]; then
    mv $HOME/.vimrc $HOME/.vimrc.backup.${DATE}
  fi
  if [ -d "$HOME/.vim" ]; then
    mv $HOME/.vim $HOME/.vim.backup.${DATE}
  fi
  
  # Link new vim
  ln -s $PWD/vimrc $HOME/.vimrc
  ln -s $PWD/vim $HOME/.vim
}

function codefmt_dep() {
  installed=false
  echo "Type 'y' or 'Y' to install the dependency for code format, or type any other key to exit"
  read -n 1 installed
  if [ "$installed" == "y" ] || [ "$installed" == "Y" ]; then
    # Install the clang-format
    sudo apt-get install -y clang-format-3.5
    sudo ln -s /usr/lib/llvm-3.5/bin/clang-format /usr/bin/clang-format
  fi
}

function main(){
  codefmt_dep
  install_vim
  echo "Install Done!"
  echo "Please open vim and execute ":BundleInstall" command"
}

main

