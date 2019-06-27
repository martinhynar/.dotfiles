source ~/.dotfiles-private/load-private

# PATHS
WORKBENCH=~/Workbench

PATH=~/.dotfiles/bin:${PATH}

PATH=~/bin:${PATH}
PATH=~/.cache/rebar3/bin:${PATH}

JAVA_HOME=/usr/java/latest/
PATH=${JAVA_HOME}:${PATH}

TMP=/tmp; export TMP
TMPDIR=$TMP; export TMPDIR

# GOLANG
export GOPATH=~/Projects/Go
PATH=/usr/local/go/bin:${PATH}
PATH=${GOPATH}/bin:${PATH}

# System paths
PATH=$PATH:/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:.

export PATH

# ALIASES
alias ll='ls -lah --color=auto'
alias w='cd ${WORKBENCH}'
alias sr='sudo bash'
alias gvim="gvim -p --remote-tab-silent"
alias pgrep="pgrep -lf"
alias g="gvim"

alias eeessh="ssh -l root eeebox"

alias open="xdg-open $1 2> /dev/null"
alias octave="octave -q"

alias ,p="cd /home/mhynar/Projects"

export BROWSER="google-chrome"
export LC_ALL=en_US.utf-8

# JAVA CLASSPATH
# export CLASSPATH

# Default applications
xdg-mime default google-chrome.desktop application/pdf
xdg-mime default google-chrome.desktop text/html

xdg-mime default google-chrome.desktop x-scheme-handler/http
xdg-mime default google-chrome.desktop x-scheme-handler/https


# GIT
alias ,gcm="git commit -m $@"
alias ,gcsm="git commit -S -m $@"
alias ,gs="git status"
alias ,gp="git push"
alias ,gpt="git push --tags"
alias ,gmaster="git checkout master"
alias ,gconfig_bitbucket='git config --local user.name "Martin Hynar"; git config --local user.email "martin.hynar@gmail.com"; git config --local --list'
alias ,gconfig_gitlab='git config --local user.name "Martin Hynar"; git config --local user.email "martin.hynar@gmail.com"; git config --local --list'

alias ,ping_google_dns="ping -w 5 8.8.8.8; traceroute 8.8.8.8"

alias ,json="xclip -o | jq '.'"
