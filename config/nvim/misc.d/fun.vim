" user func **********************************************************************

autocmd BufNewFile *.sh exec ":call Set_sh_Title()" 
autocmd BufNewFile *.py exec ":call Set_py_Title()" 
autocmd BufNewFile *.h exec ":call Set_h_Title()"
autocmd BufNewFile *.c exec ":call Set_c_Title()"
" autocmd BufWinEnter * silent call Copy_clang_format()
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ******************************************************************************
" func Copy_clang_format()
" try
" 	let l:buf_dir = expand('%:p:h', 1)
" 	if g:gutentags_resolve_symlinks
" 		let l:buf_dir = fnamemodify(resolve(expand('%:p', 1)), ':p:h')
" 	endif
" 	if !exists('g:nvim_root')
" 		let b:nvim_root = gutentags#get_project_root(l:buf_dir)
" 		let b:compile_commands_json = b:nvim_root . "/compile_commands.json"
" 		if filereadable(b:compile_commands_json)    " 判断文件是否存在"
" 			let b:clang_cormat_copy_command = "cp /home/lalala/tools/.clang-format " . b:nvim_root . " -rvf"
" 			call system(b:clang_cormat_copy_command)
" 		endif
" 	endif
" catch
" endtry
" endfunc

" ******************************************************************************
func Set_c_Title() 
	call setline(1,"/************************************************************************") 
	call append(line("."), "* file name: ".expand("%")) 
	call append(line(".")+1, "* author: lalala") 
	call append(line(".")+2, "* mail: ") 
	call append(line(".")+3, "* introduction: ") 
	call append(line(".")+4, "* created time: ".strftime("%c")) 
	call append(line(".")+5, "*************************************************************************/") 
	call append(line(".")+6, "#include <stdio.h>")
	call append(line(".")+7, "")
	call append(line(".")+8, "int main(int argc, char *argv[])")
	call append(line(".")+9, "{")
	call append(line(".")+10, "")
	call append(line(".")+11, "    return 0;")
	call append(line(".")+12, "}")
	normal 15j
endfunc 
" ******************************************************************************
func Set_h_Title()
	if &filetype == 'cpp' 
		call setline(1, "#ifndef __" . toupper(split(expand("%:t"),'\.')[0]) . "_H__") 
		call append(line("."), "#define __" . toupper(split(expand("%:t"),'\.')[0]) . "_H__") 
		call append(line(".")+1, "") 
		call append(line(".")+2, "") 
		call append(line(".")+3, "") 
		call append(line(".")+4, "") 
		call append(line(".")+5, "") 
		call append(line(".")+6, "#endif") 
	endif
	normal 2j
endfunc

" ******************************************************************************
func Set_sh_Title() 
	if &filetype == 'sh' 
		call setline(1,"\#########################################################################") 
		call append(line("."), "\# File Name: ".expand("%")) 
		call append(line(".")+1, "\# Author: lalala") 
		call append(line(".")+2, "\# mail: ") 
		call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "\#########################################################################") 
		call append(line(".")+5, "\#!/bin/bash") 
		call append(line(".")+6, "") 
	else 
	endif
	normal G
endfunc 

" ******************************************************************************
func Set_py_Title() 
	if &filetype == 'py' 
		call setline(1,"\#########################################################################") 
		call append(line("."), "\# File Name: ".expand("%")) 
		call append(line(".")+1, "\# Author: lalala") 
		call append(line(".")+2, "\# mail: ") 
		call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
		call append(line(".")+4, "\#########################################################################") 
		call append(line(".")+5, "\#!/usr/bin/python3") 
		call append(line(".")+6, "") 
	else 
	endif
	normal G
endfunc 
