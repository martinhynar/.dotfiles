#!/bin/zsh


# Initial Checks
DOTFILES=${HOME}/.dotfiles
EMACSD=~/.emacs.d
OH_MY_ZSH=~/.oh-my-zsh
[ ! -d ${DOTFILES} ] && echo "${DOTFILES} does not exist, exiting" && exit 1
[ ! -d ${EMACSD} ] && echo "${EMACSD} does not exist, exiting" && exit 1
[ ! -d ${OH_MY_ZSH} ] && echo "${EMACSD} does not exist, exiting" && exit 1

echo -e "\033[1;33mRefreshing from GitHub\033[0m"
pushd ${DOTFILES}
git pull
popd

makeLink () {
    TARGET_FILE=$1
    SOURCE_FILE="${DOTFILES}${${TARGET_FILE}#${HOME}}"
    [ ! -f ${TARGET_FILE} ] && echo "File ${TARGET_FILE} does not exist!" && exit 1
    [ ! -f ${SOURCE_FILE} ] && echo "File ${TARGET_FILE} does not exist!" && exit 1
    echo -e "    ${TARGET_FILE} \033[1;33m->\033[0m ${SOURCE_FILE}"
    rm -f ${TARGET_FILE} && ln -s ${SOURCE_FILE} ${TARGET_FILE}

}


echo -e "\033[1;33mSetting up Emacs configuration\033[0m"
makeLink ${EMACSD}/init.el

echo -e "\033[1;33mSetting up Zsh and Oh-My-Zsh custom additions\033[0m"
makeLink ${HOME}/.zshrc
makeLink ${OH_MY_ZSH}/custom/plugins/oh-my-company/oh-my-company.plugin.zsh
makeLink ${OH_MY_ZSH}/custom/plugins/oh-my-company/oh-my-company.plugin.zsh

