# Beyond Docker

This repository holds all information on a talk called *Beyond Docker*.
This talk aims to expand developers knowledge of containers beyond the application of basic Docker command.

For more information on the content, check out the [SCRIPT.md](SCRIPT.md).

## Slides

For building the slides simply run the script `run.sh`.
If offline build is necessary build the base Containerfile `build/Containerfile.base` and reference the new tag.

```bash
docker build -t ubuntu-tex-offline:24.04 -f build/Containerfile.base .
```

And comment the build of the `tex` stage.

```Dockerfile
#FROM ubuntu:24.04 AS prep
#RUN apt-get update && \
#  apt-get install --no-install-recommends -y \
#    chktex ghostscript lacheck latexmk latex-make latex-mk texlive \
#    texlive-lang-german texlive-lang-english texlive-latex-extra \
#    texlive-science texlive-font-utils && \
#  apt-get clean -y
#
#FROM prep AS tex
FROM ubuntu-tex-offline:24.04 AS tex
#...
```

Then for building an html file run the following command:

```bash
mkdir -p dist
cp -r images dist/
pandoc -t revealjs -s main.tex -o dist/slides.html \
  --variable revealjs-url=https://cdn.jsdelivr.net/npm/reveal.js
```

## Script

Build the script with the following command:

```bash
mkdir -p dist
sed -E 's/(==.*==)|(---)//g' SCRIPT.md > dist/SCRIPT.md
docker run \
  --rm \
  --volume "`pwd`:/data" \
  --user `id -u`:`id -g` \
  pandoc/minimal \
  -s dist/SCRIPT.md -o dist/index.html
```
