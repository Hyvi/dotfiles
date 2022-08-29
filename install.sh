#! /bin/bash
# Auth: hyvitan

# 安装 Plug 
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 安装 nvim python3 插件的支持
python3 -m pip install --user --upgrade pynvim 

if [ "$(uname)" == "Darwin" ]; then
  brew install jq
  brew install rg

  # lua
  brew install lua-language-server 

  # 安装中文输入法切换
  curl -o /usr/local/bin/xkbswitch https://raw.githubusercontent.com/myshov/xkbswitch-macosx/master/bin/xkbswitch
  chmod a+x /usr/local/bin/xkbswitch

  # 安装 fzf
  brew install fzf
  $(brew --prefix)/opt/fzf/install
  brew install bat  # preview 高亮显示
  
  # vista.vim 插件使用 ctags 
  brew install ctags
  
  # 字体, 设置 Iterm 2 的字体为 Hack Regular Nerd Font Complete Mono
  brew tap homebrew/cask-fonts
  brew install --cask font-hack-nerd-font

else
  sudo apt  install  -y ripgrep
  sudo apt  install -y jq
 
  sudo apt-get -y install exuberant-ctags
  sudo apt-get -y install fzf

  sudo apt-get install -y zsh
  sudo apt-get install -y neovim
fi
# 安装 lsp server 

# golang 
go install github.com/nametake/golangci-lint-langserver@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.42.1
# python
pip3 install pyright

# check node
if which node > /dev/null
   then
       echo "node is installed, skipping..."
   else
       # add deb.nodesource repo commands
       exit
       # install node
   fi

# 安装 yarn 

if which yarn > /dev/null
   then
       echo "node is installed, skipping..."
   else
       curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
   fi


# 安装 错误检测， 比如 golangci-linter
yarn global add diagnostic-languageserver


# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git --git-dir=$HOME/dotfiles/ --work-tree=$HOME checkout ~/.zshrc
