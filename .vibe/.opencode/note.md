1. opencode rely on snapshot to undo redo, heavily use git, so if a .gitignore is missing and our local folder have .vibe and opencode db and cache folder, the git process will dramatically slow down the opencode and ruin the user experience for our docker volume attach usage

Recommend .gitignore

.git
.vibe
.opencode
node_modules/
dist/
build/
.cache/
