" ******************************************************************************
call plug#begin('~/.config/nvim/autoload')
Plug 'luochen1990/rainbow' " color ()
Plug 'tomtom/tcomment_vim' " comment
Plug 'vivy89/DoxygenToolkit.vim'
Plug 'mhinz/vim-signify' " view git/svn sign at left
Plug 'preservim/tagbar'
Plug 'ludovicchabant/vim-gutentags' " create tags
Plug 'drewtempelmeyer/palenight.vim' " theme
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' } " file browser
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
Plug 'mbbill/undotree'
Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }
Plug 'liuchengxu/vim-which-key'
Plug 'ferrine/md-img-paste.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'voldikss/vim-codelf'
Plug 'glepnir/dashboard-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-project.nvim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-translator'
Plug 'jiangmiao/auto-pairs'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'L3MON4D3/LuaSnip'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'} " statusline
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
" 缩进
Plug 'Yggdroot/indentLine'

"标签栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
" ******************************************************************************

nmap <silent> rt <Plug>TranslateW
vmap <silent> rt <Plug>TranslateWV

lua require('lsp')
lua require('statusline')
lua require('hl')
lua require('lsputil')

" indentLine 需要空格才能正常显示******************************************
let g:indent_guides_guide_size  = 1
let g:indent_guides_start_level = 1
let g:indentLine_setColors = 1 " 设置覆盖式颜色enable
let g:indentLine_color_term = 239

nnoremap g\ :IndentLinesToggle<cr> " 启用/关闭
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
" theme *********************************************************************
set background=dark
colorscheme palenight
hi Normal  guibg=NONE guibg=NONE
hi LineNr  guibg=NONE guifg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
set statusline=%1*\\      
set termguicolors
" hi User1 gui=none guifg=red guibg=none

" *.vim ************************************************************************
source /home/lalala/.config/nvim/plug.d/undo.vim
source /home/lalala/.config/nvim/plug.d/git.vim
source /home/lalala/.config/nvim/plug.d/defx.vim
source /home/lalala/.config/nvim/plug.d/rainbow.vim
source /home/lalala/.config/nvim/plug.d/tcomment.vim
source /home/lalala/.config/nvim/plug.d/tags.vim
source /home/lalala/.config/nvim/plug.d/nvimgdb.vim
source /home/lalala/.config/nvim/plug.d/markdown.vim
source /home/lalala/.config/nvim/plug.d/dashboard.vim

source /home/lalala/.config/nvim/misc.d/config.vim
source /home/lalala/.config/nvim/misc.d/fun.vim
source /home/lalala/.config/nvim/misc.d/keymap.vim
