!!! Nvim from Vim

Nvim 配置，持续更新

参考 yanzhang0219 / dotfiles 之后，决定使用 bare Git Repo 方式来管理配置文件

Using a bare Git repository to track dotfiles<sup>[1]</sup>

# Nvim Install
子标题为各个插件的安装注意项。

## pynvim 

>  Pynvim implements support for python plugin in Nvim. It also works as a library for connecting to and scripting Nvim processes through its msgpack-rpc API
若使用 nvim，那么需要安装 pynvim<sup>[2]</sup> .
```
python3 -m pip install --user --upgrade pynvim 
``` 

## Plug 安装
```bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

```

##  Ftplugin
目录下是各种文件类型的配置

## vista.vim 
取代 tagbar，vista.vim 支持 LSP 也支持 ctags。通过 `Vista` 开启。

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

## Coc.vim 
配置文件 coc-setting.json (~/.config/nvim) 目录下。

### coc-diagnostic
取代了通过lspconfig方式来配置
### coc-go

## vim-barbaric 输入法
如何离开 insert 模式的时候自动切换到英文输入

## vim-yankstack
A lightweight implementation of emacs's kill-ring for vim。循环遍历“yank and delete thing”。

## junegunn/gv.vim
更方便查看某个文件或某行的更新历史

# Zshrc
记录 zsh + oh-my-zsh 的安装和使用

配置保存在 dotfiles repo 里。

## zsh completion(compinit / compaudit)

> zsh compinit: insecure directories, run compaudit for list.  Ignore insecure directories and continue [y] or abort compinit [n]? y

[https://stackoverflow.com/questions/13762280/zsh-compinit-insecure-directories]

```bash
sudo chmod -R 755 /usr/local/share/zsh
sudo chown -R root:staff /usr/local/share/zsh
```

## Zsh-autosuggestions
zsh-users / zsh-autosuggestions，需要手动安装到 oh-my-zsh/custom/plugins/ 目录下。


## zsh-syntax-highlighting
zsh-users / zsh-syntax-highlighting

# fzf & fzf.vim & nvim-lspfuzzy
fzf is a general-purpose command-line fuzzy finder. 

# Iterm 2

## Colorscheme 设置
~~参考 airblade vim 的设置，更改 Vim 的 colorscheme 为 NeoDark 黑色主题，为了保持 Iterm 2 的主题和 Vim 一致， 使用 [NeoDark.itermcolors](https://github.com/KeitaNakamura/neodark.vim/blob/master/terms/NeoDark.itermcolors) 修改 Iterm 2 的主题。~~

Challenger Deep Theme for VIM, 切换到颜色突出的主题

# 字体
mononoki 

# 参考

[ sebdah's nvim configuratio ](https://github.com/sebdah/dotfiles/blob/ab2c2357a6853a29010762a45610b2ab31c71eb5/config/nvim/init.vim)

[ airblade vim configuration ](https://github.com/airblade/dotvim/blob/master/vimrc)

[1] Greg Owen: Using a bare Git repo to get version control for my dotfiles

[2] neovim: NVIM REFERENCE MANUAL, Transitioning from Vim 

[5] nvim-lspconfig's WIKI: Autocompletion


