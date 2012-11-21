call pathogen#infect()
syntax on
filetype on 
filetype plugin on
filetype indent on

"set list
"set listchars=tab:\|\ ,trail:-,nbsp:_
"
"au BufReadPost * if line("'\"") > 0|if line("'\”") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endifset viminfo='1000,f1,<500
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

nmap <F2> a<C-R>=strftime("%c")<CR><Esc>
vmap <c-c> "+y
set ai
set nu
" http://stackoverflow.com/questions/69998/tabs-and-spaces-in-vim
set shiftwidth=4
set tabstop=4
set expandtab
"set cursorline
"set cursorcolumn
let g:JSLintHighlightErrorLine = 0
let g:NERDTreeHighlightCursorline = 0

" system clipboard  http://vim.wikia.com/wiki/Accessing_the_system_clipboard
"copy
vmap <F7> "+ygv"zy`>
"paste (Shift-F7 to paste after normal cursor, Ctrl-F7 to paste over visual selection)
nmap <F7> "zgP
nmap <S-F7> "zgp
imap <F7> <C-r><C-o>z
vmap <C-F7> "zp`]
cmap <F7> <C-r><C-o>z
"copy register
autocmd FocusGained * let @z=@+
set tags=./tags;
set mousefocus

" switch between vim window splits easily 
" http://vim.wikia.com/wiki/Switch_between_Vim_window_splits_easily
set wmw=5
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_

set foldmethod=marker

" http://vim.wikia.com/wiki/Alternative_tab_navigation
" tab navigation like firefox
nmap th :tabfirst<CR>
nmap tj :tabnext<CR>
"map tk :tabprevious<CR>
nmap tl :tablast<CR>
nmap tk  <Esc>:tabprevious<CR>
"imap tj <Esc>:tabnext<CR>i
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>
nmap ff :s/>\s*</>\r</g<CR>

" per configuration file in vim 
" http://pookey.co.uk/wordpress/archives/22-per-file-configuration-in-vim-the-modeline
set modeline

"set g:github_user = Hyvi
"let g:jquery_doc_mapping='<C-j>'

