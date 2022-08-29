# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "~/.config/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source ~/.config/fzf/shell/key-bindings.zsh

# Options
# ------------
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

