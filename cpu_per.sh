#!/bin/bash
#
# name:			cpu_per.sh
# auth:			yshisx
#	data：		2016-1-14
#
#	function：检测进程中各个线程所占用的用户态时间和内核态时间
#
#


Usage()
{
	echo "Usage : `basename $0` filename"
	exit 1
}

if [ $# -eq 0 ]; then
	Usage
fi

app_name=$1

pid=`ps | grep "${app_name}" | grep -v "grep" | grep -v "$0"| awk '{print $1}'` 
if [ -z "${pid}" ]; then
	echo " $1 pid 不存在！"
	exit 1
fi

dir=/proc/${pid}/task
if [ -d dir ];then
	cd ${dir}
else
	echo "dir 不存在"
	exit 1
fi
cat */stat | awk '{print "线程ID:",$1, "用户态时间:",$14, "内核态时间:",$15 }'















