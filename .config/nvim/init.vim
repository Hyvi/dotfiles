set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

" In your init.lua or init.vim
set termguicolors

lua << EOF
require("bufferline").setup{}
EOF

lua require('plugins')

" vim: foldmethod=marker ts=2 sw=2 et
