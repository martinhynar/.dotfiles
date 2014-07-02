# PATHS
WORKBENCH=~/Workbench

PATH=~/bin:${PATH}

JAVA_HOME=/usr/java/latest/
PATH=${JAVA_HOME}:${PATH}

TMP=/tmp; export TMP
TMPDIR=$TMP; export TMPDIR

# GOLANG
export GOPATH=~/Projects/Go
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

alias mygithub="cd ${WORKBENCH}/Projects/My.GitHub"
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

xdg-mime default emacs.desktop text/plain
xdg-mime default emacs.desktop application/xml

xdg-mime default google-chrome.desktop x-scheme-handler/http
xdg-mime default google-chrome.desktop x-scheme-handler/https


EMACS_DAEMON=$(ps -C "emacs" -o pid,args | grep "daemon" | awk '{print $1}')
[ -z "${EMACS_DAEMON}" ] && echo "Starting Emacs daemon" && /usr/bin/emacs --daemon &


start_emacs() {
  emacsclient --alternate-editor="" --create-frame $@ &
}
alias emacs=start_emacs
alias e=start_emacs


# GIT
alias ,gcm="git commit -m $@"
alias ,gs="git status"
alias ,gp="git push"
alias ,gpt="git push --tags"


