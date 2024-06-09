#
# ~/.bashrc
#

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

use_color=true

#parse git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1) /'
}

safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
    && type -P dircolors >/dev/null \
    && match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
    if type -P dircolors >/dev/null ; then
        if [[ -f ~/.dir_colors ]] ; then
            eval $(dircolors -b ~/.dir_colors)
        elif [[ -f /etc/DIR_COLORS ]] ; then
            eval $(dircolors -b /etc/DIR_COLORS)
        fi
    fi

    if [[ ${EUID} == 0 ]] ; then
                PS1='\[$(tput bold)\]'
                PS1+='\[$(tput setaf 1)\][\u\[$(tput setaf 15)\] '
                PS1+='\W\[$(tput setaf 1)\]'
                PS1+=']\[$(tput setaf 3)\]'
                PS1+='$(parse_git_branch)\[$(tput setaf 1)\]'
                PS1+='\$\[$(tput sgr0)\] '
    else
                PS1='\[$(tput bold)\]'
                PS1+='\[$(tput setaf 2)\][\u\[$(tput setaf 15)\] '
                PS1+='\W\[$(tput setaf 2)\]'
                PS1+=']\[$(tput setaf 3)\]'
                PS1+='$(parse_git_branch)\[$(tput setaf 2)\]'
                PS1+='\$\[$(tput sgr0)\] '
    fi

else
    if [[ ${EUID} == 0 ]] ; then
        # show root@ when we don't have colors
        PS1='\u@\h \W \$ '
    else
        PS1='\u@\h \w \$ '
    fi
fi

unset use_color safe_term match_lhs sh

alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias cat='bat'                                     # better version of cat
alias ls='eza --icons=auto --color=auto'            # better version of ls
alias cp='cp -i'                                    # confirm before overwriting something
alias df='duf'                                      # human-readable sizes
alias du='du -h'
alias free='free -m'                                # show sizes in MB
alias more=less

complete -cf sudo

shopt -s checkwinsize

shopt -s expand_aliases

shopt -s histappend


. "$HOME/.cargo/env"

eval "$(zoxide init bash --cmd cd)"
eval "$(starship init bash)"
