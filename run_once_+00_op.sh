#!/bin/sh

# 1Password command line tool installation

# Create .local/bin if doesnt exist
if ! [ -d ~/.local/bin ]
then
    mkdir -p ~/.local/bin
fi

# Add local bin to path
if ! [[ $PATH =~ "$HOME/.local/bin:" ]]
then
    export PATH=$HOME/.local/bin:$PATH
fi

curl -s https://cache.agilebits.com/dist/1P/op/pkg/v1.12.3/op_linux_amd64_v1.12.3.zip --output /tmp/op.zip
cd /tmp
unzip -o op.zip
gpg --receive-keys 3FEF9748469ADBE15DA7CA80AC2D62742012EA22
gpg --verify op.sig op
mv op ~/.local/bin
eval $(op signin my zsolt@szalacsi.com)
