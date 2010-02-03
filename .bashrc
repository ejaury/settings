
# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls --color=auto'
alias grep='grep -n --color'
alias git-diff='git diff --color'
alias tree="tree -C"
PS1='[\u@\h \W]\$ '
