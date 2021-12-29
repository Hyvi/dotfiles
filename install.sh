#! /bin/bash
# Auth: hyvitan


# 安装 nvim python3 插件的支持
python3 -m pip install --user --upgrade pynvim 

brew install jq

brew install rg

# 安装 lsp server 

# golang 
go install github.com/nametake/golangci-lint-langserver@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.42.1

# lua
brew install lua-language-server 

# python
pip3 install pyright

# 安装中文输入法切换
curl -o /usr/local/bin/xkbswitch https://raw.githubusercontent.com/myshov/xkbswitch-macosx/master/bin/xkbswitch

chmod a+x /usr/local/bin/xkbswitch

# 安装 fzf
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install bat  # preview 高亮显示

# vista.vim 插件使用 ctags 

brew install ctags
