" tcomment_vim *****************************************************************
" autocmd FileType c let g:tcomment#options = {'count': 2}
autocmd FileType cpp let g:tcomment#options = {'as': 'c'}
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

