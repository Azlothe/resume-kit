RESUMES := $(wildcard Resumes/*/*.tex)

LATEX_COMPILER := latexmk

LATEX_OPTS := \
	-synctex=1 \
	-interaction=nonstopmode \
	-file-line-error \
	-pdf

.PHONY: all

all:
	@for f in $(RESUMES); do \
		echo "Building $$f"; \
		$(LATEX_COMPILER) $(LATEX_OPTS) \
			-outdir="$$(dirname "$$f")" \
			-auxdir="$$(dirname "$$f")" \
			"$$f"; \
	done