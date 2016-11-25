# LaTeX4EI Template
Write beautiful latex cheat sheets with minimal effort.

## How to use
put `latex4ei` folder in `./template-files/` into the same folder as
your latex file. Specify \documentclass{latex4ei/latex4ei_sheet} and compile your code.
See the documentation for further details.

## Permanent installation
Copy the `latex4ei` folder into your tex-distribution directory

### Windows
Copy files to `C:\texlive\XXXX\texmf-dist\tex\latex\latex4ei`

### Linux
```bash
sudo ln -s ./pkg /usr/share/texlive/texmf-dist/tex/latex/latex4ei
sudo mktexlsr
```

### Mac OS X
```bash
ln -s ./pkg /usr/local/texlive/texmf-local/tex/latex/latex4ei
```

If you want to share your documents please refer to the license.txt
Read the changelog.txt and known_bugs.txt and check [www.latex4ei.de](http://latex4ei.de) for updates.

© 2011-2016, LaTeX4EI
