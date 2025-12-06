#!/bin/bash
cd "$(dirname "$0")" || exit
mkdir ./claude-config
docker compose -f docker-compose.yml run --build --rm claude-cli-node claude
