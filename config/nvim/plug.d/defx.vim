" defx *************************************************************************
nnoremap rm :Defx<cr>
" autocmd VimEnter * if argc() == 0 | :Defx | endif
call defx#custom#option('_', {
	\ 'columns': 'mark:git:icons:filename:type:size:time',
	\ 'ignored_files':
	\     '*.swp,*.o,*.cmd,.*',
	\ 'buffer_name': '',
	\ 'new': 1,
	\ 'auto_cd': 1
	\ })
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
	nnoremap <silent><buffer><expr> c
	\ defx#do_action('copy')
	nnoremap <silent><buffer><expr> m
	\ defx#do_action('move')
	nnoremap <silent><buffer><expr> p
	\ defx#do_action('paste')
	nnoremap <silent><buffer><expr> P
	\ defx#do_action('preview')
	nnoremap <silent><buffer><expr> K
	\ defx#do_action('new_directory')
	nnoremap <silent><buffer><expr> N
	\ defx#do_action('new_file')
	nnoremap <silent><buffer><expr> d
	\ defx#do_action('remove')
	nnoremap <silent><buffer><expr> r
	\ defx#do_action('rename')
	nnoremap <silent><buffer><expr> !
	\ defx#do_action('execute_command')
	nnoremap <silent><buffer><expr> yy
	\ defx#do_action('yank_path')
	nnoremap <silent><buffer><expr> .
	\ defx#do_action('toggle_ignored_files')
	nnoremap <silent><buffer><expr> q
	\ defx#do_action('quit')
	nnoremap <silent><buffer><expr> <Space>
	\ defx#do_action('toggle_select') . 'j'
	nnoremap <silent><buffer><expr> *
	\ defx#do_action('toggle_select_all')
	nnoremap <silent><buffer><expr> cd
	\ defx#do_action('cd', ['/home/sv'])
	nnoremap <silent><buffer><expr> <CR>
	\ defx#do_action('open')
	nnoremap <silent><buffer><expr> l
	\ defx#do_action('open')
	nnoremap <silent><buffer><expr> h
	\ defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> j
	\  'j'
	nnoremap <silent><buffer><expr> k
	\  'k'
endfunction

" defx-icons *******************************************************************
let g:defx_icons_directory_icon = '+'
let g:defx_icons_parent_icon = '<<'
let g:defx_icons_default_icon = ' '
let g:defx_icons_copy_icon = ' '
let g:defx_icons_link_icon = ' '
let g:defx_icons_move_icon = ' '
let g:defx_icons_directory_symlink_icon = ' '

" defx-git *..******************************************************************
call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : 'm',
  \ 'Staged'    : 's',
  \ 'Untracked' : 'u',
  \ 'Renamed'   : ' ',
  \ 'Unmerged'  : '>',
  \ 'Ignored'   : 'i',
  \ 'Deleted'   : 'x',
  \ 'Unknown'   : '?'
  \ })

