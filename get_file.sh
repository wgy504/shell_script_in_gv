#!/bin/bash
#		
# name:			format_c.sh
# auth:			yshisx
# date:			2016��8��8�� 21:49:30
#	
# function:	ftp ��ȡϵͳ����־���������ļ�
#	$1:ϵͳip
# $2:�û���
# $3:����
# $4:Ҫ��ȡ���ļ�(����·��),�磺/media/mmcblk0/m*
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