" nvim-gdb *********************************************************************
nnoremap gb :GdbStart gdb -q ./
let g:nvimgdb_config_override = {
	\ 'sign_current_line': 'o>',
	\ 'sign_breakpoint': [ '*', '1*', '2*', '3*'],
	\ 'sign_breakpoint_priority': 10,
	\ 'termwin_command': 'belowright new',
	\ 'codewin_command': 'new',
	\ 'set_scroll_off': 5,
	\ 'jump_bottom_gdb_buf': v:true,
	\ }
