" gutentags *************************************************************
let g:gutentags_project_root = ['compile_commands.json', '.git']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_add_default_project_roots = 0
let g:gutentags_exclude_project_root = ['.project','.ignore_tags']
let g:gutentags_ctags_extra_args = [' -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ ']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_empty_buffer = 1
" let g:gutentags_ctags_extra_args += ['--c++-kinds=-mv']
" let g:gutentags_ctags_extra_args += ['--c-kinds=-mv']
au FileType gitcommit,gitrebase,json,vim,make,sh,markdown,conf 
			\let g:gutentags_enabled=0

" tagbar ***********************************************************************
let g:tagbar_sort = 0
let g:tagbar_autoclose = 1
let g:tagbar_show_balloon = 0
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_silent=1

