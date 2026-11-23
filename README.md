# md-preview

A [fish](https://fishshell.com) function, `md`, that renders a Markdown file to a self-contained dark HTML page in `/tmp` and opens it with the default application for HTML files.

```fish
md README.md    # writes /tmp/README.html and opens it
```

## Features

- GitHub-flavored Markdown via pandoc (tables, task lists, footnotes, `> [!NOTE]` alerts).
- Dark theme based on [github-markdown-css](https://github.com/sindresorhus/github-markdown-css), with a muted pastel palette.
- SF Pro Display for text, New York for blockquotes, SF Mono for code.
- Pastel syntax highlighting for code blocks.
- Outline sidebar (h1–h3) with the current section highlighted. Toggle it with the ☰ button or the `t` key; the choice is remembered.
- Single-file output: CSS and local images are embedded.

## Requirements

- fish (uses the `path` builtin; tested with 4.9.3)
- [fisher](https://github.com/jorgebucaran/fisher) (tested with 4.4.5)
- pandoc with the `--syntax-highlighting` option (tested with 3.11)
- A browser set as the default application for `text/html`. On Linux `md` uses fish's `open`, which calls `xdg-open`. Check with `xdg-mime query default text/html` and set with `xdg-mime default firefox.desktop text/html`.
- Fonts (optional): SF Pro Display, New York and SF Mono. If they are missing, the page uses the platform's own fonts: the system font on macOS, Segoe UI / Cascadia / Cambria on Windows, and on Linux the first installed of Inter, Noto, Roboto, Cantarell or DejaVu (sans), Charter, Source Serif 4, Noto Serif or Georgia (serif), and JetBrains Mono, Fira Mono, Noto Sans Mono or DejaVu Sans Mono (monospace). Fallback fonts are usually wider than SF Pro Display, so lines hold somewhat fewer characters.

## Install

```fish
fisher install ~/Code/gondor/md-preview
```

Or from GitHub:

```fish
fisher install cmoro-deusto/md-preview
```

After editing the repo, run `fisher update ~/Code/gondor/md-preview` to reinstall.

## Uninstall

```fish
fisher remove ~/Code/gondor/md-preview
```

## Layout

```
functions/md.fish                       the function
functions/__md_preview/template.html    pandoc HTML template (styles, outline, script)
functions/__md_preview/github-markdown-dark.css
functions/__md_preview/syntax.theme     pandoc syntax highlighting theme
completions/md.fish                     completes .md / .markdown files
```

The assets live in a subdirectory of `functions/` because fisher only installs `functions/`, `conf.d/`, `completions/` and `themes/`. The function finds them relative to its own file.

## License

MIT, see [LICENSE](LICENSE).

## Third-party

`github-markdown-dark.css` is from github-markdown-css 5.9.0 by Sindre Sorhus, MIT licensed; see `functions/__md_preview/github-markdown-css.LICENSE`.
