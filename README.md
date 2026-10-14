# claude-dotfiles-starter

A very small starter setup for [Claude Code](https://docs.claude.com/en/docs/claude-code/overview).

"Dotfiles" are the settings files that live in your home folder, often in
folders that start with a dot, like `~/.claude`. Keeping them in a git repo
means you can save every change, undo mistakes, and use the same setup on
every computer.

## What is inside

| File | What it does |
|---|---|
| `CLAUDE.md` | Your rules. Claude reads them at the start of every session. |
| `settings.json` | Which commands Claude may run without asking, and which it may never run. |
| `skills/explain/SKILL.md` | An example skill. Type `/explain` in Claude Code to use it. |
| `setup.sh` | Links these files into `~/.claude/` so Claude Code finds them. |

## Install

You need [git](https://git-scm.com/downloads) and Claude Code installed first.

1. Copy this repo to your computer:

   ```bash
   git clone https://github.com/faridlazuarda/claude-dotfiles-starter.git ~/claude-dotfiles-starter
   ```

2. Run the setup script:

   ```bash
   bash ~/claude-dotfiles-starter/setup.sh
   ```

3. Start Claude Code in any project folder:

   ```bash
   claude
   ```

If you already had a `~/.claude/CLAUDE.md` or `~/.claude/settings.json`, the
script keeps your old file with a `.bak` ending.

## Make it yours

The files in `~/.claude/` are links to this repo. So you edit the files here,
and Claude Code sees the change in its next session.

1. Open `CLAUDE.md` and add a rule under "My own rules".
2. Save the change in git:

   ```bash
   cd ~/claude-dotfiles-starter
   git add CLAUDE.md
   git commit -m "Add my first rule"
   ```

To add a new skill, copy the `skills/explain` folder, give it a new name, edit
its `SKILL.md`, and run `setup.sh` again.

## Useful things to know in Claude Code

- `Esc` stops Claude in the middle of a task.
- `Shift+Tab` switches to plan mode. Claude plans but changes nothing.
- `/clear` starts a fresh conversation. Use it between tasks.
- Read every permission prompt before you say yes.

## Undo the setup

Delete the links, then rename any `.bak` files back:

```bash
rm ~/.claude/CLAUDE.md ~/.claude/settings.json ~/.claude/skills/explain
```
