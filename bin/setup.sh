#!/bin/zsh


makeLink () {
    TARGET_FILE=$1
    SOURCE_FILE="${DOTFILES}${${TARGET_FILE}#${HOME}}"
    [ ! -f ${SOURCE_FILE} ] && echo "File ${SOURCE_FILE} does not exist!" && SOURCE_FILE="${DOTFILESCOMP}${${TARGET_FILE}#${HOME}}" && [ ! -f ${SOURCE_FILE} ] && echo "File ${TARGET_FILE} does not exist!" && exit 0
    echo -e "\t${TARGET_FILE} -> ${SOURCE_FILE}"
    rm -f ${TARGET_FILE} && ln -s ${SOURCE_FILE} ${TARGET_FILE}

}



# Initial Checks
DOTFILES=${HOME}/.dotfiles
DOTFILESCOMP=${HOME}/.dotfiles-company
EMACSD=~/.emacs.d
OH_MY_ZSH=~/.oh-my-zsh
[ ! -d ${DOTFILES} ] && echo "${DOTFILES} does not exist, exiting" && exit 1

echo -n "Refreshing .dotFiles from GitHub: "
git -C ${DOTFILES} pull

# OH MY ZSH
TARGET=${OH_MY_ZSH}
[ -d ${TARGET} ] && echo -en "Updating Oh My ZSH: " && git -C ${TARGET} pull
[ ! -d ${TARGET} ] && echo "Installing Oh My ZSH" && mkdir -p ${TARGET} && git clone git@github.com:robbyrussell/oh-my-zsh.git ${TARGET}

echo "Setting up Zsh and Oh-My-Zsh custom additions"
makeLink ${HOME}/.zshrc
mkdir -p ${OH_MY_ZSH}/custom/plugins/oh-my-company
mkdir -p ${OH_MY_ZSH}/custom/plugins/oh-my-settings
mkdir -p ${OH_MY_ZSH}/custom/plugins/oh-my-xfce
mkdir -p ${OH_MY_ZSH}/custom/plugins/oh-my-elasticsearch
makeLink ${OH_MY_ZSH}/custom/plugins/oh-my-settings/oh-my-settings.plugin.zsh
makeLink ${OH_MY_ZSH}/custom/plugins/oh-my-xfce/oh-my-xfce.plugin.zsh
makeLink ${OH_MY_ZSH}/custom/plugins/oh-my-elasticsearch/oh-my-elasticsearch.plugin.zsh




# EMACS
echo "Setting up Emacs configuration"
mkdir -p ${EMACSD}
makeLink ${EMACSD}/init.el

# YASNIPPET
TARGET=${EMACSD}/git-packages/yasnippet
[ -d ${TARGET} ] && echo -en "Updating Emacs YASnippet package: " && git -C ${TARGET} pull
[ ! -d ${TARGET} ] && echo "Installing Emacs YASnippet package" && mkdir -p ${TARGET} && git clone --recursive git@github.com:capitaomorte/yasnippet.git ${TARGET}  

# LEIN
DOT_LEIN=~/.lein
makeLink ${DOT_LEIN}/profiles.clj

# COMPANY SETTINGS
TARGET=${DOTFILESCOMP}
HOST="gitlab.eng.netsuite.com"
REPO="git@${HOST}:mhynar/dotfiles.git"
curl -f --connect-timeout 2 -s -k -o /dev/null ${HOST}
if [ $? -eq 0 ]; then
    [ -d ${TARGET} ] && echo -en "Updating Company dot files: " && git -C ${TARGET} pull
    [ ! -d ${TARGET} ] && echo "Installing Company dot files" && mkdir -p ${TARGET} && git clone "${REPO}" ${TARGET}
    makeLink ${OH_MY_ZSH}/custom/plugins/oh-my-company/oh-my-company.plugin.zsh
else
    echo "Company repo unavailable, skipping."
fi;
