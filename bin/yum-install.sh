#!/bin/bash

PACKAGES=()
PACKAGES=(${PACKAGES[@]} emacs)
PACKAGES=(${PACKAGES[@]} emacs-auto-complete)
PACKAGES=(${PACKAGES[@]} R)
PACKAGES=(${PACKAGES[@]} gnumeric)
PACKAGES=(${PACKAGES[@]} xrandr xbacklight)

sudo yum -y install ${PACKAGES[@]}
