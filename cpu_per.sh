#!/bin/bash
#
# name:			cpu_per.sh
# auth:			yshisx
#	data��		2016-1-14
#
#	function���������и����߳���ռ�õ��û�̬ʱ����ں�̬ʱ��
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
	echo " $1 pid �����ڣ�"
	exit 1
fi

dir=/proc/${pid}/task
if [ -d dir ];then
	cd ${dir}
else
	echo "dir ������"
	exit 1
fi
cat */stat | awk '{print "�߳�ID:",$1, "�û�̬ʱ��:",$14, "�ں�̬ʱ��:",$15 }'















