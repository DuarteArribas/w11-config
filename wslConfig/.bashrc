# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac
# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Change all ls colors to white
export LS_COLORS='ow=1;34:rs=0:di=97:ln=97:pi=97:so=97:bd=97:cd=97:or=97:ex=97'

# Man colors
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Aliases
alias crc='cat ~/.bashrc'
alias date='date "+%Y-%m-%d %T"'
alias ps='ps auxf'
alias c='clear'
alias apt='sudo apt'
alias cd..='cd ..'
alias ..='cd ..'
alias la='ls -Ah'
alias ll='ls -l'
alias f="find . | grep "
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"
alias mk='mkdir'

# Functions
# Copy a file with progress bar
cpp(){
	set -e
	strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
	| awk '{
	count += $NF
	if (count % 10 == 0) {
		percent = count / total_size * 100
		printf "%3d%% [", percent
		for (i=0;i<=percent;i++)
			printf "="
			printf ">"
			for (i=percent;i<100;i++)
				printf " "
				printf "]\r"
			}
		}
	END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
}
# Create and go to the directory
mkg(){
	mkdir -p $1
	cd $1
}

# Prompt
eval "$(starship init bash)"