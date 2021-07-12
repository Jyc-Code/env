" vim-signify ******************************************************************
nnoremap fd :SignifyDiff<cr>    
nmap fj <plug>(signify-next-hunk)    
nmap fk <plug>(signify-prev-hunk)    
let g:signify_vcs_list = ['git','svn']
