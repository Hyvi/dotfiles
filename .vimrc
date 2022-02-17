" how to configure vim {{{
" # 上面插件安装完成之后执行下面内容

" # 搜索文本内容工具
" # 需要安装 CtrlSF的依赖ripgrep
" $ brew install ripgrep
"
" }}}
let mapleader=";"
" filetype off                  " required

" Vundle Plugin {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" theme
Plugin 'challenger-deep-theme/vim', {'name': 'challenger-deep-theme'}

" edit
Plugin 'godlygeek/tabular'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'preservim/nerdcommenter'

Plugin 'preservim/vimux'
Plugin 'benmills/vimux-golang'

" 检索文件， 类似 IDE 的 Command + p
" Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" Plugin 'dyng/ctrlsf.vim'
Plugin 'Valloric/MatchTagAlways'

" md & 预览
Plugin 'plasticboy/vim-markdown'
Plugin 'ellisonleao/glow.nvim'

" git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'

" go  使用 coc 中 coc-go 插件
" Plugin 'fatih/vim-go'

" chinese 排版
Plugin 'hotoo/pangu.vim'

Plugin 'maxbrunsfeld/vim-yankstack'

" Mark command to highlight several words in different colors simultaneously
Plugin 'vim-scripts/Mark'

" window
Plugin 'wellle/visual-split.vim'

" Json
Plugin 'diepm/vim-rest-console'

" Plugin 'elzr/vim-json'

" nvim syntax highlight
" Plugin 'sheerun/vim-polyglot'
Plugin 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plugin 'neoclide/coc.nvim', {'branch': 'release'}

" nvim lsp 
" Plugin 'neovim/nvim-lspconfig'

" statusline 
Plugin 'itchyny/lightline.vim'

" nvim auto compeletion 
" Plugin 'hrsh7th/nvim-cmp'
" Plugin 'hrsh7th/cmp-nvim-lsp'
" Plugin 'saadparwaiz1/cmp_luasnip'
" Plugin 'L3MON4D3/LuaSnip'

Plugin 'folke/lua-dev.nvim'

Plugin 'skywind3000/asyncrun.vim'

Plugin 'freitass/todo.txt-vim'

" 多光标支持， TheCW bilibili 多光标
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}

" replacing tagbar , support LSP symbols
Plugin 'liuchengxu/vista.vim'

" fzf for vim 
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plugin 'junegunn/fzf.vim'

Plugin 'ojroques/nvim-lspfuzzy'

" 输入法莫斯自动切换设置 https://jdhao.github.io/2021/02/25/nvim_ime_mode_auto_switch/
Plugin 'rlue/vim-barbaric'

Plugin 'akinsho/bufferline.nvim'
" Nerdtree 字体图标
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" All of your Plugins must be added before the following line
call vundle#end()            " required
" }}}
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

syntax  on

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
let g:vim_markdown_folding_disabled = 1


"----------------------------------------------
" Colors {{{
"----------------------------------------------
colorscheme challenger_deep

if has('nvim') || has('termguicolors')
  set termguicolors
endif
"  }}}

"----------------------------------------------
" General settings {{{
"----------------------------------------------
set hidden
set nocompatible                  " be iMproved, required
set backspace=indent,eol,start
set autoread                      " reload file if the file changes on the disk
set laststatus=2                  " https://github.com/jaywcjlove/vim-web/blob/master/.vimrc
set ruler
set number
" set cursorline
" set cursorcolumn
set ignorecase
set foldenable
set foldmethod=syntax            " syntax marker
set foldlevel=20
set list                          " show trailing whitespace
set listchars=tab:\|\ ,trail:▫

set nobackup                      " no backup files
set noswapfile                    " no swap files
set nowritebackup                 " only in case you don't want a backup file while editing
set noundofile                    " no undo files
" }}}

"----------------------------------------------
" Searching
"----------------------------------------------
set hlsearch                      " disable search result highlighting
set incsearch                     " move to match as you type the search query

" This unsets the 'last search pattern' register by hitting return
nnoremap <silent>  <CR> :noh<CR><CR>



" 恢复上次文件打开位置
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" 恢复fold状态
" https://stackoverflow.com/questions/37552913/vim-how-to-keep-folds-on-save
augroup AutoSaveGroup
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  " BufHidden for compatibility with `set hidden`
  autocmd BufWinLeave,BufLeave,BufWritePost,BufHidden,QuitPre ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

vnoremap <Leader>y "+y            " 设置快捷键将选中文本块复制至系统剪贴板
nnoremap <Leader>p "+p            " 设置快捷键将系统剪贴板内容粘贴至vim

nnoremap <Leader>q :q<CR>         " 定义快捷键关闭当前分割窗口
nnoremap <Leader>w :w<CR>         " 定义快捷键保存当前窗口内容
nnoremap <Leader>WQ :wa<CR>:q<CR> " 定义快捷键保存所有窗口内容并退出 vim
nnoremap <Leader>Q :qa!<CR>       " 不做任何保存，直接退出 vim

" 设置快捷键遍历子窗口
" nnoremap nw <C-W><C-W>        " 依次遍历,这样设置影响·n·跳转到下一个的速度
nnoremap <C-L> <C-W>l    " 跳转至右方的窗口
nnoremap <C-H> <C-W>h    " 跳转至方的窗口
nnoremap <C-K> <C-W>k    " 跳转至上方的子窗口
nnoremap <c-J> <C-W>j    " 跳转至下方的子窗口

"  nmap <Leader>M %              " 定义快捷键在结对符之间跳转

" scrolling without changing cursors on-screen position
noremap <C-k> 2j2<C-e>
noremap <C-l> 2k2<C-y>

"" Buffer nav
noremap <leader>z :bp<CR>
" noremap <leader>q :bp<CR>
" noremap <leader>x :bn<CR>
" noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

let maplocalleader=","

" 快速开关注释 {{{
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

" }}}


" 工程文件浏览 {{{

" 查看工程文件列表
" Plug 'scrooloose/nerdtree'
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>

nnoremap <silent> <F2> :NERDTreeFind<CR>

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
let NERDTreeWinSize=50
" 设置 NERDTree 子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=0
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 根据后缀隐藏文件
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['node_modules','\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*node_modules/

" }}}

" nerdtree-git-plugin 配置 {{{
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
" }}}

" 查找 ctrlsf.vim {{{

" 上下文插件，例如搜素到关键字，中间缩略，展示一段上下文
" Plug 'dyng/ctrlsf.vim'
" 使用 ctrlsf.vim 插件在工程内全局查找光标所在关键字，设置快捷键。
" 快捷键速记法：search in project
let g:ctrlsf_ackprg = 'rg'
nnoremap <Leader>sp :CtrlSF<CR>
" 选中搜索 - 文本中选中关键字
vmap     <Leader>sp <Plug>CtrlSFVwordPath
" CtrlSF Widnow 打开／关闭切换
vnoremap     <C-F>t <Esc>:CtrlSFToggle<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
nmap     <C-F>f <Plug>CtrlSFPrompt
" 预设视图 normal/compact
let g:ctrlsf_default_view_mode = 'normal'
" define CtrlSF focuses result pane
let g:ctrlsf_auto_focus = {
    \ "at": "done",
    \ "duration_less_than": 1000
    \}
" g:ctrlsf_default_root defines how CtrlSF find search root when no explicit
" path is given. Two possible values are cwd and project. cwd means current
" working directory and project means project root. CtrlSF locates project
" root by searching VCS root (.git, .hg, .svn, etc.)
let g:ctrlsf_default_root = 'project'
" 被搜索忽略的目录(directories that will be ignore by default)
let g:ctrlsf_ignore_dir = ['vendor']
" }}}

"vim-snippets / UltiSnip {{{

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" }}}

" Valloric/MatchTagAlways {{{

" This option holds all the filetypes for which this plugin will try to find and highlight enclosing tags.
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'vue' : 1,
    \}

"  Jumps to the enclosing tag if the tag is visible
nnoremap <leader>% :MtaJumpToOtherTag<cr>

"}}}

" GitGutter {{{

let g:gitgutter_escape_grep = 1
highlight GitGutterAdd ctermbg=Green
highlight GitGutterDelete ctermbg=Red
highlight GitGutterChange ctermbg=Yellow
let g:gitgutter_grep=''
let g:gitgutter_terminal_reports_focus=0
set updatetime=100
let g:gitgutter_set_sign_backgrounds = 1
nmap [h <Plug>(GitGutterPrevHunk)
nmap ]h <Plug>(GitGutterNextHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)


" }}}

"----------------------------------------------
" Language: Golang  vim-go {{{
"----------------------------------------------
"使用版本v1.20, 最新master版本不稳定
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

" Mappings
au FileType go nmap <F9> :GoCoverageToggle -short<cr>
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
au FileType go nmap <leader>gg :GoDeclsDir<cr>
au FileType go nmap <leader>gc <Plug>(go-coverage-toggle)
au FileType go nmap <leader>v <Plug>(go-def-vertical)
au FileType go nmap <leader>h <Plug>(go-def-split)
au FileType go nmap <leader>x <Plug>(go-doc-vertical)
" au FileType go nmap <leader>r <Plug>(go-referrers)
" autocmd FileType go nmap <silent> <Leader>gd <Plug>(go-def-tab)
" autocmd FileType go nmap <silent> <leader>gt  <Plug>(go-test)
" autocmd FileType go nmap <silent> <leader>gr  <Plug>(go-run)


let g:go_doc_popup_window = 1

" Set ultisnips as snippet engine
let g:go_snippet_engine = "ultisnips"

" Set whether the JSON tags should be snakecase or camelcase
let g:go_addtags_transform = "snakecase"

" let g:go_metalinter_autosave = 1

" Identifier highlighting
" https://github.com/fatih/vim-go/wiki/Tutorial#identifier-highlighting
" 提示错误
" let g:go_auto_sameids = 1

" Identifier resolution
" https://github.com/fatih/vim-go/wiki/Tutorial#identifier-resolution
" 与错误提示冲突了，so 不启用改功能
" let g:go_auto_type_info = 1
"
" }}}

"----------------------------------------------
" Language: Python {{{
"----------------------------------------------
au FileType python set expandtab
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4
" }}}

"----------------------------------------------
" Language: YAML {{{
"----------------------------------------------
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" }}}


"----------------------------------------------
" Dictionary: a dictionary plugin for vim  {{{
" https://www.antimoon.com/
"----------------------------------------------
nmap <leader>d :call Longman()<CR>
fun! Longman()
    let keyword = expand("<cword>")
    let url = "https://www.ldoceonline.com/dictionary/" . keyword
    let path = "/Applications/Google\\ Chrome.app"
    silent exec "!open -a ".path." '".url."'" | redraw!
endfun
" }}}

" vim-yankstack {{{
" ref: https://www.0value.com/my-go-centric-vim-setup
" ref: https://github.com/neovim/neovim/issues/2379, enable meta key
" use defualt Key Mappings
" nmap <leader>p <Plug>yankstack_substitute_older_paste
" nmap <leader>P <Plug>yankstack_substitute_newer_paste
" }}}

"----------------------------------------------
" statusline  {{{
"----------------------------------------------
let g:lightline = {
      \ 'colorscheme': 'challenger_deep',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


" }}}

"----------------------------------------------
" vim-rest-console  {{{
"----------------------------------------------
let g:vrc_response_default_content_type = 'application/json'

" json 格式化使用 jq cli，需要提前安装 
" In Mac, run "brew install jq"
let g:vrc_auto_format_response_patterns = {
  \ 'json': 'jq .',
  \ 'xml': 'xmllint --format -',
\}

" 设置 curl normal options
let g:vrc_curl_opts = {
  \ '--connect-timeout' : 10,
  \ '-L': '',
  \ '-i': '',
  \ '--max-time': 60,
  \ '--ipv4': '',
  \ '-k': '',
  \ '-s': '',
\}
" }}}

"----------------------------------------------
"  nvim-glow {{{
"----------------------------------------------
" noremap <leader>p :Glow<CR>
" }}}


"----------------------------------------------
"  vista.vim {{{
"----------------------------------------------
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

let g:vista_executive_for = {
  \ 'go': 'coc',
  \ 'python': 'coc',
  \ 'lua': 'coc',
  \ 'markdown': 'toc',
  \ }

let g:vista_echo_cursor_strategy = 'scroll'

let g:vista#renderer#enable_icon = 0

let g:vista_update_on_text_changed = 1
let g:vista_close_on_jump = 2
let g:vista_disable_statusline = 1

nnoremap <leader>fs :Vista finder<CR>
nnoremap <leader>fv :Vista!!<CR>
" }}}

"----------------------------------------------
"  fzf.vim {{{
"----------------------------------------------
lua require('lspfuzzy').setup {}
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>
" }}}


"----------------------------------------------
"  coc.vim {{{
"----------------------------------------------
set tagfunc=CocTagFunc
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

let g:coc_global_extensions = ['coc-json', 'coc-go', 'coc-pyright', 'coc-diagnostic']
" }}}
"
"----------------------------------------------
" Language: json  {{{
"---------------------------------------------- 
au FileType json set expandtab 
au FileType json set shiftwidth=2 
au FileType json set softtabstop=2
au FileType json set tabstop=2
" }}}

" vim: foldmethod=marker
