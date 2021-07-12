" markdown-preview *************************************************************
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1

function! g:Open_in_new_window(url)
    silent exe '!google-chrome-stable --new-window ' . a:url
endfunction
let g:mkdp_browserfunc='g:Open_in_new_window'

" md-img-paste *****************************************************************
autocmd FileType markdown nmap <buffer><silent> rp :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = '.img'
