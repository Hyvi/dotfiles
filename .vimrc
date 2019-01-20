" # 上面插件安装完成之后执行下面内容
" # command-t 文件搜索插件安装
" $ cd ~/.vim/plugged/command-t 
" $ rake make
" 
" # 搜索文本内容工具
" # 需要安装 CtrlSF的依赖ripgrep
" $ brew install ripgrep
" 
" # 代码提示插件也需要你运行安装哦，不然没有效果嘞
" $ cd ~/.vim/plugged/YouCompleteMe
" $ ./install.py
" # or 新版脚本过时了，推荐上面脚本
" $ ./install.sh 
" 
" # 需要安装ctags 不然配置没效果哦
" # ctags for Mac
" $ brew install ctags
" # ctags for Centos7
" $ yum install ctags
" 
let mapleader=";"
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" theme
Plugin 'altercation/vim-colors-solarized'
Plugin 'dracula/vim'
" Plugin 'tomasr/molokai'
 
" edit
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
" 随键而全的、支持模糊搜索的、高速补全的插件
" YCM 由 google 公司搜索项目组的软件工程师 Strahinja Val Markovic 所开发
Plugin 'Valloric/YouCompleteMe' 
Plugin 'wincent/command-t'
Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'dyng/ctrlsf.vim'
Plugin 'Valloric/MatchTagAlways'

" vue
Plugin 'posva/vim-vue'
" md
Plugin 'plasticboy/vim-markdown'
" git 
Plugin 'airblade/vim-gitgutter'
" go 
Plugin 'fatih/vim-go'
" check
Plugin 'vim-syntastic/syntastic'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'NLKNguyen/papercolor-theme'
" Plugin 'vim-python/python-syntax'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" syntax highlight

filetype on
syntax  on

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
let g:vim_markdown_folding_disabled = 1


"----------------------------------------------
" Colors
"----------------------------------------------
" color dracula
colorscheme PaperColor
set background=dark

"----------------------------------------------
" General settings
"----------------------------------------------
set nocompatible                  " be iMproved, required
set backspace=indent,eol,start
set autoread                      " reload file if the file changes on the disk
set laststatus=2                  " https://github.com/jaywcjlove/vim-web/blob/master/.vimrc
set ruler
set number
" set cursorline
set cursorcolumn
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set ignorecase
"set foldmethod=syntax
set foldmethod=indent
set foldlevel=20
set list                          " show trailing whitespace
set listchars=tab:\|\ ,trail:▫

"----------------------------------------------
" Searching
"----------------------------------------------
set hlsearch                      " disable search result highlighting
set incsearch                     " move to match as you type the search query


let g:gitgutter_escape_grep = 1

" 恢复上次文件打开位置
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif 


vnoremap <Leader>y "+y            " 设置快捷键将选中文本块复制至系统剪贴板
nnoremap <Leader>p "+p            " 设置快捷键将系统剪贴板内容粘贴至vim

nnoremap <Leader>q :q<CR>         " 定义快捷键关闭当前分割窗口
nnoremap <Leader>w :w<CR>         " 定义快捷键保存当前窗口内容
nnoremap <Leader>WQ :wa<CR>:q<CR> " 定义快捷键保存所有窗口内容并退出 vim
nnoremap <Leader>Q :qa!<CR>       " 不做任何保存，直接退出 vim

" 设置快捷键遍历子窗口
" nnoremap nw <C-W><C-W>        " 依次遍历,这样设置影响·n·跳转到下一个的速度
nnoremap <Leader>lw <C-W>l    " 跳转至右方的窗口
nnoremap <Leader>hw <C-W>h    " 跳转至方的窗口
nnoremap <Leader>kw <C-W>k    " 跳转至上方的子窗口
nnoremap <Leader>jw <C-W>j    " 跳转至下方的子窗口

nmap <Leader>M %              " 定义快捷键在结对符之间跳转



" 快速开关注释
" Plug 'scrooloose/nerdcommenter'

" 在注释符默认添加空格
let g:NERDSpaceDelims = 1
" 使用紧凑语法美化多行注释
let g:NERDCompactSexyComs = 1
" 将行注释符左对齐而不是下面的代码缩进
let g:NERDDefaultAlign = 'left'
" 设置语言默认使用备用定界符
let g:NERDAltDelims_java = 1
" 添加自定义格式或覆盖默认值。
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" 允许注释和转换空行（注释区域时有用）
let g:NERDCommentEmptyLines = 1
" 启用时修整尾随空格注释
let g:NERDTrimTrailingWhitespace = 1



" 工程文件浏览

" 查看工程文件列表
" Plug 'scrooloose/nerdtree'
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>

" NERDTree: File highlighting 文件列表，文件名字各种颜色高亮
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade',   'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('md',     'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml',    'magenta', 'none', 'yellow', '#E70350')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf',   'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json',   'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html',   'green', 'none', 'green', '#04E703')
call NERDTreeHighlightFile('styl',   'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css',    'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js',     'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php',    'Magenta', 'none', '#ff00ff', '#151515')

" 设置 NERDTree 子窗口宽度
let NERDTreeWinSize=32
" 设置 NERDTree 子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=0
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 根据后缀隐藏文件
let NERDTreeIgnore = ['\.pyc$']



" YCM 补全

" 随键而全的、支持模糊搜索的、高速补全的插件
" YCM 由 google 公司搜索项目组的软件工程师 Strahinja Val Markovic 所开发
" Plug 'Valloric/YouCompleteMe'
" YCM 补全菜单配色
" 菜单
" highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
" highlight PmenuSel term=bold ctermbg=darkred guibg=#13354A


" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1

" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0

" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=0
"" 引入 C++ 标准库 tags
"set tags+=/data/misc/software/app/vim/stdcpp.tags
"set tags+=/data/misc/software/app/vim/sys.tags

" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>

" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview

" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=3

" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0

" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

" 跳转到定义GoToDefinition
" 跳转到声明GoToDeclaration
" 以及两者的合体GoToDefinitionElseDeclaration
"
" YCM提供的跳跃功能采用了vim的jumplist，往前跳和往后跳的快捷键为Ctrl+O以及Ctrl+I。
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 标签列表

" Plug 'majutsushi/tagbar'
" 基于标签的标识符列表插件
" 需要安装ctags `brew install ctags`
" 安装ctags 之后签列表子窗口才能出现

let tagbar_right=1                      " 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_width=32                    " 设置标签子窗口的宽度
let g:tagbar_compact=1                 " tagbar 子窗口中不显示冗余帮助信息
nnoremap <Leader>ilt :TagbarToggle<CR> " 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag

" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_css = {
\ 'ctagstype' : 'Css',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

" 查找

" 上下文插件，例如搜素到关键字，中间缩略，展示一段上下文
" Plug 'dyng/ctrlsf.vim'
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。
" 快捷键速记法：search in project
let g:ctrlsf_ackprg = 'rg' 
nnoremap <Leader>sp :CtrlSF<CR>
let g:ctrlsf_auto_close = 1
" 选中搜索 - 文本中选中关键字
vmap     <Leader>sp <Plug>CtrlSFVwordPath
" 选中搜索 - 结果列表
vmap     <Leader>sl <Plug>CtrlSFQuickfixVwordPath
vmap     <Leader>sL <Plug>CtrlSFQuickfixVwordExec
" CtrlSF Widnow 打开／关闭切换
vmap     <Leader>st :CtrlSFToggle<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
nmap     <C-F>f <Plug>CtrlSFPrompt
" 预设视图 normal/compact
let g:ctrlsf_default_view_mode = 'normal'
" g:ctrlsf_default_root defines how CtrlSF find search root when no explicit
" path is given. Two possible values are cwd and project. cwd means current
" working directory and project means project root. CtrlSF locates project
" root by searching VCS root (.git, .hg, .svn, etc.)
let g:ctrlsf_default_root = 'project'


" 批量编辑 multiple selections vor vim
" Plugin 'terryma/vim-multiple-cursors'
" 
" Default mapping
" let g:multi_cursor_next_key='<C-n>'
" let g:multi_cursor_prev_key='<C-p>'
" let g:multi_cursor_skip_key='<C-x>'
" let g:multi_cursor_quit_key='<Esc>'


"vim-snippets / UltiSnip

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Valloric/MatchTagAlways

" This option holds all the filetypes for which this plugin will try to find and highlight enclosing tags.
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'vue' : 1,
    \}

"  Jumps to the enclosing tag if the tag is visible
nnoremap <leader>% :MtaJumpToOtherTag<cr>


" posva/vim-vue
" My syntax highlighting stops working randomly
autocmd FileType vue syntax sync fromstart
" autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

"  How can I use NERDCommenter in Vue files?
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

" highlight GitGutterAdd ctermfg=White
" highlight GitGutterDelete ctermfg=White
" highlight GitGutterChange ctermfg=White

highlight GitGutterAdd ctermbg=Green
highlight GitGutterDelete ctermbg=Red
highlight GitGutterChange ctermbg=Yellow
let g:gitgutter_grep=''
let g:gitgutter_terminal_reports_focus=0
set updatetime=100


" Syntastic Recommended settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"----------------------------------------------
" Language: Golang
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Mappings
au FileType go nmap <F9> :GoCoverageToggle -short<cr>
au FileType go nmap <F10> :GoTest -short<cr>
au FileType go nmap <F12> <Plug>(go-def)
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <leader>gt :GoDeclsDir<cr>
au FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
au FileType go nmap <leader>gd <Plug>(go-def)
au FileType go nmap <leader>gdv <Plug>(go-def-vertical)
au FileType go nmap <leader>gdh <Plug>(go-def-horizontal)
au FileType go nmap <leader>gD <Plug>(go-doc)
au FileType go nmap <leader>gDv <Plug>(go-doc-vertical)

" Run goimports when running gofmt
let g:go_fmt_command = "goimports"

" Set neosnippet as snippet engine
let g:go_snippet_engine = "neosnippet"

" Enable syntax highlighting per default
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

" Show type information
let g:go_auto_type_info = 1

" Highlight variable uses
let g:go_auto_sameids = 1

" Fix for location list when vim-go is used together with Syntastic
let g:go_list_type = "quickfix"

" gometalinter configuration
let g:go_metalinter_command = ""
let g:go_metalinter_deadline = "5s"
let g:go_metalinter_enabled = [
    \ 'deadcode',
    \ 'errcheck',
    \ 'gas',
    \ 'goconst',
    \ 'gocyclo',
    \ 'golint',
    \ 'gosimple',
    \ 'ineffassign',
    \ 'vet',
    \ 'vetshadow'
\]

" Set whether the JSON tags should be snakecase or camelcase
let g:go_addtags_transform = "snakecase"
let g:go_metalinter_autosave = 1

"----------------------------------------------
" Language: Python
"----------------------------------------------
au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4
