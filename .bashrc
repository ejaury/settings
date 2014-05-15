# Check for an interactive session
[ -z "$PS1" ] && return

svndiff()
{
  svn diff "${@}" | colordiff
}

#export PS1='[\u@\h \W]\$ '
if [ -f ~/.bash_colors ]; then
    . ~/.bash_colors
    export PS1="${BGreen}\u${BWhite}@${TReset}\[$(tput setaf 2)\]\h\[$(tput sgr0)\]-\[$(tput setaf 1)\]\[$(tput bold)\]\w\[$(tput sgr0)\] $ "
else
    export PS1="\[$(tput setaf 2)\]\[$(tput bold)\]\u\[$(tput sgr0)\]@\[$(tput setaf 2)\]\h\[$(tput sgr0)\]-\[$(tput setaf 1)\]\[$(tput bold)\]\w\[$(tput sgr0)\] $ "
fi

# Set TERM correctly if we're capable of displaying at least 256 colors. Useful
# to tell vim that 256-color is supported for colorscheme setting purpose.
[[ -n "$DISPLAY" && "$TERM" = "xterm" ]] && export TERM=xterm-256color

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Source local settings if there's any
if [ -f ~/.bashrc_local ]; then
    . ~/.bashrc_local
fi
