#!/bin/bash
sudo mkdir -p /usr/legacy/lib64
sudo ln -sf /usr/lib64/libtcmalloc_minimal.so.4.5.9 /usr/legacy/lib64/libtcmalloc_minimal.so.0
cd ~/.local/share/Steam/steamapps/common/Counter-Strike\ Global\ Offensive
sed -i 's|export LD_LIBRARY_PATH="${GAMEROOT}"/bin:"${GAMEROOT}"/bin/linux64:$LD_LIBRARY_PATH|export LD_LIBRARY_PATH=/usr/legacy/lib64:"${GAMEROOT}"/bin:"${GAMEROOT}"/bin/linux64:$LD_LIBRARY_PATH|g' csgo.sh
