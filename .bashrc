#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#
# shanekdev's personal .bashrc file                                                     #
# Last Updated - 20 July 2024                                                           #
#                                                                                       #
# Made for GNU/Linux systems; may not work on Unix, BSD, or MacOS without modification. #
#                                                                                       #
# Color scheme is for xfce-terminal or xterm with a black background,                   #
# and may not be suitable on other terminal emulators.                                  #
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~#

#~~~~~IMPORTANT~~~~~#
# It is necessary to add the following to ~/.bash_profile for remote hosts to load .bashrc

# if [ -f ~/.bashrc ]; then
#   . ~/.bashrc
# fi

# Only load on interactive shell
[ -z "PS1" ] && return

#~~~~~~~~~~~~~~~~~~~~#
#      Autorun       #
#~~~~~~~~~~~~~~~~~~~~#

# neofetch    # neofetch is no longer maintained. Switch to fastfetch or similar
# fastfetch

#~~~~~~~~~~~~~~~~~~~~#
#       Colors       #
#~~~~~~~~~~~~~~~~~~~~#

# Code for colors was copied from Emmanuel Rouat's sample bashrc file
# Can be found at: https://tldp.org/LDP/abs/html/sample-bashrc.html
#
# This list was modified so that bright colors are not also bold

# Normal Colors
Black="\e[0;30m"  # Black
Red="\e[0;31m"    # Red
Green="\e[0;32m"  # Green
Yellow="\e[0;33m" # Yellow
Blue="\e[0;34m"   # Blue
Purple="\e[0;35m" # Purple
Cyan="\e[0;36m"   # Cyan
White="\e[0;37m"  # White

# Bright
BBlack="\e[0;90m"  # Black
BRed="\e[0;91m"    # Red
BGreen="\e[0;92m"  # Green
BYellow="\e[0;93m" # Yellow
BBlue="\e[0;94m"   # Blue
BPurple="\e[0;95m" # Purple
BCyan="\e[0;96m"   # Cyan
BWhite="\e[0;97m"  # White

# Background
On_Black="\e[40m"  # Black
On_Red="\e[41m"    # Red
On_Green="\e[42m"  # Green
On_Yellow="\e[43m" # Yellow
On_Blue="\e[44m"   # Blue
On_Purple="\e[45m" # Purple
On_Cyan="\e[46m"   # Cyan
On_White="\e[47m"  # White

NC="\e[m" # Color Reset

#~~~~~~~~~~~~~~~~~~~~#
#      Settings      #
#~~~~~~~~~~~~~~~~~~~~#

# History settings
export HISTTIMEFORMAT="%F %T" # Adds date and time to bash history
export HISTCONTROL=ignoredups # History ignores duplicate entries back to back
export HISTSIZE=2048          # Lines in active history
export HISTFILESIZE=2048      # Lines in history save file

# Disable automatic mail checking
unset MAILCHECK

# Set default editor
if [ -f "/usr/bin/nvim" ]; then # Replace /usr/bin/nvim with path to your editor of choice
  export EDITOR=/usr/bin/nvim   # Replace /usr/bin/nvim here also
elif [ -f "/usr/bin/vim" ]; then
  export EDITOR=/usr/bin/vim
elif [ -f "/usr/bin/vi" ]; then
  export EDITOR=/usr/bin/vi
else
  export EDITOR=/usr/bin/nano
fi

#~~~~~~~~~~~~~~~~~~~~#
#       Aliases      #
#~~~~~~~~~~~~~~~~~~~~#

alias "cd.."="cd .."
alias cls=clear

#~~~~~~~~~~~~~~~~~~~~#
#    Bash Prompt     #
#~~~~~~~~~~~~~~~~~~~~#

# Set color for time and working directory
TIMECOLOR=${BBlack}
PWDCOLOR=${BBlack}

# Set color for user and hostname
if [ "${DISPLAY#$HOST}" != ":0.0" ] && [ "${DISPLAY}" != ":0" ]; then # Set color to green for remote host
  USERCOLOR=${BGreen}
elif [ "$EUID" -eq 0 ]; then # Set color to blue for root user
  USERCOLOR=${BBlue}
  USERSYMBOL="#"
else
  USERCOLOR=${BRed} # Set color to red for normal user
  USERSYMBOL="\$"
fi

# Display message on remote connection
if [ -n "${SSH_CONNECTION}" ]; then
  echo -e "${BGreen}Connected via SSH.${NC}"
elif [ "${DISPLAY%%:0*}" != "" ]; then
  echo -e "${BWhite}${On_Red}WARNING:${NC} ${Red}Not connected via SSH.${NC}"
fi

# Set the bash prompt
PS1="\[${TIMECOLOR}\]\A \[${USERCOLOR}\]\u@\h:\[${PWDCOLOR}\]\w\[${USERSYMBOL}\]\[${NC}\] "
