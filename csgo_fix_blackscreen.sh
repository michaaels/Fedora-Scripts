#!/bin/bash
#https://github.com/ValveSoftware/csgo-osx-linux/issues/2659#issuecomment-962417347
sudo dnf install -y gperftools-libs # Just in case we don't have the library yet.

sudo mkdir -p /usr/legacy/lib64
sudo ln -sf /usr/lib64/libtcmalloc_minimal.so.4.5.9 /usr/legacy/lib64/libtcmalloc_minimal.so.0
cd ~/.local/share/Steam/steamapps/common/Counter-Strike\ Global\ Offensive # Installation directory of csgo
sed -i 's|export LD_LIBRARY_PATH="${GAMEROOT}"/bin:"${GAMEROOT}"/bin/linux64:$LD_LIBRARY_PATH|export LD_LIBRARY_PATH=/usr/legacy/lib64:"${GAMEROOT}"/bin:"${GAMEROOT}"/bin/linux64:$LD_LIBRARY_PATH|g' csgo.sh
