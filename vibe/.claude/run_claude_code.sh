#!/bin/bash
echo "Setting up Claude CLI Docker environment..."
cd "$(dirname "$0")" || exit

mkdir ./claude-config
touch ./claude-config/.claude.json

# run command with matched user
docker compose -f docker-compose.yml run --build --rm \
    --user "$(id -u):$(id -g)" \
    claude-cli-node claude

rm -f ../../CLAUDE.md
