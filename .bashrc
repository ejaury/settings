
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
alias grep='grep -n --color'
alias git-diff='git diff --color'
alias rdesktop='rdesktop -g 1024x768'
alias tree="tree -C"
alias xrandr-normal="xrandr --output VGA1 --off"
alias xrandr-duplicate="xrandr --output LVDS1 --mode 1400x1050 --output VGA1 --auto"
alias xrandr-extend="xrandr --output LVDS1 --auto --output VGA1 --auto
--right-of LVDS1"
PS1='[\u@\h \W]\$ '
