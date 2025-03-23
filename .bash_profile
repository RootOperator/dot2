#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')" # add ~/.local/bin and all subdirectories to $PATH
export PATH="$PATH:$HOME/.surrealdb/"
export EDITOR="nvim"
export BROWSER="firefox"
export _ZO_DOCTOR=0
export XDG_CONFIG_HOME="$HOME/.config"
. "$HOME/.cargo/env"
