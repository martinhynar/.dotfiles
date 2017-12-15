#!/bin/bash

PACKAGES=()
PACKAGES=(${PACKAGES[@]} zsh)
PACKAGES=(${PACKAGES[@]} vim)
PACKAGES=(${PACKAGES[@]} lshw htop )
PACKAGES=(${PACKAGES[@]} R)
PACKAGES=(${PACKAGES[@]} gnumeric)
PACKAGES=(${PACKAGES[@]} xrandr xbacklight)
PACKAGES=(${PACKAGES[@]} jq)
PACKAGES=(${PACKAGES[@]} xclip)
PACKAGES=(${PACKAGES[@]} i3 i3lock)
PACKAGES=(${PACKAGES[@]} git)
PACKAGES=(${PACKAGES[@]} java-1.8.0-openjdk-devel golang)
PACKAGES=(${PACKAGES[@]} sshfs)
#RPM FUSSION
PACKAGES=(${PACKAGES[@]} https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm)

PACKAGES=(${PACKAGES[@]} mplayer)

sudo dnf -y install "${PACKAGES[@]}"
