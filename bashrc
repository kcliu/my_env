# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias sc='screen -t'
alias mv='mv -i'
alias ll='ls -l --color=always | less -R'
alias cgrep='grep --color=always -n -I --exclude-dir=.svn'
alias less='less -R'
alias t='time'
export GREP_COLOR='00;38;5;226'

#encoding
#export LANG=en_US
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
# keeping a Screen open
#if [[ $TERM != 'screen' ]] ; then
#    if [[ `screen -list | grep -v "No" | awk '$2 { print }' | wc -l` == 0 ]] ; then
#        screen
#    else
#        screen -dr
#    fi
#fi
# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'
fi

# For colourful man pages (CLUG-Wiki style) 
export LESS_TERMCAP_mb=$'\E[01;31m' 
export LESS_TERMCAP_md=$'\E[01;31m' 
export LESS_TERMCAP_me=$'\E[0m' 
export LESS_TERMCAP_se=$'\E[0m' 
export LESS_TERMCAP_so=$'\E[01;44;33m' 
export LESS_TERMCAP_ue=$'\E[0m' 
export LESS_TERMCAP_us=$'\E[01;32m' 

#history ignore cmds (ls, bg, fg, exit, &)
export HISTIGNORE="&:ls:ls *:[bf]g:exit" 

#export PROMPT_COMMAND='echo -n -e "\033k"'
