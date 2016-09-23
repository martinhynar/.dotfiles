# PATHS
WORKBENCH=~/Workbench

PATH=~/bin:${PATH}
PATH=~/.cache/rebar3/bin:${PATH}

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

# DOCKER
alias ,dk_c_ui="docker run -d -p 127.0.0.1:9000:9000 --name docker_ui --privileged -v /var/run/docker.sock:/var/run/docker.sock dockerui/dockerui"
alias ,dk_ui="docker start docker_ui"
alias ,dk_c_es142="docker run -d -p 127.0.0.1:9200:9200 -p 127.0.0.1:9300:9300 --name elasticsearch_142 barnybug/elasticsearch:1.4.2"
alias ,dk_es142="docker start elasticsearch_142"
alias ,dk_c_kibana4="docker run --name kibana4_b3 -e ELASTICSEARCH=http://localhost:9200 -P marcbachmann/kibana4:4.0.0-BETA3"
alias ,dk_kibana4="docker start kibana4_b3"

alias ,ping_google_dns="ping -w 5 8.8.8.8; traceroute 8.8.8.8"

alias ,json="xclip -o | jq '.'"
alias ,mm="cd ~/Projects/Zakazky/mujmazel.cz"
alias ,mmstart="cd ~/Projects/Zakazky/mujmazel.cz/vagrant; vagrant up"
alias ,mmend="cd ~/Projects/Zakazky/mujmazel.cz/vagrant; vagrant halt"

alias ,rebar_install="wget https://github.com/erlang/rebar3/releases/download/3.3.1/rebar3 && chmod +x rebar3"
