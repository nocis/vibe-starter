#!/bin/sh

# Create the link dynamically at runtime
# -s = symbolic, -f = force (overwrite if exists)
ln -sf /app/vibe/.claude/CLAUDE.md /app/CLAUDE.md

# Execute the main command passed to the container
exec "$@"
