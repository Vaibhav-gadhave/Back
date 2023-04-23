# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
case $HOSTNAME in
    plato*) PSC="\e[1;33m" ;;
    *) PSC="\e[36m" ;;
esac
PS1="\[${PSC}\]\u@\T \[\e[37m\][ \w ]\[\e[00m\]\n\[\e[1m\]\#\[\e[0m\] \$ "
