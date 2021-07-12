" let mapleader=","

call plug#begin('~/.config/nvim/autoload')
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'tomtom/tcomment_vim'
Plug 'babaybus/DoxygenToolkit.vim'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'luochen1990/rainbow'
Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/space-vim-dark'
Plug 'jackguo380/vim-lsp-cxx-highlight'

" 缩进
Plug 'Yggdroot/indentLine'

"标签栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
" tcomment_vim *****************************************************************
" let g:tcomment#block_fmt_c please modify
" .config/nvim/autoload/tcomment_vim/autoload/tcomment.vim
let g:tcomment_maps = 0
let g:tcomment_mapleader1 = ''
let g:tcomment_mapleader2 = ''
let g:tcomment_opleader1 = ''
let g:tcomment_mapleader_uncomment_anyway = ''
let g:tcomment_mapleader_comment_anyway = ''
let g:tcomment_map_modifier = ''
let g:tcomment_opmap_modifier = ''
vnoremap gc :TCommentBlock<cr>
nnoremap gc :TComment<cr>

" DoxygenToolkit.vim ***********************************************************
let g:DoxygenToolkit_authorName=":lalala"
nnoremap bb :Dox<cr>
nnoremap ba :DoxAuthor<cr>
" vim-signify ******************************************************************
nnoremap fd :SignifyDiff<cr>    
" hunk jumping    
nmap fj <plug>(signify-next-hunk)    
nmap fk <plug>(signify-prev-hunk)    
let g:signify_vcs_list = ['git','svn']

" git rev-parse --show-toplevel*****************************************
let g:grepper = {}
let g:grepper.dir = 'repo'
let g:grepper.repo = ['.git', '.svn']
let g:grepper.highlight = 1
nnoremap ga :Grepper -tool ag -cword -noprompt<cr>

" gutentags*************************************************************
let g:gutentags_project_root = ['.svn','.git']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_add_default_project_roots = 0
" '.svn'
let g:gutentags_exclude_project_root = ['.root' , '.project']
let g:gutentags_ctags_exclude = ["*.json"]
let g:gutentags_ctags_extra_args = [' -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ ']
" let g:gutentags_ctags_extra_args += ['--c++-kinds=-mv']
" let g:gutentags_ctags_extra_args += ['--c-kinds=-mv']
au FileType gitcommit,gitrebase let g:gutentags_enabled=0
" let g:gutentags_generate_on_write = 0
let g:gutentags_auto_add_gtags_cscope = 0
" let g:gutentags_generate_on_new = 1

"coc**********************************************************************
let g:coc_global_extensions = [
			\'coc-python', 
			\'coc-json', 
			\'coc-browser', 
			\'coc-calc', 
			\'coc-java', 
			\'coc-floaterm',
			\'coc-translator', 
			\'coc-diagnostic', 
			\'coc-snippets',
			\'coc-highlight',
			\'coc-pairs']
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" coc highlight
autocmd CursorHold * silent call CocActionAsync('highlight')
" coc translator
nmap tt <Plug>(coc-translator-p)
vmap tt <Plug>(coc-translator-pv)
"rainbow******************************************************************
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}
"**************************************************************************

" indentLine 需要空格才能正常显示******************************************
let g:indent_guides_guide_size  = 1
let g:indent_guides_start_level = 1
let g:indentLine_setColors = 1 " 设置覆盖式颜色enable
let g:indentLine_color_term = 239

nnoremap g\ :IndentLinesToggle<cr> " 启用/关闭
"**************************************************************************

" vim-airline**************************************************************
" 设置状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'murmur'  " 主题 murmur desertink
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap g1 <Plug>AirlineSelectTab1
nmap g2 <Plug>AirlineSelectTab2
nmap g3 <Plug>AirlineSelectTab3
nmap g4 <Plug>AirlineSelectTab4
nmap g5 <Plug>AirlineSelectTab5
nmap g6 <Plug>AirlineSelectTab6
nmap g7 <Plug>AirlineSelectTab7
nmap g8 <Plug>AirlineSelectTab8
nmap g9 <Plug>AirlineSelectTab9
" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
nmap g- <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
nmap g+ <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap gq :bp<cr>:bd #<cr>
" 修改了一些个人不喜欢的字符
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'Ml' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR"
"**************************************************************************

source /home/lalala/.config/nvim/lalala.vim
