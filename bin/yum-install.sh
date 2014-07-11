#!/bin/bash

PACKAGES=()
PACKAGES=(${PACKAGES[@]} emacs)
PACKAGES=(${PACKAGES[@]} emacs-auto-complete)

sudo yum -y install ${PACKAGES[@]}
