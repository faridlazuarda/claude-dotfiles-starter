#!/usr/bin/env bash
# Links the files in this repo into ~/.claude/ so Claude Code uses them.
# Safe to run again: existing files are backed up with a .bak ending.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

link() {
    local src="$1"
    local dst="$2"

    if [[ -L "$dst" && "$(readlink "$dst")" == "$src" ]]; then
        echo "Already linked: $dst"
        return
    fi
    if [[ -e "$dst" || -L "$dst" ]]; then
        echo "Backing up: $dst -> $dst.bak"
        mv "$dst" "$dst.bak"
    fi
    ln -s "$src" "$dst"
    echo "Linked: $dst -> $src"
}

mkdir -p "$CLAUDE_DIR/skills"

link "$REPO_DIR/CLAUDE.md" "$CLAUDE_DIR/CLAUDE.md"
link "$REPO_DIR/settings.json" "$CLAUDE_DIR/settings.json"

for skill in "$REPO_DIR"/skills/*/; do
    name="$(basename "$skill")"
    link "$REPO_DIR/skills/$name" "$CLAUDE_DIR/skills/$name"
done

echo "Done. Start a new Claude Code session to use the new setup."
