# Tools & Utilities

A small collection of command-line tools and utilities.


## git-uptodate

Prints branch, stash, and working tree status for one or more repositories.

```bash
git uptodate [<dir>...]
```

Example output:

<pre>
──── tools ─────────────────────────────────────────────────
<span style="color:red;font-weight:bold">[!]</span> 2 staged, 1 modified file(s)
<span style="color:green;font-weight:bold">• main</span>                <span style="color:gray">--> origin/main                            [0 ahead, 0 behind]</span>
</pre>

### Install via Homebrew

```bash
brew tap baraverkstad/tools https://github.com/baraverkstad/tools
brew install git-uptodate
```

Optionally create a git alias in `~/.gitconfig`:

```ini
[alias]
    up = uptodate
```

### Manual install

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


## frontmatter

Prints the YAML front-matter block from one or more files.

```bash
frontmatter <file|dir>...
```

### Install via Homebrew

```bash
brew tap baraverkstad/tools https://github.com/baraverkstad/tools
brew install frontmatter
```

### Manual install

```bash
DIR=~/.local/bin
MAN=~/.local/share/man/man1
URL=https://raw.githubusercontent.com/baraverkstad/tools/main
mkdir -p $DIR $MAN
curl -o $DIR/frontmatter $URL/bin/frontmatter
curl -o $MAN/frontmatter.1 $URL/man/frontmatter.1
chmod +x $DIR/frontmatter
```

Update your `PATH`/`MANPATH` if needed in `~/.zshrc`:

```bash
export PATH="$HOME/.local/bin:$PATH"
export MANPATH="$HOME/.local/share/man:$MANPATH"
```
