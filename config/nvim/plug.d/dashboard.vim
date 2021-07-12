" telescope
" lua require'telescope'.load_extension('project')

" dashboard
nnoremap <silent> ff :DashboardFindHistory<CR>
" nnoremap <silent> ff :DashboardFindFile<CR>
nnoremap <silent> rs :DashboardChangeColorscheme<CR>
nnoremap <silent> rw :DashboardFindWord<CR>
" nnoremap <silent> fb :DashboardJumpMark<CR>
nnoremap <silent> rc :DashboardNewFile<CR>

let g:dashboard_default_executive ='telescope'
let g:dashboard_custom_section={
  \ '2find_word': {
      \ 'description': ['2 Find word                             rw'],
      \ 'command': 'DashboardFindWord',
  \ },
  \ '3book_marks': {
      \ 'description': ['3 Jump to bookmarks                       '],
      \ 'command': 'DashboardJumpMarks',
  \ },
  \ '4change_colorscheme': {
      \ 'description': ['4 Change colorscheme                    rs'],
      \ 'command': 'DashboardChangeColorscheme',
  \ },
  \ '5new_file': {
      \ 'description': ['5 New file                              rc'],
      \ 'command': 'DashboardNewFile',
  \ },
  \ '6find_file': {
      \ 'description': ['6 Find file                               '],
      \ 'command': 'DashboardFindFile',
  \ },
  \ '1find_history': {
      \ 'description': ['1 Recently opened files                 ff'],
      \ 'command': 'DashboardFindHistory',
  \ },
\}

