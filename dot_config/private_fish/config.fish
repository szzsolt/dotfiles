# disable fish greetin# disable fish greeting
set fish_greeting ""

fish_add_path ~/.local/bin
fish_add_path ~/bin
fish_add_path ~/go/bin

source ~/.asdf/asdf.fish
source ~/secrets.fish

if status is-interactive
    set EDITOR nvim
    set KUBE_EDITOR nvim
    alias vi nvim


    starship init fish | source
    atuin init fish --disable-up-arrow | source
    zoxide init fish | source

end
