#!/bin/bash

PACKAGES=()
PACKAGES=(${PACKAGES[@]} emacs)
PACKAGES=(${PACKAGES[@]} emacs-auto-complete)
PACKAGES=(${PACKAGES[@]} R)
PACKAGES=(${PACKAGES[@]} gnumeric)
sudo yum -y install ${PACKAGES[@]}
