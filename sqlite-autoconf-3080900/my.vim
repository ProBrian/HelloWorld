let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 ~/CodeDir/sqlite-autoconf-3080900/shell.c
badd +6 ~/CodeDir/sqlite-autoconf-3080900/sqlite3.c
badd +3 ~/CodeDir/sqlite-autoconf-3080900/sqlite3.h
args ~/CodeDir/sqlite-autoconf-3080900/shell.c
edit ~/CodeDir/sqlite-autoconf-3080900/sqlite3.c
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
wincmd =
argglobal
let s:l = 69 - ((44 * winheight(0) + 23) / 47)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
69
normal! 012|
wincmd w
argglobal
edit ~/CodeDir/sqlite-autoconf-3080900/sqlite3.h
let s:l = 6 - ((4 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
6
normal! 02|
wincmd w
argglobal
edit ~/CodeDir/sqlite-autoconf-3080900/shell.c
let s:l = 1 - ((0 * winheight(0) + 11) / 23)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
wincmd w
wincmd =
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
