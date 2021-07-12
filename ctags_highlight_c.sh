#########################################################################
# File Name: ctags_highlight_c.sh
# Author: sv
# mail: 
# Created Time: Mon 22 Mar 2021 02:22:30 AM CST
#########################################################################
#!/bin/bash


syntax_dir="/home/lalala/.cache/tags/"
syntax_file="/home/lalala/.config/nvim/syntax/c/tags.vim"
echo "" > $syntax_file
for file_tmp in $(ls $syntax_dir)
do
	echo "$syntax_dir$file_tmp"
	various=$(grep ';"	v' "$syntax_dir$file_tmp" | awk '{print $1}')
	for i in $various
	do
		Various="syn keyword cVarious $i"
		echo $Various >> $syntax_file
	done
done
echo "hi cVarious gui=none guifg=yellow guibg=none" >> $syntax_file
echo "touch $syntax_file ok"

