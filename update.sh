#!  /bin/bash

direct=${1:-save}

mkdir -p bak

if [ $direct = save ]; then
  dirty=`git status -s|grep vimrc.vim|wc -l`
  if [ "$dirty" -ge 1 ]; then
    echo -n "Do you want to back the vimrc file, it will be overwritten[y/c/N]: "
    read backup
    if [ "$backup" = y ]; then
      git add vimrc.vim
      git commit -am "tmp"
    elif [ "$backup" != N ]; then
      echo -e vimrc file update canceled
      exit
    fi
  fi
  cp ~/.vimrc vimrc.vim
  echo -e vimrc file is updated
else
  cp ~/.vimrc bak/vimrc.vim
  cp vimrc.vim ~/.vimrc
  echo -e vimrc file is output
fi
