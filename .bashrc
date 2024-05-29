#
# ~/.bashrc
#

colors() {
    local fgc bgc vals seq0

    printf "Color escapes are %s\n" '\e[${value};...;${value}m'
    printf "Values 30..37 are \e[33mforeground colors\e[m\n"
    printf "Values 40..47 are \e[43mbackground colors\e[m\n"
    printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

    # foreground colors
    for fgc in {30..37}; do
        # background colors
        for bgc in {40..47}; do
            fgc=${fgc#37} # white
            bgc=${bgc#40} # black

            vals="${fgc:+$fgc;}${bgc}"
            vals=${vals%%;}

            seq0="${vals:+\e[${vals}m}"
            printf "  %-9s" "${seq0:-(default)}"
            printf " ${seq0}TEXT\e[m"
            printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
        done
        echo; echo
    done
}


cursors() {
    echo "\"\e[0 q\" -> blinking block."
    echo "\"\e[1 q\" -> blinking block."
    echo "\"\e[2 q\" -> steady block."
    echo "\"\e[3 q\" -> blinking underline."
    echo "\"\e[4 q\" -> steady underline."
    echo "\"\e[5 q\" -> blinking line. (xterm)"
    echo "\"\e[6 q\" -> steady line. (xterm)"
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

use_color=true

#parse git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1) /'
}

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
    && type -P dircolors >/dev/null \
    && match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
    # Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
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

    alias ls='exa --color=auto'
    alias grep='grep --colour=auto'
    alias egrep='egrep --colour=auto'
    alias fgrep='fgrep --colour=auto'
else
    if [[ ${EUID} == 0 ]] ; then
        # show root@ when we don't have colors
        PS1='\u@\h \W \$ '
    else
        PS1='\u@\h \w \$ '
    fi
fi

unset use_color safe_term match_lhs sh

alias cat='bat'                                     # better version of cat
alias ls='eza --icons=auto'                                      # better version of ls
alias cp='cp -i'                                    # confirm before overwriting something
alias df='duf'                                      # human-readable sizes
alias du='du -h'
alias free='free -m'                                # show sizes in MB
alias ip='ip --color=auto'                                # show sizes in MB
alias more=less

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
shopt -s checkwinsize

shopt -s expand_aliases


# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.tar.xz)    tar xf  $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

. "$HOME/.cargo/env"

eval "$(zoxide init bash --cmd cd)"
eval "$(starship init bash)"
