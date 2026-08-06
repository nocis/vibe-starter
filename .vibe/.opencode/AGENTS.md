# Project Context

## 1. No Git Operations

- Never run file change `git` command (commit, push, clone, etc.).
- feel free run safe git commands (diff, etc.)
- Assume version control is handled manually by the user.

## 2. No Build / Install / Test Commands

- **Never** execute `yarn`, `npm`, `pnpm`, `tsc`, `cargo`, `make`, or any command that:
  - installs dependencies
  - builds the project
  - runs tests
  - checks the environment
- The user will run these commands manually.  
- You may provide the command for the user to run, but do not execute it.

## 3. Implementation Gate: Plan Required

- **Refuse** to implement any major feature or large fix without an explicit, approved plan.
- When asked to make a change, reply with a concise plan first.
- Do not write any code until the user explicitly confirms the plan.

## 4. Plan Grilling

- Before finalizing any implementation plan, actively grill the user.
- Only after the user’s answers are satisfactory, finalize the plan and request approval to proceed.
- Avoid redundant or hypothetical questions. If a request is trivially simple, you may skip the grill after stating that the change is trivial and asking for confirmation.

## 5. Manageable Code Edits

- Keep every code edit **small and atomic** so it’s easy to undo and understand.
- Break large changes into a sequence of separate edit rounds.
- After each edit, briefly summarise what was changed and why.
- batch very small, non‑interdependent edits into one round if each is clearly delimited and reversible

## 6. Efficient Codebase Understanding via CODEBASE.md

To minimise token usage and context scanning, follow this procedure before any codebase reading or analysis:

1. Check if a file named `CODEBASE.md` exists in the project root.
2. **If `CODEBASE.md` exists:**
   - Read **only the first line** (expected to be a timestamp, e.g., `2026-08-06T10:00:00Z`).
   - Decide whether the file is **out of date or invalid** based on the timestamp (e.g., clearly stale compared to recent changes you are aware of).
   - If you’re uncertain whether CODEBASE.md is stale, ask the user: ‘Has the project structure changed since this timestamp?’ before trusting it.
3. **If `CODEBASE.md` is missing or invalid:**
   - Perform the necessary codebase exploration (reading files, directories, structure, project goal, progress, understanding).
   - Summarise your findings in a new or updated `CODEBASE.md`.
   - The first line must be the current update timestamp in ISO 8601 format.
   - The rest of the file should contain an up-to-date project understanding,structural overview, key modules, and any relevant notes that will help you skip deep scans in future interactions.
4. If `CODEBASE.md` is valid and up-to-date, rely on it for context without re-scanning the entire codebase.

## Notes

- These rules are non-negotiable within this project.
- If a rule conflicts with a user’s direct request, the assistant must **remind the user of the rule** and ask for clarification before proceeding.
