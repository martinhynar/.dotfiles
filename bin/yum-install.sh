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
PACKAGES=(${PACKAGES[@]} ShellCheck ctags tidy)
PACKAGES=(${PACKAGES[@]} erlang erlang-eunit)


sudo dnf -y install "${PACKAGES[@]}"
