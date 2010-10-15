
# Check for an interactive session
[ -z "$PS1" ] && return

export PATH="/usr/local/bin:$PATH"
export PYPATH=/usr/lib/python2.6/site-packages/

alias diff='diff -uw'
alias ls='ls --color=auto'
alias grep='grep -n --color'
alias git-diff='git diff --color'
alias movie="cd ~/movies"
alias mplayer="mplayer -heartbeat-cmd \"xscreensaver-command -deactivate &\""
alias rdesktop='rdesktop -g 1280x1024'
alias tree="tree -C"
alias tv="cd ~/tv_shows"
alias xrandr-normal="xrandr --output VGA1 --off"
alias xrandr-duplicate="xrandr --output LVDS1 --mode 1400x1050 --output VGA1 --auto"
alias xrandr-extend="xrandr --output LVDS1 --auto --output VGA1 --auto
--right-of LVDS1"
#export PS1='[\u@\h \W]\$ '
export PS1="\[$(tput setaf 2)\]\[$(tput bold)\]\u@\h\[$(tput sgr0)\]-\[$(tput setaf 7)\]\A\[$(tput sgr0)\]:\[$(tput setaf 1)\]\[$(tput bold)\]\W\[$(tput sgr0)\] $ "
