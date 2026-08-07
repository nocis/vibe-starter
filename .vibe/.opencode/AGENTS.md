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

## 6. Codebase Knowledge via .codebase/

To minimise token usage and keep project knowledge reliable across sessions, use the `.codebase/` knowledge system instead of ad-hoc rescanning:

1. **Before proposing any implementation plan**, invoke the `context-scout` subagent (task tool) to discover which `.codebase/` files are relevant to the task. Load only what it returns — don't preemptively read the whole tree.
2. **If `.codebase/` doesn't exist yet** for this project, that is not an error. Mention that `/codebase init` is available, but don't run it unprompted — bootstrapping is the user's call.
3. **After a coding task is completed and verified** (build/tests reported to the user), invoke the `context-keeper` subagent with operation `record`, in the background, to log what happened. Do not block on it before continuing.
4. **Only `context-keeper` may write to `.codebase/**`.** No other agent — including you — edits those files directly.
5. This replaces the old single-file `CODEBASE.md` protocol. If a stray `CODEBASE.md` exists from before this system, treat `.codebase/` as authoritative and ignore it.

## Notes

- These rules are non-negotiable within this project.
- If a rule conflicts with a user’s direct request, the assistant must **remind the user of the rule** and ask for clarification before proceeding.
