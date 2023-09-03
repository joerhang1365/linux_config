#
# /etc/bash.bashrc
#

HISTTIMEFORMAT="%F %T "

HISTCONTROL=ignoredups

HISTSIZE=2000

HISTFILESIZE=2000

shopt -s histappend

shopt -s checkwinsize

# [color variables]

blk='\[\033[01;30m\]' # black
red='\[\033[01;31m\]' # red
grn='\[\033[01;32m\]' # green
ylw='\[\033[01;33m\]' # yellow
blu='\[\033[01;34m\]' # blue
pur='\[\033[01;35m\]' # purple
cyn='\[\033[01;36m\]' # cyan
wht='\[\033[01;37m\]' # white
clr='\[\033[00;m\]'   # reset

# [setters]

set -o nvim

# [aliases]

# move to parent folder
alias ..='cd ..;pwd'

# move up two parent folders
alias ...='cd ../..;pwd'

# move up three parent folders
alias ....='cd ../../..;pwd'

# press c to clear the terminal screen
alias c='clear'

# press h to view the bash history
alias h='history'

# sisplay the directory structure
alias tree='tree --dirsfirst -F'

# make a directory and all parent directories with verbosity
alias mkdir='mkdir -p -v'

# git
alias gs='git status'

alias ga='git add'

alias gass='git add --all'

alias gc='git commit'

alias gl='git log --oneline'

alias gb='git checkout -b'



# [functions]

function hg()
{
  history | grep "$1";
}

function find_largest_files()
{
	du -h -x -s -- * | sort -r -h | head -20;
}

function prev_cmd()
{
	history | grep "$1";
}

# [print]

clear

printf "\n"
printf "  %s\n" "IP ADDRESS: $(curl ifconfig.me)"
printf "  %s\n" "USER: $(echo $USER)"
printf "  %s\n" "DATE: $(date)"
printf "  %s\n" "UPTIME: $(uptime -p)"
printf "  %s\n" "KERNEL: $(uname -rms)"
printf "  %s\n" "RESOLUTION: $(xrandr | awk '/\*/{printf $1 " "}')"
printf "  %s\n" "MEMORY: $(free -m -h | awk '/Mem/{print $3"/"$2}')"
printf "\n"

# [pointer]
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

PS1='('${blu}'\h'${clr}') ? '${grn}'\u'${clr}' : '${pur}'\w'${clr}'; '
