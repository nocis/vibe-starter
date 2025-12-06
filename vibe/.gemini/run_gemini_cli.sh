#!/bin/bash
echo "Setting up Gemini CLI Docker environment..."
cd "$(dirname "$0")" || exit

mkdir ./gemini-config
#

# run command with matched user
docker compose -f docker-compose.yml run --build --rm \
    --user "$(id -u):$(id -g)" \
    gemini-cli-node gemini

rm -f ../../GEMINI.md
