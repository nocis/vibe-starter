#!/bin/bash

# need to create config file via this instead of mannually to avoid claude inside container cannot write
ln -sf ~/.claude/.claude.json ~/.claude.json

# Create the link dynamically at runtime
# -s = symbolic, -f = force (overwrite if exists)
ln -sf /app/vibe/.claude/CLAUDE.md /app/CLAUDE.md

# Execute the main command passed to the container
exec "$@"
