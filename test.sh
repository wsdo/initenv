#！/bin/bash
echo "Shell 传递参数实例！";
echo "执行的文件名：$0";
echo "第一个参数为：$1";
echo "第二个参数为：$2";
echo "第三个参数为：$3";

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

#set mysql root password
# if [ -z ${DB_Root_Password} ]; then
#     echo "==========================="
#     DB_Root_Password="root"
#     Echo_Yellow "Please setup root password of MySQL."
#     read -p "Please enter: " DB_Root_Password
#     if [ "${DB_Root_Password}" = "" ]; then
#         echo "NO input,password will be generated randomly."
#         DB_Root_Password="lnmp.org#$RANDOM"
#     fi
# fi
# echo "MySQL root password: ${DB_Root_Password}"

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
cur_dir=`pwd`

readInput(){
  text=$1
  resultText=$2
  if [ -z ${data} ]; then
      echo "==========================="
      data="root"
      ${text}
      read -p "Please enter: " data
      if [ "${data}" = "" ]; then
          echo "NO input, will be generated randomly."
      fi
  fi
  echo ${resultText} ${data}
}

User=$(readInput stark "Please enter username for this system" "your enter username:")

Passwd=$(readInput wsd123 "Please enter password for "${User} "your enter username:")
# setUser 2>&1 | tee ${cur_dir}/readInput.log

echo ${User} ------- ${Passwd}

