set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

lua require("nvim-treesitter.install").prefer_git = true

lua require('plugins')

" vim: foldmethod=marker ts=2 sw=2 et

