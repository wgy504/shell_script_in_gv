#!/bin/bash
#		
# name:			p60_trade_time.sh
# auth:			yshisx
# date:			2016年8月10日 20:14:16
#	
# function:	p60交易时间统计
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
echo "当前目录是:$dir"

cd $log_date
dir=`pwd`
echo "当前目录是:$dir"
tmp_file=ms.csv
cat gb_log.txt | grep "当前交易" | awk -F 【 {'print $3}' | awk -F 】 '{print $1}' > $tmp_file
echo "开始分析时间: `date`"
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
echo "结束分析时间: `date`"
echo "交易时间: 小于200 	: $trade_time_lt_200"
echo "交易时间: 200 ~ 270 : $trade_time_200_270"
echo "交易时间: 271 ~ 400 : $trade_time_271_400"
echo "交易时间: 401 ~ 500 : $trade_time_401_500"
echo "交易时间: 501 ~ 600 : $trade_time_501_600"
echo "交易时间: 大于600   : $trade_time_ge_600"


