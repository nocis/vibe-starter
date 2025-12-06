#!/bin/bash
cd "$(dirname "$0")" || exit
mkdir ./gemini-config
sudo chmod -R +rwx ./gemini-config
docker compose -f docker-compose.yml run --build --rm gemini-cli-node gemini
rm -f ../../GEMINI.md
