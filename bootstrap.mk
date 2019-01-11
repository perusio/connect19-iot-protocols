LATEX_CLASS_BRANCHES := master
LATEX_CLASS_REMOTE_NAME := origin
LATEX_CLASS_REPO := latex-class
LATEX_CLASS_REPO_URI := git@github.com:relayr/latex-classes.git
LATEX_CLASS_DIR := common

DIRS = $(shell find . \
	-maxdepth 1 \( -path */common-source -o -path */unreleased \) -prune \
	-o -not -name . -type d -print) 

# Get the top level directory.
current_dir := $(CURDIR)

# Setup the .gitgnore for each directory.
define set_gitignore
	echo '/pdf\n/docx\n/gfm\n*.tex\n*.cls\n*.tikz\n*.sty' > $1/.gitignore;
endef

all: build

# Use this rule to (shallow) clone the LaTeX class repository. 
init_latex_class:
	$(foreach branch,$(LATEX_CLASS_BRANCHES), \
		git init $(LATEX_CLASS_REPO)-$(branch))
	$(foreach branch,$(LATEX_CLASS_BRANCHES), \
		cd $(LATEX_CLASS_REPO)-$(branch); \
		git remote add origin -f $(LATEX_CLASS_REPO_URI); \
		git config core.sparsecheckout true; \
		echo $(LATEX_CLASS_DIR) >> .git/info/sparse-checkout; \
		git pull --depth=1 origin $(branch); \
		cd $(current_dir)); \
	echo "**/.DS_Store\n**/auto\n/latex-class-*" \
		> .gitignore;

gitignore: $(DIRS)
	$(foreach d,$^,$(call set_gitignore,$(d)))

build: init_latex_class gitignore

.PHONY: init_latex_class gitignore build

