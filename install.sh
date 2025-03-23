#! /bin/bash
# Auth: hyvitan


# 安装 nvim python3 插件的支持
sudo apt-get update \
    && sudo apt-get install -y python3-pip

python3 -m pip install --user --upgrade pynvim

if [ "$(uname)" == "Darwin" ]; then
  brew install jq
  brew install rg

  # lua
  brew install lua-language-server 

  # 安装中文输入法切换
  curl -o /usr/local/bin/xkbswitch https://raw.githubusercontent.com/myshov/xkbswitch-macosx/master/bin/xkbswitch
  chmod a+x /usr/local/bin/xkbswitch

  brew install bat  # preview 高亮显示
  
  # vista.vim 插件使用 ctags 
  brew install ctags
  
  # 字体, 设置 Iterm 2 的字体为 Hack Regular Nerd Font Complete Mono
  brew tap homebrew/cask-fonts
  brew install --cask font-hack-nerd-font

else
  sudo add-apt-repository ppa:neovim-ppa/unstable -y
  sudo apt-get -y update

  sudo apt install make gcc ripgrep unzip git xclip neovim tmux jq exuberant-ctags zsh
  # 重复安装, 仅保留这里
  set -euo pipefail \
    && curl -sL https://deb.nodesource.com/setup_14.x | sudo bash - \
    && sudo apt-get install -y nodejs \
    && curl --compressed -o- -L https://yarnpkg.com/install.sh | bash \
    && $HOME/.yarn/bin/yarn global add diagnostic-languageserver

fi

# 安装 fzf and auto-completion and key-bindings 
# Ubuntu 自带的 fzf 版本太低, 无法使用
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# 安装 lsp server 

# python
pip3 install pyright

git --git-dir=$HOME/dotfiles/ --work-tree=$HOME checkout ~/.zshrc
