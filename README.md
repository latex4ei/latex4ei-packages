# LaTeX4EI Template

[![Build Status](https://travis-ci.org/latex4ei/latex4ei-packages.svg?branch=master)](https://travis-ci.org/latex4ei/latex4ei-packages)
[![Join the chat at https://gitter.im/LaTeX4Ei/Lobby](https://badges.gitter.im/LaTeX4Ei/Lobby.svg)](https://gitter.im/LaTeX4Ei/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![GitHub release](https://img.shields.io/github/release/latex4ei/latex4ei-packages.svg)](https://github.com/latex4ei/latex4ei-packages/releases/latest)
[![Github Releases](https://img.shields.io/github/downloads/latex4ei/latex4ei-packages/latest/total.svg)](https://github.com/latex4ei/latex4ei-packages/releases/latest)

Write beautiful latex cheat sheets with minimal effort.

## How to use

put `latex4ei` folder in `./template-files/` into the same folder as
your latex file. Specify `\documentclass{latex4ei/latex4ei_sheet}` and compile your code.
See the [documentation](https://github.com/latex4ei/latex4ei-packages/tree/gh-pages) for further details.

## Permanent installation

Copy the `latex4ei` folder into your tex-distribution directory

### Windows

Copy files to `C:\texlive\XXXX\texmf-dist\tex\latex\latex4ei`

### Linux

```bash
sudo cp -r template-files/latex4ei /usr/share/texlive/texmf-dist/tex/latex/latex4ei
sudo mktexlsr
```

### Mac OS X

```bash
cp -r template-files/latex4ei /usr/local/texlive/texmf-local/tex/latex/latex4ei
```

If you want to share your documents please refer to the LICENSE file
Read the changelog.md and known_bugs.txt and check [www.latex4ei.de](http://latex4ei.de) for updates.

© 2011-2019, LaTeX4EI
