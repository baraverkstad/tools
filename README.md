# Project Incubator

A project for experiments, tools and research.


## git-uptodate

Prints branch, stash, and working tree status for one or more repositories.

```bash
git uptodate [<dir>...]
```

Install into `~/.local`:

```bash
mkdir -p ~/.local/bin ~/.local/share/man/man1
cp bin/git-uptodate ~/.local/bin/
cp man/git-uptodate.1 ~/.local/share/man/man1/
```

Update your `PATH`/`MANPATH` if needed in `~/.zshrc`:

```bash
export PATH="$HOME/.local/bin:$PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"
```

Optionally create a git alias in `~/.gitconfig`:

```ini
[alias]
    up = uptodate
```

## frontmatter

Prints the YAML front-matter block from one or more files.

```bash
frontmatter <file>...
```

Install into `~/.local/bin`:

```bash
cp bin/frontmatter ~/.local/bin/
```
