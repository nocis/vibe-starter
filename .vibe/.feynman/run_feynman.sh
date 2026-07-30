#!/bin/bash
echo "Setting up feynman CLI Docker environment..."
cd "$(dirname "$0")" || exit

mkdir ./feynman-config
#

# run command with matched user
docker compose -f docker-compose.yml run --build --rm \
  --user "$(id -u):$(id -g)" \
  --service-ports \
  feynman-cli-node \
  /bin/bash
#  feynman --host 0.0.0.0 --port "${FEYNMAN_PORT:-6174}"

rm -f ../../feynman.md
