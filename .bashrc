#
# ~/.bashrc
#

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

alias grep='grep --color=auto'
alias cat='bat'
alias ls='eza --icons=auto --color=auto'
alias cp='cp -i'
alias df='duf'
alias du='du -h'
alias free='free -m'
alias diff='diff --color=auto'
alias ip='ip -color=auto'
alias zbr='zig build run'
alias tma='tmux attach'
alias more=less

complete -cf sudo

shopt -s checkwinsize

shopt -s expand_aliases

shopt -s histappend

bind -r '\C-t'

eval "$(zoxide init bash --cmd cd)"
eval "$(starship init bash)"
