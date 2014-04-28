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

oracle_start () {
su - oracle -c '
emctl start dbconsole;
lsnrctl start;
sqlplus sys/oracle as sysdba <<-EOF
startup
select vi.host_name, vd.name from v\$instance vi, v\$database vd;
quit
EOF
'
}


,git_pull_all_NS_projects() {
  pushd ~/Projects/NetSuite/salt-states
  git pull
  popd
  pushd ~/Projects/NetSuite/salt-pillar
  git pull
  popd
}

# PERFORCE
export P4PORT=rebarbora.corp.netledger.com:1667
export P4USER=mhynar
export P4PASSWD=Klobasa2
export P4CLIENT=mhynar_localhost
export P4IGNORE=.p4ignore
