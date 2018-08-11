#！/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
cur_dir=`pwd`

## update package
apt-get update -y && apt-get -y install git zsh

init(){
  ## install zsh
  sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

  ## set user
  useradd $0
}

node(){
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
}

stark(){
  echo 'hi stark'
}

if $1 == 'node' then
  node()
fi

if $1 == 'stark' then
  stark()
fi
#Run it
init 2>&1 | tee ${cur_dir}/init.log
