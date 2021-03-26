#!/usr/bin/env bash

# Themes https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH="/usr/share/oh-my-zsh/"
ZSH_THEME="robbyrussell"
ZSH_DISABLE_COMPFIX=true
HIST_STAMPS="dd/mm/yyyy"
plugins=(git)

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export BROWSER="/usr/bin/google-chrome-beta"
export EDITOR="nano"
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
export TERM="xterm-256color"
export STUDIO_JDK=/usr/lib/jvm/java-11-openjdk

# sudo easy
alias chmod="sudo chmod"
alias mv="sudo mv"
alias pacman="sudo pacman"
alias pkill="sudo pkill"
alias rm="sudo rm"
alias systemctl="sudo systemctl"
alias sed="sudo sed"

# octopus
 alias dot="cd $HOME/.dotfiles && clear && ls -1"
 alias install="sudo pacman -S $1"
 alias proc="pacman -Ss $1"
 alias drop="sudo pacman -Rns $1"
 alias info="pacman -Qi $1"
 alias qs="pacman -Qs $1"

source $HOME/.config/functions.sh

function fetch() {
  ./.dotfiles/home/.config/scripts/fetch.sh gnu
}

function vm1 () {
ssh vitor@177.180.12.157
}

function vm2 () {
ssh vitor@147.75.63.219
}

function job () {
mkdir GitHub
cd GitHub
git clone https://github.com/vulkan-ops/arch arch
git clone https://github.com/AOSPK-Devices/device_motorola_ocean ocean-dt
git clone https://github.com/AOSPK-Devices/device_motorola_sdm632-common common-tree
git clone https://gitlab.com/AOSPK-Devices/vendor_motorola_ocean vendor-ocean
git clone https://gitlab.com/AOSPK-Devices/vendor_motorola_sdm632-common vendor-common
git clone https://github.com/AOSPK-Devices/kernel_motorola_sdm632 kernel
}

function v () {
export CCACHE_EXEC=$(which ccache)
export USE_CCACHE=1
export CCACHE_DIR=$HOME/.ccache
ccache -M 50G
. build/envsetup.sh
lunch aosp_${1}-userdebug
make bacon -j$(nproc --all) | tee ${1}.log
}

