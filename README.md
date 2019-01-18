# A gentle introduction to IoT protocols with security in mind

## Introduction

This repository contains the slides for the
[Connect'19](https://www.connect19.ca/en) conference organized by
[Genetec](https://www.genetec.com).

## HOWTO for everyone

It isn't possible to generate the slides since it requires a LaTeX
class that is in a private <https.//relayr.io> repository.

There is however a PDF file of the slides in the
`iot-protocols/pdf` directory.

## HOWTO for relayr people

### Getting the LaTeX class and Beamer theme

In order to create the PDF output we need the relayr Beamer theme. The
following command does a sparse checkout of the LaTeX class in the top
level directory.
 
    make init_latex_class -f bootstrap.mk 
 
### Generating the output

#### Requirements 

 There are two ways to build the documents in this repository:

 1. Using Docker
 2. Native installation all the necessary packages.

##### Using Docker

 1. [Docker](https://www.docker.com/community-edition).
 2. [GNU Make](https://www.gnu.org/software/make/) or equivalent.

##### Native installation of all necessary packages

 1. [pandoc](http://pandoc.org/).
 2. [GNU Make](https://www.gnu.org/software/make/) or equivalent.
 3. [TeX Live](https://www.tug.org/texlive/) or a similar TeX/LaTeX
    installation with
    [LuaLaTeX](http://luatex.org/) and the
    following packages:
    + [sourcesanspro](https://www.ctan.org/tex-archive/fonts/sourcesanspro)
    + [memoir](https://www.ctan.org/pkg/beamer?lang=en)
    + [hyphenat](https://www.ctan.org/pkg/hyphenat?lang=en)
    + [graphicx](https://ctan.org/pkg/graphicx)
    + [etoolbox](https://ctan.org/pkg/etoolbox)
    + [textcomp](https://ctan.org/pkg/textcomp)
    + [tikz](https://sourceforge.net/projects/pgf/)
 4. [Pandoc tablenos filter](https://github.com/tomduck/pandoc-tablenos)
 5. [Pandoc fignos filter](https://github.com/tomduck/pandoc-fignos)
 6. [Source Code Pro](https://fonts.google.com/specimen/Source+Code+Pro).
 7. [Monda](https://fonts.google.com/specimen/Monda).
 
#### Usage

The generic form of make invocation is:

```bash
make <directory> TARGET=<target>
```
where:
 + `<directory>` is the directory that contains the slides source.
 + `<target>`  is usually `slides` to create a PDF based slide show
   based on the Beamer class with the relayr theme.

##### Example

Generating the slides in PDF.

    make iot-protocols TARGET=slides

##### Using Docker

To use Docker just pass the variable `USE_DOCKER=y` to the make
invocation. For example for the analytics release notes.

        make iot-protocols USE_DOCKER=y TARGET=slides

Note that docker checks if you have the image is available in your
computer. If not then it will download the image from 
[Docker Hub](https://hub.docker.com/r/perusio/pandoc-relayr/).

#### Output 

The output files are written in a sub-directory:

    iot-protocols/pdf

## Docker image and dockerfile

There is a public [docker image](https://hub.docker.com/r/perusio/pandoc-relayr/)
with that can be used for generating the documents. Alternatively you
can [build the image](https://github.com/relayr/pandoc-docker) if you prefer.

## Contact

Any question regarding the slides and the presentatio
[perusio@protonmail.com](mailto:perusio@protonmail.com) or you can
contact me on [LinkedIn](https://www.linkedin.com/in/perusio/).
