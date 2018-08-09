#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# Check if user is root
# if [ $(id -u) != "0" ]; then
#     echo "Error: You must be root to run this script, please use root to install $0"
#     exit 1
# fi
cur_dir=$(pwd)

Color_Text()
{
  echo -e " \e[0;$2m$1\e[0m"
}

Echo_Red()
{
  echo $(Color_Text "$1" "31")
}

Echo_Green()
{
  echo $(Color_Text "$1" "32")
}

Echo_Yellow()
{
  echo $(Color_Text "$1" "33")
}

Echo_Blue()
{
  echo $(Color_Text "$1" "34")
}


# User=$1
# Passwd=$2
# if [ "${User}" = "" ]; then
#     User="stark"
# else
#     User=$1
# fi

# if [ "${Passwd}" = "" ]; then
#     User="wsd123"
# else
#     User=$2
# fi

# setUser(){
#   # 添加用户
#   useradd ${User}
#   # 创建用户家目录
#   mkdir -p /home/${User}
#   # 给用户家目录
#   chown -R ${User}:${User} /home/${User}
#   # 授权于用户sudo权限
#   gpasswd -a ${User} sudo
#   # 设置用户密码
#   passwd ${Passwd}
#   usermod -s /bin/bash ${User}
# }


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
setUser 2>&1 | tee ${cur_dir}/setUser.log
