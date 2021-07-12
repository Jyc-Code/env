map <c-]> g<c-]>
map J j
" 宏录制于退出冲突
nnoremap Q q

nnoremap <c-k> 6k
nnoremap <c-j> 6j
nnoremap <c-h> 10h
nnoremap <c-l> 10l
vnoremap <c-k> 6k
vnoremap <c-j> 6j
vnoremap <c-h> 10h
vnoremap <c-l> 10l
inoremap <c-k> <up>
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-l> <right>

nnoremap q :q!<cr>
nnoremap S :w<cr>
nnoremap Z :wq!<cr>

nnoremap gw <c-w>w
" nnoremap gs :split<cr>
nnoremap gv :vsplit<cr>
nnoremap <c-t> :%s/<C-R>=expand("<cword>")<cr>//g<left><left>
vnoremap <c-t> y:%s/<C-R>"//g<left><left>
vnoremap <c-f> y:/<C-R>"<cr>

nnoremap zo A{<esc>o}<esc>O
nnoremap zi A{<esc>o};<esc>O
nnoremap z; A;<esc>
inoremap zo <esc>A{<esc>o}<esc>O
inoremap zi <esc>A{<esc>o};<esc>O
inoremap z; <esc>A;<esc>
vnoremap z( s()<esc><left>p
vnoremap z' s''<esc><left>p
vnoremap z" s""<esc><left>p

" 行首
nnoremap gh ^
" 查找光标所在词
nnoremap gj *
" 行尾
nnoremap gk $
" 匹配括号（<> () [] {}）
nnoremap gl %
inoremap gj *
inoremap gk $
inoremap gl %
inoremap <c-o> <esc>o
" 显示c函数
nnoremap ff :call ShowFuncName() <CR>
nnoremap ft :!<space>/home/lalala/tools/env/ctags_highlight_c.sh<cr><cr>
"*************************************************************************
let &fcs='eob: '
set path+=/usr/include

set fencs=utf-8,ucs-bom,shift-jis,gbk,gb2312,gb18030,cp936,ansi,latin1
set termencoding=utf-8,gbk
set encoding=utf-8
" set fileencodings=utf-8,gbk

set nobackup
set undofile
set noswapfile
set directory=.
set udir=~/.local/share/nvim/undo//
" set bdir=~/.local/share/nvim/backup//
set hidden
set shortmess+=c
set updatetime=100
set cscopetag
" 行号配置
set number " 显示行号

set t_ut= " 防止vim背景颜色错误
set clipboard+=unnamedplus
" 调整将tab设置为4个空格的长度
set tabstop=4
set noexpandtab " noexpandtab 空格替换为tab

set numberwidth=4
set shiftwidth=4
set softtabstop=4
set smarttab
set showcmd
set scrolloff=15
set autoread
set autoindent "设置c语言自动对齐
set syntax=enable
set history=1000
set hlsearch " nohlsearch

" 启用鼠标
set mouse=a

" 默认进行大小写不敏感查找
set ignorecase
" 有大写时进行大小写敏感查找
set smartcase

set smartindent
filetype on
filetype plugin on
filetype indent on
" let g:ruby_host_prog = '/home/sv/.gem/ruby/2.7.0/bin/neovim-ruby-host'
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 搜索颜色设置
" highlight Search ctermbg=yellow ctermfg=black 
" highlight IncSearch ctermbg=black ctermfg=yellow 
" highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE
"theme*********************************************************************
"colorscheme darkblue
colorscheme space-vim-dark
hi Normal  guibg=NONE guibg=NONE
hi LineNr  guibg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
" statusline *************************************************************
set statusline=%1*\%<%.50F\             "显示文件名和文件路径 (%<应该可以去掉)
set statusline+=%=%2*\%y%m%r%h%w\ %*        "显示文件类型及文件状态
set statusline+=%3*\ %{&ff}\[%{&fenc}]\ %*   "显示文件编码类型
" set statusline+=%4*\ row:%l/%L,col:%c\ %*   "显示光标所在行和列
set statusline+=%4*\ %L/col:%c\%*   "显示光标所在行和列
set statusline+=%5*\%3p%%\%*            "显示光标前文本所占总文本的比例
set statusline+=%6*\ %{gutentags#statusline('[',']')}\%*
if has("termguicolors")
	set termguicolors
	hi User1 gui=none guifg=red guibg=none
	hi User2 gui=none guifg=yellow guibg=none
	hi User3 gui=none guifg=blue guibg=none
	hi User4 gui=none guifg=pink guibg=none
	hi User5 gui=none guifg=0 guibg=none
	hi User6 gui=none guifg=green guibg=none
else
	hi User1 cterm=none ctermfg=red ctermbg=none
	hi User2 cterm=none ctermfg=208 ctermbg=none
	hi User3 cterm=none ctermfg=169 ctermbg=none
	hi User4 cterm=none ctermfg=100 ctermbg=none
	hi User5 cterm=none ctermfg=green ctermbg=none
endif

hi LineNr guifg=0
" coc-highlight cursor *************************************************
hi CursorColumn guifg=#FF1493 gui=bold guibg=none
autocmd VimEnter * hi CocHighlightText guifg=#FF1493 gui=bold
"**********************************************************************
autocmd BufNewFile *.c exec ":call Set_C_Title()" 
autocmd BufNewFile *.sh exec ":call SetTitle()" 
autocmd BufNewFile *.h exec ":call Set_H_Title()"

func SetTitle() 
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
func Set_C_Title() 
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

func Set_H_Title()
	call setline(1,"/************************************************************************") 
	call append(line("."), "* file name: ".expand("%")) 
	call append(line(".")+1, "* author: lalala") 
	call append(line(".")+2, "* mail: ") 
	call append(line(".")+3, "* introduction: ") 
	call append(line(".")+4, "* created time: ".strftime("%c")) 
	call append(line(".")+5, "*************************************************************************/") 
	call append(line(".")+6, "#ifndef __" . toupper(split(expand("%:t"),'\.')[0]) . "_H__") 
	call append(line(".")+7, "#define __" . toupper(split(expand("%:t"),'\.')[0]) . "_H__") 
	call append(line(".")+8, "") 
	call append(line(".")+9, "") 
	call append(line(".")+10, "") 
	call append(line(".")+11, "") 
	call append(line(".")+12, "") 
	call append(line(".")+13, "#endif") 
	normal 15j
endfunc

fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
