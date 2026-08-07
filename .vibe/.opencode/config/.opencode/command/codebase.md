---
description: Manage the .codebase/ project knowledge base (init, sync, validate).
agent: build
---

The user ran `/codebase $ARGUMENTS`.

Look at the first word of the arguments and act accordingly:

- **init** — Invoke the `context-keeper` subagent (task tool) with operation `init`. This is foreground and may surface clarifying questions from context-keeper — relay them to the user.
- **sync** — Invoke the `context-keeper` subagent with operation `compact`, forced immediately regardless of buffer size or threshold.
- **validate** — Invoke the `context-keeper` subagent with operation `validate` and report its findings back verbatim.
- **anything else, or empty** — Don't guess which operation was meant. Reply with:
  ```
  Usage: /codebase init | sync | validate

  init     - bootstrap .codebase/ for this project (one-time)
  sync     - force ContextKeeper to compact the pending buffer now
  validate - check .codebase/ for size limits, broken links, staleness
  ```
  and stop.

Arguments: $ARGUMENTS
