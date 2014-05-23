#!/bin/zsh


makeLink () {
    TARGET_FILE=$1
    SOURCE_FILE="${DOTFILES}${${TARGET_FILE}#${HOME}}"
    [ ! -f ${SOURCE_FILE} ] && echo "File ${TARGET_FILE} does not exist!" && exit 1
    echo -e "\t${TARGET_FILE} -> ${SOURCE_FILE}"
    rm -f ${TARGET_FILE} && ln -s ${SOURCE_FILE} ${TARGET_FILE}

}



# Initial Checks
DOTFILES=${HOME}/.dotfiles
EMACSD=~/.emacs.d
OH_MY_ZSH=~/.oh-my-zsh
[ ! -d ${DOTFILES} ] && echo "${DOTFILES} does not exist, exiting" && exit 1

echo -n "Refreshing .dotFiles from GitHub: "
git -C ${DOTFILES} pull

# OH MY ZSH
TARGET=${OH_MY_ZSH}
[ -d ${TARGET} ] && echo -en "Updating Oh My ZSH: " && git -C ${TARGET} pull
[ ! -d ${TARGET} ] && echo "Installing Oh My ZSH" && mkdir -p ${TARGET} && git -C ${TARGET} clone git@github.com:robbyrussell/oh-my-zsh.git .

echo "Setting up Zsh and Oh-My-Zsh custom additions"
makeLink ${HOME}/.zshrc
mkdir -p ${OH_MY_ZSH}/custom/plugins/oh-my-company
mkdir -p ${OH_MY_ZSH}/custom/plugins/oh-my-settings
makeLink ${OH_MY_ZSH}/custom/plugins/oh-my-settings/oh-my-settings.plugin.zsh
makeLink ${OH_MY_ZSH}/custom/plugins/oh-my-company/oh-my-company.plugin.zsh




# EMACS
echo "Setting up Emacs configuration"
mkdir -p ${EMACSD}
makeLink ${EMACSD}/init.el

# YASNIPPET
TARGET=${EMACSD}/git-packages/yasnippet
[ -d ${TARGET} ] && echo -en "Updating Emacs YASnippet package: " && git -C ${TARGET} pull
[ ! -d ${TARGET} ] && echo "Installing Emacs YASnippet package" && mkdir -p ${TARGET} && git -C ${TARGET} clone --recursive git@github.com:capitaomorte/yasnippet.git .
