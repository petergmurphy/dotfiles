let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Projects/dotfiles/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +11 ~/Projects/dotfiles/nvim/after/plugin/lsp.lua
badd +1 after/plugin/fugative.lua
badd +22 ~/Projects/dotfiles/nvim/Session.vim
badd +22 lua/peter/packer.lua
badd +1 ~/Projects/dotfiles/nvim/
badd +18 lua/peter/set.lua
badd +1 after/plugin/harpoon.lua
badd +9 lua/peter/remap.lua
badd +1 init.lua
badd +10 ~/.config/nvim/lua/peter/init.lua
badd +1 ~/Projects/dotfiles/nvim/after/plugin/autoclose.lua
badd +20 ~/Projects/dotfiles/nvim/after/plugin/lualine.lua
argglobal
%argdel
$argadd ~/Projects/dotfiles/nvim/
edit lua/peter/packer.lua
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
1,15fold
28,195fold
let &fdl = &fdl
let s:l = 22 - ((14 * winheight(0) + 14) / 28)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 22
normal! 06|
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
