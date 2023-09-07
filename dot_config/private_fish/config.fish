# disable fish greeting
set fish_greeting ""

fish_add_path ~/.local/bin
fish_add_path ~/bin
fish_add_path ~/go/bin

set EDITOR vim
set KUBE_EDITOR vim

alias vi vim

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"


sh ~/.local/bin/agent-bridge.sh
