#!/bin/bash
#		
# name:			p60_trade_time.sh
# auth:			wuw
# date:			2016��8��10�� 20:14:16
#	
# function:	p60����ʱ��ͳ��
#
#
usage()
{
	echo "Usage : `basename $0` 20160809"
	exit 1
}

if [ $# -ne 1 ]; then
	usage
fi
#path=/cygdrive/c/Users/Administrator/Desktop/p60ceshi
path='.'
log_date=$1
cd $path
dir=`pwd`
echo "��ǰĿ¼��:$dir"

cd $log_date
dir=`pwd`
echo "��ǰĿ¼��:$dir"
tmp_file=ms.csv
cat gb_log.txt | grep "��ǰ����" | awk -F �� {'print $3}' | awk -F �� '{print $1}' > $tmp_file
echo "��ʼ����ʱ��: `date`"
while read trade_time
do
	if(($trade_time <= 200))
		then
		((trade_time_lt_200++))
	elif((($trade_time > 200)) &&(($trade_time <= 270)))
		then
		((trade_time_200_270++))
	elif((($trade_time > 270)) && (($trade_time <= 400)))
		then
		((trade_time_271_400++))
	elif((($trade_time > 401)) && (($trade_time <= 500)))
		then
		((trade_time_401_500++))
	elif((($trade_time > 501)) && (($trade_time <= 600)))
		then
		((trade_time_501_600++))
	else
		#echo $trade_time
		#((trade_time_ge_600++))
		trade_time_ge_600=$(($trade_time_ge_600+1))
		continue;
	fi

done < $tmp_file
rm $tmp_file
echo "��������ʱ��: `date`"
echo "����ʱ��: С��200 	: $trade_time_lt_200"
echo "����ʱ��: 200 ~ 270 : $trade_time_200_270"
echo "����ʱ��: 271 ~ 400 : $trade_time_271_400"
echo "����ʱ��: 401 ~ 500 : $trade_time_401_500"
echo "����ʱ��: 501 ~ 600 : $trade_time_501_600"
echo "����ʱ��: ����600   : $trade_time_ge_600"


