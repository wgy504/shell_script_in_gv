#!/bin/bash
#		
# name:			format_c.sh
# auth:			yshisx
# date:			2016年8月8日 21:49:30
#	
# function:	按类型格式化C代码脚本，依赖于indent工具
#
#


usage()
{
	echo "#####format the C code use a code style!#####"
	echo "Usage : `basename $0` -a filename -s style"
	exit 1
}

if [ $# -ne 4 ]; then
	usage
fi



while getopts a:s: opt  
do  
  case $opt in  
  a)  
    FILENAME=$OPTARG 
		echo "FILENAME =  $FILENAME"
		#echo "\$OPTIND = $OPTIND"
		;;  
  s)   
    STYLE=$OPTARG   
    echo "STYLE = $STYLE"  
		#echo "\$OPTIND = $OPTIND"
		;;
	h)
		usage
		;;  
  *)
		echo "arg error!!"
		usage
		;;  
 	esac  
done  

#按照Linux的语法分风格格式化代码
#if [ $STYLE = linux ]; then
#	indent $FILENAME -npro -kr -i8 -ts8 -sob -l80 -ss -ncs -cp1
#fi



case $STYLE in
#按照Linux的语法分风格格式化代码
	linux)
		echo "format code use the linux kernel style!"
		indent $FILENAME -npro -kr -i8 -ts8 -sob -l80 -ss -ncs -cp1
		;;
#按照gv的代码风格格式化代码
	gv)
		echo "format code use the gv style!"
		;;
	*)
		echo "style error!"
		usage
		;;


esac





