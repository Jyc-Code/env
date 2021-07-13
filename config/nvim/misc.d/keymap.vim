" nvim-compe*****************************************
" inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
" inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" general********************************************
" let g:mapleader="\<Space>"
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

" nvim buffer 
nnoremap bd :bd<cr>
nnoremap bl :ls<cr>
" nnoremap g
nnoremap gw <c-w>w
" nnoremap gs :split<cr>
nnoremap gv :vsplit<cr>
nnoremap <c-t> :%s/<C-R>=expand("<cword>")<cr>//g<left><left>
vnoremap <c-t> y:%s/<C-R>"//g<left><left>
vnoremap <c-f> y:/<C-R>"<cr>

nnoremap ro o<esc>A{<esc>o}<esc>O
nnoremap rO A{<esc>o};<esc>O
nnoremap r; A;<esc>
vnoremap r( s()<esc><left>p
vnoremap r' s''<esc><left>p
vnoremap r" s""<esc><left>p
nnoremap <c-]> g<c-]>

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
