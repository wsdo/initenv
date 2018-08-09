#！/bin/bash

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
apt-get update -y
cur_dir=`pwd`

include(){
    local include=${1}
    if [[ -s ${cur_dir}/include/${include}.sh ]];then
        . ${cur_dir}/include/${include}.sh
    else
        echo "Error:${cur_dir}/include/${include}.sh not found, shell can not be executed."
        exit 1
    fi
}

init(){
  include zsh.sh
}
#Run it
init 2>&1 | tee ${cur_dir}/init.log
