# Tools & Utilities

A small collection of command-line tools and utilities.


## git-uptodate

Prints branch, stash, and working tree status for one or more repositories.

```bash
git uptodate [<dir>...]
```

Install into `~/.local`:

```bash
DIR=~/.local/bin
MAN=~/.local/share/man/man1
URL=https://raw.githubusercontent.com/baraverkstad/tools/main
mkdir -p $DIR $MAN
curl -o $DIR/git-uptodate $URL/bin/git-uptodate
curl -o $MAN/git-uptodate.1 $URL/man/git-uptodate.1
chmod +x $DIR/git-uptodate
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
frontmatter <file|dir>...
```

Install into `~/.local/bin`:

```bash
DIR=~/.local/bin
URL=https://raw.githubusercontent.com/baraverkstad/tools/main
mkdir -p $DIR
curl -o $DIR/frontmatter $URL/bin/frontmatter
chmod +x $DIR/frontmatter
```
