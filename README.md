!!! Nvim from Vim

Nvim/vim 配置，持续更新

参考 yanzhang0219 / dotfiles 之后，决定使用 bare Git Repo 方式来管理配置文件

Using a bare Git repository to track dotfiles<sup>[1]</sup>

# Vim Install
子标题为各个插件的安装注意项。

若使用 nvim，那么需要安装 pynvim， ` python3 -m pip install --user --upgrade pynvim ` <sup>[2]</sup> .

## Vundle 安装
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

##  Ftplugin
目录下是各种文件类型的配置，安装方式如下
```bash
git clone https://github.com/Hyvi/vim-plugin.git
# 或者 mv vim-plugin/ftpugin ~/.vim/
ln -s vim-plugin/ftplugin ~/.vim/ftplugin
````

## Tagbar

### lvht/tagbar-markdown
tagbar 本身支持 markdown, [ wiki markdown ](https://github.com/majutsushi/tagbar/wiki#markdown)，但是在 UI 上有点差，比如 tagbar-markdown.

- tagbar-markdown 需要 Php 的支持。

## vim-rest-console
默认使用 `python -m json.tool` 来格式，存在以下问题：

- 格式化不如 jq 好看
- 不支持中文，将中文转化 unicode 码

这里通过配置 `vrc_auto_format_response_patterns` 来使用 `jq` 来格式化。在 Mac 下执行以下命令安装 jq: 

```bash
brew install jq
```

## lightline.vim
A light and configurable statusline/tabline plugin for Vim

结合主题 Challenger Deep Theme for VIM 使用。

# Zshrc
记录 zsh + oh-my-zsh 的安装和使用

## zsh completion(compinit / compaudit)

> zsh compinit: insecure directories, run compaudit for list.  Ignore insecure directories and continue [y] or abort compinit [n]? y

[https://stackoverflow.com/questions/13762280/zsh-compinit-insecure-directories]

```bash
sudo chmod -R 755 /usr/local/share/zsh
sudo chown -R root:staff /usr/local/share/zsh
```

## Zsh-autosuggestions
[https://github.com/zsh-users/zsh-autosuggestions#usage]


## zsh-syntax-highlighting
zsh-users / zsh-syntax-highlighting


# Iterm 2

## Colorscheme 设置
参考 airblade vim 的设置，更改 Vim 的 colorscheme 为 NeoDark 黑色主题，为了保持 Iterm 2 的主题和 Vim 一致， 使用 [NeoDark.itermcolors](https://github.com/KeitaNakamura/neodark.vim/blob/master/terms/NeoDark.itermcolors) 修改 Iterm 2 的主题。

Challenger Deep Theme for VIM, 切换到颜色突出的主题

# 字体
mononoki 

# 参考

[ sebdah's nvim configuratio ](https://github.com/sebdah/dotfiles/blob/ab2c2357a6853a29010762a45610b2ab31c71eb5/config/nvim/init.vim)

[ airblade vim configuration ](https://github.com/airblade/dotvim/blob/master/vimrc)

[1] Greg Owen: Using a bare Git repo to get version control for my dotfiles

[2] neovim: NVIM REFERENCE MANUAL, Transitioning from Vim 
