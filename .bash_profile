#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')" # add ~/.local/bin and all subdirectories to $PATH
export TERM=xterm-256color
export EDITOR="nvim"
export BROWSER="firefox"
export TERMINAL="st"
export XDG_CONFIG_HOME="$HOME/.config"
# start graphical server if i3 is not already running
[ "$(tty)" = "/dev/tty2" ] && ! pgrep -x i3 >/dev/null && exec startx
. "$HOME/.cargo/env"
