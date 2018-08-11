#！/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
cur_dir=`pwd`

## update package


init(){
  ## install zsh
  apt-get update -y && apt-get -y install git zsh
  sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

  ## set user
  # useradd $0
}

node(){
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
  nvm install node $1
}

zsh(){
  apt-get -y install git zsh
  sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
}

stark(){
  echo "hi stark $1"
}


setUser(){
  if [ -z ${User} ]; then
      echo "==========================="
      User="stark"
      Echo_Yellow "Please enter username for this system" 
      read -p "Please enter: " User
      if [ "${User}" = "" ]; then
          echo "NO input, will be generated randomly."
      fi
  fi
  echo "your enter username:" ${User}
  useradd ${User}
  mkdir -p /home/${User}
  chown -R ${User}:${User} /home/${User}
  gpasswd -a ${User} sudo
  usermod -s /bin/bash ${User}
  passwd ${Passwd}
}


if [ $1 == 'node' ]; then
  node $2
elif [ $1 == 'setUser' ]; then
  setUser $2
elif [ $1 == 'zsh' ]; then
  stark
elif [ $1 == 'stark' ]; then
  stark wang
elif [ $1 == 'init' ]; then
  apt-get -y install git zsh
fi

#Run it
# init 2>&1 | tee ${cur_dir}/init.log
