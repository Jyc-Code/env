set shortmess+=c
set completeopt=menuone,noselect
" set autochdir
set nofoldenable
set fencs=utf-8,ucs-bom,shift-jis,gbk,gb2312,gb18030,cp936,ansi,latin1
set termencoding=gbk,utf-8
set encoding=utf-8
set cmdheight=1
set textwidth=90
set nobackup
set noswapfile
set directory=.
set hidden
" 行号配置
set number " 显示行号
set clipboard+=unnamedplus
set tabstop=4
set numberwidth=4
set shiftwidth=4
set softtabstop=4
" 调整将tab设置为4个空格的长度
set tabstop=4
set noexpandtab " noexpandtab 空格替换为tab

set smarttab
set showcmd
set scrolloff=15
set autoread
set syntax=enable
set history=1000
set hlsearch
set ignorecase

" 启用鼠标
set mouse=a

" 默认进行大小写不敏感查找
set ignorecase
" 有大写时进行大小写敏感查找
set smartcase

set smartindent
if has("persistent_undo")
   let target_path = expand('~/.cache/nvim/undo//')
    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif
    let &undodir=target_path
    set undofile
endif

" ******************************************************************************
let &fcs='eob: '
let g:python_host_prog = "/usr/bin/python2"
let g:python3_host_prog = "/usr/bin/python3"

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
