#!/bin/bash
#		
# name:			format_c.sh
# auth:			yshisx
# date:			2016��8��8�� 21:49:30
#	
# function:	�����͸�ʽ��C����ű���������indent����
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

#����Linux���﷨�ַ���ʽ������
#if [ $STYLE = linux ]; then
#	indent $FILENAME -npro -kr -i8 -ts8 -sob -l80 -ss -ncs -cp1
#fi



case $STYLE in
#����Linux���﷨�ַ���ʽ������
	linux)
		echo "format code use the linux kernel style!"
		indent $FILENAME -npro -kr -i8 -ts8 -sob -l80 -ss -ncs -cp1
		;;
#����gv�Ĵ������ʽ������
	gv)
		echo "format code use the gv style!"
		;;
	*)
		echo "style error!"
		usage
		;;


esac





