## Local Makefile.
# Include common Makefile.
include ../latex-class-master/common/common.mk

COMMON := latex-class-master/common

# Common source files directory.
common_source := ../common-source

# Add the preamble to the LaTeX flags for pandoc.
PANDOC_PREAMBLE_OPTS = --include-in-header $(common_source)/preamble_slides.tex

## Source files.
sources := $(sort $(wildcard *.md))

catfile := all.md
header := $(common_source)/00head.md

# Function to create the document header. If the document is a product
# brief or the target is a GFM output then the header is empty.
define create_header
	$(if $(filter $1,product-brief), \
		touch $3, \
		$(if $(filter $2,gfm), \
		touch $3, cat $3 > $@))
endef

# Output.
output_filename_suffix := $(subst -,_,$(notdir $(CURDIR)))_slides

all: build_slides clean_cat

$(catfile): $(sources)
	$(foreach f,$^,cat $(f) >> $@;)

$(BEAMER_THEME): link_beamer_theme 

build_slides: $(catfile) $(BEAMER_THEME)
	$(call create_output_dir,$(PDF_OUTPUT_DIR))
	pandoc $(PANDOC_BEAMER_OPTS) $(PANDOC_PREAMBLE_OPTS) -t beamer -o $(PDF_OUTPUT_DIR)/$(output_filename_suffix).pdf \
		$(METADATA) $(catfile)

slides: build_slides clean_cat

clean_cat: $(catfile)
	$(RM) $^

clean_pdf:
	$(RM) -r $(PDF_OUTPUT_DIR)

clean_tex:
	$(RM) *.cls *.tikz *.sty

clean: clean_cat clean_pdf

.PHONY: all $(catfile) clean_pdf clean slides
