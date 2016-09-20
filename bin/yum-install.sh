#!/bin/bash

PACKAGES=()
PACKAGES=(${PACKAGES[@]} emacs)
PACKAGES=(${PACKAGES[@]} emacs-auto-complete)
PACKAGES=(${PACKAGES[@]} R)
PACKAGES=(${PACKAGES[@]} gnumeric)
PACKAGES=(${PACKAGES[@]} xrandr xbacklight)
PACKAGES=(${PACKAGES[@]} jq)
PACKAGES=(${PACKAGES[@]} xclip)
PACKAGES=(${PACKAGES[@]} git)
PACKAGES=(${PACKAGES[@]} ShellCheck ctags)


sudo yum -y install ${PACKAGES[@]}
