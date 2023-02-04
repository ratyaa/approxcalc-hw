TEX =			pdflatex
TEX_FLAGS =		--output-directory $(TEX_BUILD_DIR)
PLT =			gnuplot
PLT_FLAGS =		-p
PDF_READER =		zathura
PDF_READER_FLAGS =	

PLTDIR =		plot
PICDIR =		pic
TEXDIR =		tex
PDFDIR =		../../pdf
TEX_SRC =		$(wildcard $(TEXDIR)/*.tex)
PLT_SRC =		$(wildcard $(PLTDIR)/*.gp)
TEX_BUILD_DIR =		.build

NAME :=			$(shell basename $(CURDIR))
PLT_TARGET =		$(PLT_SRC:$(PLTDIR)%.gp=$(PICDIR)%.svg)
TEX_TARGET =		$(PDFDIR)/$(NAME).pdf

.PHONY: build clean read
.DEFAULT_GOAL :=	build

clean:
	rm -rf $(PICDIR) $(TEX_BUILD_DIR)
read:
	$(PDF_READER) $(PDF_READER_FLAGS) $(PDFDIR)/$(NAME).pdf &

build: $(TEX_TARGET)

$(PLT_TARGET): $(PLT_SRC)
ifneq ($(PLT_SRC),)
	mkdir -p $(PICDIR)
	$(PLT) $(PLT_FLAGS) $(PLT_SRC)
endif

$(TEX_TARGET): $(PLT_TARGET) $(TEX_SRC)
	mkdir -p $(TEX_BUILD_DIR)
	$(TEX) $(TEX_FLAGS) $(TEXDIR)/main.tex
	cp $(TEX_BUILD_DIR)/main.pdf $(PDFDIR)/$(NAME).pdf
