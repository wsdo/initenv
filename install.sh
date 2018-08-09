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
#Run it
init 2>&1 | tee ${cur_dir}/init.log
