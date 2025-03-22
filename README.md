# talk-the-it-professional

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