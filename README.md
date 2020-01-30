vim配置,持续更新


# 安装

## 检查vim版本
vim-go 对vim 有最低版本的要求， 当前要求最低版本是 8.0.1453 
> vim-go requires at least Vim 8.0.1453 or Neovim 0.3.2, but you're using an older version.  

如果版本太低， 升级到最新版， 升级VIM版本， 升级方式待补充。

## 克隆该仓库
假定你当前的目录为home（~/）目录下

```
git clone https://github.com/Hyvi/vim-plugin
```

## 创建软连接
``` bash 
ln -s ~/vim-plugin/.vimrc .vimrc
```

## PluginInstall 
使用vundle方式安装Plugin 

## YCM设置 
> The ycmd server SHUT DOWN (restart with ':YcmRestartServer'). YCM core library not detected; you need to compile YCM before using it. Follow the instructions in the documentation.



# 参考

sebdah's nvim configuration  
https://github.com/sebdah/dotfiles/blob/ab2c2357a6853a29010762a45610b2ab31c71eb5/config/nvim/init.vim  

