#! /bin/bash
# Auth: hyvitan


python3 -m pip install --user --upgrade pynvim 

brew install jq

brew install rg


go install github.com/nametake/golangci-lint-langserver@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.42.1


brew install lua-language-server 

curl -o /usr/local/bin/xkbswitch https://raw.githubusercontent.com/myshov/xkbswitch-macosx/master/bin/xkbswitch

chmod a+x /usr/local/bin/xkbswitch

pip3 install pyright


