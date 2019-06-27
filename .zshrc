ZSH=$HOME/.oh-my-zsh
ZSH_THEME="fishy"

DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(vscode docker gitfast history-substring-search compleat history oh-my-settings oh-my-company)

source $ZSH/oh-my-zsh.sh

_prompt() {
    c1=$white
    c2=$bwhite
    c3=$grey
    PROMPT="${c1}$c1($c2%n$c1@$c2%m$c1)$c1($c2%~$c1)%#$normal "
    RPROMPT=""
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/mhynar/.sdkman"
[[ -s "/home/mhynar/.sdkman/bin/sdkman-init.sh" ]] && source "/home/mhynar/.sdkman/bin/sdkman-init.sh"

#so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
stty -ixon
