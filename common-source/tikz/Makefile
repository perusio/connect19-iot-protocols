# Configuration script.
include ../../config.mk

# Source files.
TEXFILES:=$(wildcard *.tex)
# Targets.
PDFS:=$(TEXFILES:.tex=.pdf)

all: build

%.pdf: %.tex
	$(PDF_ENGINE) $< 

build: $(PDFS) install

install: $(PDFS)
	mkdir -p ../pdf && mv $^ ../pdf

clean:
	rm *.aux *.log *.pdf

.PHONY: clean install
