#########################################################################
# File Name: login.sh
# Created Time: Fri Apr  2 18:57:46 2021
# 2021-4-21
#########################################################################

#!/bin/bash

ip=`ifconfig en1 |grep "inet addr"| cut -f 2 -d ":"|cut -f 1 -d " "`
#echo $ip
option="${1}"
username=username
passwd=password 

echo "账户名称: ${username}";
# --login  登录
# --logoff 注销
# --info   信息

case $option in
    --login) curl -s -H "ipgw.neu.edu.cn" --data "action=login&ac_id=1&user_ip=&nas_ip=&user_mac=&url=/include/auth_action.php&username=${username}&password=${passwd}&save_me=0" 'https://ipgw.neu.edu.cn/srun_portal_pc.php?url=&ac_id=1' | grep -o -E "已经在线了|网络已连接"
    	;;
    --info) curl -s -H "ipgw.neu.edu.cn" --data "action=get_online_info" 'https://ipgw.neu.edu.cn/include/auth_action.php' | awk 'BEGIN{FS=","} {if($1=="not_online"){status="not online" } else {status="online"; total=$1/1073741824; time=$2/3600}} END{printf "账号状态: %-s\n", status; printf "已用流量: %-8.2f GB\n", total; printf "已用时长: %-8.2f hours\n", time;printf "账户余额: %-8s Yuan\n", $3; printf  "ip  地址: %-s", $6;}'
        echo 
        ;;
    --logoff) curl -s -H "ipgw.neu.edu.cn" --data "action=login&ac_id=1&user_ip=&nas_ip=&user_mac=&url=/include/auth_action.php&username=${username}&password=123&save_me=0" 'https://ipgw.neu.edu.cn/srun_portal_pc.php?url=&ac_id=1' | grep -o -E "已经在线了|网络已连接"
		echo "成功下线"
        ;;
    --help) echo "--login 登录"
        echo "--info 上网信息"
        echo "--off 登出"
        ;;
    *) echo "please input operation command, command --help"
    ;;
esac

