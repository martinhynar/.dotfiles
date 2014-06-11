#PATHS
PATH=$PATH:~/bin/p4v-2013.4.770799/bin
PATH=$PATH:~/bin/gradle-1.11/bin

#ALIASES
alias ,oh-my-company-edit="emacs ~/.oh-my-zsh-custom/plugins/oh-my-company/*"

alias ,gp='git pull; notify-send "git pull finished"'
alias ,gs='git status'
alias ,hosts='cat /etc/hosts | grep -v "#"'
alias ,pn="cd ~/Projects/NetSuite"

_vssh() { ssh -o BatchMode=yes -o StrictHostKeyChecking=no -o UserKnownHostsFile=temp_known_hosts.mh-build -o PasswordAuthentication=no nsbuild@$1.vm.netsuite.com }
alias ,vssh=_vssh

alias ,scrumvm_mhynar=",vssh mhynar.vm.netsuite.com"
alias ,mhynar_coverage=",vssh mhynar-coverage"


_provision() { sh /webdev/Costars/bin/provision.sh $@ }
alias ,provision="_provision $@"
alias ,provision-coverage-server="_provision --vm-name mhynar-coverage --workspace=DevAdmin --cpu 1 --memory 4096 --add-disk /coverage-workspace:50 --state salt"


_vagrant() { pushd $1; vagrant $2; popd }
alias ,vagrant_devbox_up="_vagrant ~/Projects/NetSuite/salt-states/ up"
alias ,vagrant_devbox_halt="_vagrant ~/Projects/NetSuite/salt-states/ halt"



,git_pull_all_NS_projects() {
  pushd ~/Projects/NetSuite/salt-states
  git pull
  popd
  pushd ~/Projects/NetSuite/salt-pillar
  git pull
  popd
}

# PERFORCE
[ ! -f ${HOME}/.p4 ] && echo "File '${HOME}/.p4' does not exist. Populate it with variables P4PORT, P4USER, P4PASSWD, P4CLIENT to make P4 functional."
[ -f ${HOME}/.p4 ] && source ${HOME}/.p4

_p4sync() {
  p4 sync //depot/Bamboo/...
  p4 sync //depot/Costars/...
  p4 sync //depot/NetLedger/...
  p4 sync //depot/Tools/...
  p4 sync //depot/Sandbox/...
}

alias ,p4sync=_p4sync
