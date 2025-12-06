#!/bin/sh

#
#
#
# Create the link dynamically at runtime
# -s = symbolic, -f = force (overwrite if exists)
ln -sf /app/vibe/.gemini/GEMINI.md /app/GEMINI.md

# Execute the main command passed to the container
exec "$@"
