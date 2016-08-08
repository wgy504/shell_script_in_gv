#!/bin/bash
#		
# name:			format_c.sh
# auth:			yshisx
# date:			2016年8月8日 21:49:30
#	
# function:	ftp 获取系统内日志或者其它文件
#	$1:系统ip
# $2:用户名
# $3:密码
# $4:要获取的文件(绝对路径),如：/media/mmcblk0/m*
#
#

ftp -n -v -d $1<<EOF
user $2 $3
#binary
ascii
prompt
mget $4

bye
EOF