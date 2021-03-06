#!/bin/bash

function writeEula() {
  if ! echo "# Generated via Docker
# $(date)
eula=${EULA,,}
" >/usr/src/minecraft/eula.txt; then
    log "ERROR: unable to write eula to /usr/src/minecraft/. Please make sure attached directory is writable by uid=${UID}"
    exit 2
  fi
}

function updateOps() {
  echo $OPS | awk -v RS=, '{print}' > /usr/src/minecraft/ops.txt
}

writeEula
updateOps

echo "Starting your Minecraft server....."

java -Xmx1024M -Xms1024M -jar /usr/src/minecraft/server.jar nogui