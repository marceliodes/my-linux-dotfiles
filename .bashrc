#
# ~/.bashrc
#
# My .bashrc for Arch Linux
#


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

### bash prompt
# change PS1 prompt
export PS1="\[\033[38;5;202m\]\u\[$(tput sgr0)\] at \[$(tput sgr0)\]\[\033[38;5;214m\]\h\[$(tput sgr0)\] in \[$(tput sgr0)\]\[\033[38;5;46m\]\W\[$(tput sgr0)\]\n\[$(tput sgr0)\]\[\033[38;5;51m\]\\$\[$(tput sgr0)\]> \[$(tput sgr0)\]"

# change PS2 prompt
export PS2="\[\033[38;5;14m\]-\[$(tput sgr0)\]\[\033[38;5;190m\]>\[$(tput sgr0)\]\[\033[38;5;118m\]> \[$(tput sgr0)\]"

### aliases
# replace ls with exa
alias ls='exa --icons --no-time --sort=extension'

# replace cat with bat
alias cat='bat'

# rickcroll on terminal (hell yeah!!)
alias rickroll='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# Paleofetch on .local/bin
alias paleofetch='$HOME/.local/bin/paleofetch'

# clear and then print pfetch
alias cls='/bin/clear; PF_INFO="ascii title os kernel pkgs memory" pfetch'

# color for grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# journalctl error message
alias report-pls="journalctl -p 3 -xb"

### paleofetch when bash start
# make sure install paleofetch from https://github.com/ss7m/paleofetch
# or use the fork of paleofetch from https://github.com/JaGoLi/paleofetch
$HOME/.local/bin/paleofetch
