# my welcome
echo "Welcome $USER! It's now $(date '+%A %B %d %Y %r')" 

# standard package settings first (Debian/Ubuntu) 

# If not running interactively, don't do anything
# also another way to check this...
[ -z "$PS1" ] && return

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -1 --color=auto --group-directories-first'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# should already be enabled by entry in /etc/bash.bashrc
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
#
#complete -cf sudo

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#### custom ######

# Bash environment #

# prompt_command; important, as without it, xterm title or tabs won't change back, say after using vim,
# only want it if using xterm
case "$TERM" in
    xterm*|rxvt*) PROMPT_COMMAND='printf "%b" "\033]0;${PWD/$HOME/~}\007"'
                  export PROMPT_COMMAND
               ;;
               *)
               ;;
esac

# favourite editor, pager, gpgkey and PS1
PAGER=less
EDITOR="/usr/bin/vi"
GPGKEY=
PS1="\[\033[0;31m\]duke@nukem \w\\$\[\033[0m\] "
# export them all in one go
export EDITOR GPGKEY PS1 PAGER 


# set commands -see $SHELLOPTS and $-
# noclobber-can be overriden with >|
set -o noclobber
# switch off hashing, often causes problems when on
set +o hashall
# this option renders !history expansion usable, notice +o disables, NOT enables the options 
#set +o histexpand
# make unset variables an error, also breaks command completion currently
#set -o nounset

# conform to posix
# set -o posix

# shopt commands; use shopt -p to list activated ( -s) and deactivated ( -u) options
# using nullglob or failglob may cause bash command completion to error
shopt -s checkwinsize
shopt -s globstar
shopt -s cdspell
shopt -s extglob
# setting failglob is useful, as it treats a failed glob as an error and stops, but
# currently breaks command completion
#shopt -s failglob

# history settings
shopt -s histappend
shopt -s histverify
shopt -s histreedit

# see periodic script to archive bash_history, run by running general backup script
# unsetting histfilesize means no lines are ever deleted; histsize is just the number
# of lines retained in memory

unset HISTFILESIZE
HISTCONTROL="ignoreboth:erasedups"
# with this histcontrol setting, don't leave spaces at start of command, as then
# the command would not be recorded

HISTSIZE=5000
HISTTIMEFORMAT="%F %H_%M_%S "
HISTIGNORE="&:cd:[bf]g:history:exit:man:help:info:ls:clear"

# special TERMCAP specs 

LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode
LESS_TERMCAP_md=$(printf '\e[01;38;5;75m') # enter double-bright mode
LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode
LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
LESS_TERMCAP_us=$(printf '\e[04;38;5;200m') # enter underline mode
export LESS_TERMCAP{_mb,_md,_me,_se,_so,_ue,_us}

# source aliases and functions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [[ -f $HOME/lib/Bash_libraries/mik_bashlib ]]; then
    . $HOME/lib/Bash_libraries/mik_bashlib
else
    printf "Your bash library has not been found. All functions will be unavailable. \n" >&2
fi
