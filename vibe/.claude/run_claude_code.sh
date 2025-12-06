#!/bin/bash
cd "$(dirname "$0")" || exit
mkdir ./claude-config
sudo touch ./claude-config/.claude.json
sudo chmod -R +rwx ./claude-config
docker compose -f docker-compose.yml run --build --rm claude-cli-node claude
rm -f ../../CLAUDE.md
