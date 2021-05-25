# Supress fish's intro message
set fish_greeting

# Set terminal type
set TERM "xterm-256color"

### PROMPT ###
# This is the theme-simple-ass-prompt from oh-my-fish
# https://github.com/lfiolhais/theme-simple-ass-prompt
##############

# Status Chars
set __fish_git_prompt_char_dirtystate '!'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_cleanstate '✓'

# Display the state of the branch when inside of a git repo
function __simple_ass_prompt_parse_git_branch_state -d "Display the state of the branch"
  git update-index --really-refresh -q 1> /dev/null

  # Check for changes to be commited
  if git_is_touched
    echo -n "$__fish_git_prompt_char_dirtystate"
  else
    echo -n "$__fish_git_prompt_char_cleanstate"
  end

  # Check for untracked files
  set -l git_untracked (command git ls-files --others --exclude-standard 2> /dev/null)
  if [ -n "$git_untracked" ]
    echo -n "$__fish_git_prompt_char_untrackedfiles"
  end

  # Check for stashed files
  if git_is_stashed
    echo -n "$__fish_git_prompt_char_stashstate"
  end

  # Check if branch is ahead, behind or diverged of remote
  git_ahead
end



# Print current user
function __simple_ass_prompt_get_user -d "Print the user"
  if test $USER = 'root'
    set_color red
  else
    set_color d75f00
  end
  printf '%s' (whoami)
end

# Get Machines Hostname
function __simple_ass_prompt_get_host -d "Get Hostname"
  if test $SSH_TTY
    tput bold
    set_color red
  else
    set_color af8700
  end
  printf '%s' (hostname|cut -d . -f 1)
end

# Get Project Working Directory
function __simple_ass_prompt_pwd -d "Get PWD"
  set_color $fish_color_cwd
  printf '%s ' (prompt_pwd)
end

# Simple-ass-prompt
function fish_prompt
  set -l code $status

  # Logged in user
  __simple_ass_prompt_get_user
  set_color normal
  printf ' at '

  # Machine logged in to
  __simple_ass_prompt_get_host
  set_color normal
  printf ' in '

  # Path
  __simple_ass_prompt_pwd
  set_color normal


  # Line 2
  echo
  if test -e "Cargo.toml"
    printf "(rust:%s) " (set_color red)(rustup show | tail -n 3 | head -n 1 |  cut -d '-' -f 1)(set_color normal)
  end

  if test $VIRTUAL_ENV
    printf "(python:%s) " (set_color blue)(basename $VIRTUAL_ENV)(set_color normal)
  end

  if test $code -eq 127
    set_color red
  end

  printf '↪ '
  set_color normal
end

### END PROMPT ###
##################

# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

# The bindings for !! and !$
if [ $fish_key_bindings = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end


### End Function for !! and !$ ###
##################################


### Setting alias for fish shell ###

#replace cat with bat
alias cat='bat'

#replace ls with exa
alias ls='exa'

#rickcroll on terminal (hell yeah!!)
alias rickroll='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# clear and then print pfetch
alias cls='/bin/clear; PF_INFO="ascii title os kernel pkgs memory" pfetch'

# color for grep
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'


### Run neofetch on fish's startup ###
neofetch
