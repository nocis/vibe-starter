#!/bin/bash

# need to create config file via this instead of mannually to avoid opencode inside container cannot write
# ln -sf ~/.opencode/.opencode.json ~/.opencode.json
ln -sf /app/.vibe/.opencode/opencode-config-local /app/.opencode
ln -sf /app/.vibe/.opencode/config/.opencode/* /app/.opencode/

# Create the link dynamically at runtime
# -s = symbolic, -f = force (overwrite if exists)
ln -sf /app/.vibe/.opencode/AGENTS.md /app/AGENTS.md

# create link to host path for opencode.nvim code piece context
ln -sf /app "$MY_PWD"

# Execute the main command passed to the container
exec "$@"
