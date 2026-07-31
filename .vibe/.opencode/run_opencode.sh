#!/bin/bash

export MY_PWD=$(pwd)

echo "Setting up opencode CLI Docker environment..."
cd "$(dirname "$0")" || exit

mkdir ./opencode-state
mkdir ./opencode-share
mkdir ./opencode-config-local
# touch ./opencode-config.jsonc

# run command with matched user
docker compose -f docker-compose.yml run --build --rm \
  --user "$(id -u):$(id -g)" \
  --service-ports \
  opencode-cli-node opencode --hostname 0.0.0.0 --port "${OPENCODE_PORT:-4096}"

# --hostname 0.0.0.0 is required for opencode listen docker bridge

rm -f ../../AGENTS.md
rm -f ../../.opencode
