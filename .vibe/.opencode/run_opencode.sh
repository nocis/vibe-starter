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
  -e OPENCODE_PORT="${OPENCODE_PORT:-4096}" \
  -e OPENCODE_PASSWORD=false \
  opencode-cli-node \
  bash -c 'opencode serve --hostname 0.0.0.0 --port "$OPENCODE_PORT" & until curl -sf "http://127.0.0.1:$OPENCODE_PORT/global/health" >/dev/null 2>&1; do sleep 0.3; done; opencode --server "http://127.0.0.1:$OPENCODE_PORT"'

# --hostname 0.0.0.0 is required for opencode listen docker bridge

rm -f ../../AGENTS.md
rm -f ../../.opencode
