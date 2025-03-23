!!! Nvim from Vim

# Nvim Install
子标题为各个插件的安装注意项。

## pynvim 

>  Pynvim implements support for python plugin in Nvim. It also works as a library for connecting to and scripting Nvim processes through its msgpack-rpc API
若使用 nvim，那么需要安装 pynvim<sup>[2]</sup> .
```
python3 -m pip install --user --upgrade pynvim 
``` 

##  Ftplugin
目录下是各种文件类型的配置

## vim-rest-console
默认使用 `python -m json.tool` 来格式，存在以下问题：

- 格式化不如 jq 好看
- 不支持中文，将中文转化 unicode 码

这里通过配置 `vrc_auto_format_response_patterns` 来使用 `jq` 来格式化。在 Mac 下执行以下命令安装 jq: 

```bash
brew install jq
```
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


# 参考

[ sebdah's nvim configuratio ](https://github.com/sebdah/dotfiles/blob/ab2c2357a6853a29010762a45610b2ab31c71eb5/config/nvim/init.vim)

[ airblade vim configuration ](https://github.com/airblade/dotvim/blob/master/vimrc)

[1] Greg Owen: Using a bare Git repo to get version control for my dotfiles

[2] neovim: NVIM REFERENCE MANUAL, Transitioning from Vim 

[5] nvim-lspconfig's WIKI: Autocompletion


