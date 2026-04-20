# Slate LaTeX Theme

Simple LaTeX classes for resumes, academic CVs, and cover letters.

| File | Purpose |
|---|---|
| `slate.sty` | Shared styling, colors, header, and PDF metadata |
| `slate-resume.cls` | Resume and CV class |
| `slate-letter.cls` | Cover letter class |

## Requirements

Requires a LaTeX distribution with `pdflatex`. Tested with [TinyTeX](https://yihui.org/tinytex/).

```sh
pdflatex --version
```

Install TinyTeX if needed:

```sh
curl -sL "https://yihui.org/tinytex/install-bin-unix.sh" | sh
```

## Usage

Place `slate.sty`, `slate-resume.cls`, and `slate-letter.cls` in the same directory as your `.tex` file. Your document should start with either:

```tex
\documentclass{slate-resume}   % resume or CV
\documentclass{slate-letter}   % cover letter
```

Compile with:

```sh
pdflatex resume.tex
```

See [examples/](./examples/) for working `resume.tex`, `cv.tex`, and `cover-letter.tex` samples.

Build the examples from the repo root with `make`:

```sh
make          # build all examples
make resume   # build examples/resume.pdf
make cv       # build examples/cv.pdf
make letter   # build examples/cover-letter.pdf
make watch    # continuous rebuild of examples/resume.pdf on file change
make clean    # remove build artifacts
```

Missing packages are installed automatically by TinyTeX on first run.

## Class Options

Pass options to `\documentclass[...]{slate-resume}` or `\documentclass[...]{slate-letter}`.

| Option | Effect |
|---|---|
| `letterpaper` | US Letter, 8.5 by 11 inches |
| `a4paper` | A4, 210 by 297 millimeters |
| `10pt`, `11pt`, `12pt` | Base font size |
| `nofont` | Skip loading `newtxtext` and `newtxmath` |
| `nocolorlinks` | Disable colored hyperlinks and PDF link borders |

Defaults: `slate-resume` uses `letterpaper`, `11pt`, and 0.5 inch margins. `slate-letter` uses `letterpaper`, `12pt`, and 1 inch margins.

Example:

```tex
\documentclass[a4paper,12pt]{slate-resume}
```

## Shared Commands

Provided by `slate.sty`, available in both classes.

| Command | Args | Use |
|---|---|---|
| `\slatemeta{title}{author}{subject}{keywords}` | 4 | Set PDF metadata shown in viewers and archives |
| `\slateheader{name}{contact}{link}` | 3 | Page header with name, contact line, and link |
| `\sep` | 0 | Dot separator between inline items |

## Resume and CV Commands

Provided by `slate-resume.cls`.

| Command | Args | Use |
|---|---|---|
| `\educationentry{degree}{dates}{institution}` | 3 | Education section |
| `\experienceentry{role}{org}{location}{dates}` | 4 | Experience section |
| `\projectentry{name}{description}{tech}` | 3 | Projects section |
| `\publicationentry{authors}{title}{venue}` | 3 | Publications section |
| `\skillentry{category}{items}` | 2 | Skill group, one line per category |
| `\entrygap` | 0 | Vertical space between entries |

### Page Break Control

Wrap any entry and its bullets in `\begin{entryblock}...\end{entryblock}` to prevent mid-block page splits. Section headers automatically avoid being orphaned at the bottom of a page.

```tex
\begin{entryblock}
\experienceentry{Software Engineer}{Acme}{Remote}{Jan 2024 - Present}
\begin{itemize}
  \item Did something impactful.
\end{itemize}
\end{entryblock}
```

## Cover Letter Commands

Provided by `slate-letter.cls`.

| Command | Args | Use |
|---|---|---|
| `\letterdate{date}` | 1 | Date line |
| `\recipient{name}{title}{org}{location}` | 4 | Recipient block |
| `\opening{salutation}` | 1 | Opening salutation |
| `\closing{phrase}` | 1 | Closing phrase |
| `\signature{name}` | 1 | Signature line |

Write body paragraphs as normal text between `\opening` and `\closing`. Paragraph spacing is handled automatically.

## Customization

Override any of these colors in your preamble after `\documentclass`. Values are HTML hex strings.

| Color | Purpose |
|---|---|
| `slatetext` | Body text |
| `slateheading` | Section headings and name in header |
| `slaterule` | Horizontal rule under section headings |
| `slatelink` | Hyperlink color, when `colorlinks` is enabled |

Example:

```tex
\documentclass{slate-resume}
\definecolor{slatelink}{HTML}{0066CC}
\definecolor{slateheading}{HTML}{1A1A1A}
\definecolor{slaterule}{HTML}{888888}
```

To use a different font, pass `nofont` and load your own in the preamble:

```tex
\documentclass[nofont]{slate-resume}
\usepackage[T1]{fontenc}
\usepackage{sourcesanspro}
```

To adjust margins, call `\geometry` in the preamble:

```tex
\documentclass{slate-resume}
\geometry{margin=0.75in}
```

## Contributions

You may email patches, issues, security reports, or pull requests to [code@brycekwon.com](mailto:code@brycekwon.com). I do not use issue trackers or source forges (GitHub, GitLab, etc.) as a personal preference.

Contributions of any kind are welcome. Patches and pull requests will be credited with proper authorship unless you request otherwise. Bug reports and vulnerability disclosures will be credited via the `Reported-by` commit trailer unless you request otherwise. Significant changes may be adjusted, deferred, or declined to keep the project aligned with its goals.

## License

This project is licensed under the [MIT License](./LICENSE.txt).
