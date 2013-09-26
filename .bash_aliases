# .bash_aliases

# aliases #

# essential for all Linux users ( see also noclobber option set above)
alias cp='cp -i'
#alias mv='mv -i'
alias rm='rm -i'

# ls aliases, pretty standard
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# colour aliases and for ls, grep, etc see .bashrc

# various program aliases, mostly self explanatory

alias py33='source Py3_3_env/bin/activate'
alias geany='setsid geany'
# change make alias acording to cpu cores/threads plus one. So Pentium 4 (no hyperthreading): 1+1=2) 
alias make='make -j2'
# use gksudo for truecrypt, perhaps setup diff auth in future
alias truecrypt='setsid gksudo truecrypt'
alias emacs='emacs --geometry '-3+3''
alias hddtemp='sudo hddtemp /dev/sda'

# show processes in a tree, by cpu use, and by mem use
# credit to the place I found these
alias mikps2='ps -e -o pid,ppid,args --forest'
alias mikps3='ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu | sed '/^0.0/d'' 
alias mikps4='ps -e -orss=,args= | sort -b -k1,1n | pr -TW$COLUMNS'

# show processes in a tree, alternative to mikps2
alias pstree='pstree -plu'

# find if root owns any files in $HOME
# double quotes necesssary so $HOME is expanded
alias mikrootfind="find ~ -path ~/src -prune -o -not -user $USER -print" 

# software selection
alias mik1='dpkg --get-selections | pr -3 -t | a2ps -o ~/ls.ps -L 66'

# update
alias uppies='sudo apt-get update && sudo apt-get upgrade -uV'

# check apparmour
alias mikaa="sudo aa-status"

# alternative nasa streams, see also functions in bashlib

alias nasatv='vlc "http://iphone-streaming.ustream.tv/ustreamVideo/6540154/streams/live/playlist.m3u8"'

# network activity
alias net1='netstat -tupan'
alias netcon='sudo lsof -n -i4 -P'

# always format help docs in man format
alias help='help -m'

# which kernels are available to boot from
alias kernels="grep -Eo 'Linux [0-9].{7}' /boot/grub/grub.cfg | uniq"

# show functions on stdout
alias mikfunctions='declare -f | grep -C 2 mik'

# alternate hosts files for specific purposes
alias normalhosts='sudo cp -f /root/backups/hosts/normal_hosts/hosts /etc'
alias specialhosts='sudo cp -f /root/backups/hosts/special_hosts/hosts /etc'

#### functions have already been sourced from my Bash library file ####

