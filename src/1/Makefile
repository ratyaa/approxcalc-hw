TEX =			pdflatex
TEX_FLAGS =		--output-directory $(BUILD_DIR) -shell-escape
PLT =			gnuplot
PLT_FLAGS =		-e "includedir = '../$(PLT_INCLUDE_DIR)/';\
			outdir = '../$(PIC_DIR)/';"\
			../$(PLT_INCLUDE_DIR)/default.gp
PDF_READER =		zathura
PDF_READER_FLAGS =
SEM_DIR	=		../../sem/

PLT_DIR =		plt
PIC_DIR =		pic
TEX_DIR =		tex
PDF_DIR =		../../pdf
PLT_INCLUDE_DIR =	plt/include
TEX_SRC =		$(wildcard $(TEX_DIR)/*.tex)
PLT_SRC =		$(wildcard $(PLT_DIR)/*.gp)
PLT_INCLUDE_SRC =	$(wildcard $(PLT_INCLUDE_DIR)/*.gp)
PLT_INPUT =		$(PLT_SRC:%=../%)
BUILD_DIR =		.build

NAME :=			$(shell basename $(CURDIR))
PLT_TARGET =		$(PLT_SRC:$(PLT_DIR)%.gp=$(PIC_DIR)%.svg)
TEX_TARGET =		$(PDF_DIR)/$(NAME).pdf

.PHONY: build clean read
.DEFAULT_GOAL :=	build

clean:
	rm -r $(PIC_DIR) $(BUILD_DIR) $(PDF_DIR)/$(NAME).pdf svg-inkscape

# Open homework file
readh:
ifneq ($(wildcard $(PDF_DIR)/$(NAME).pdf),)
	$(PDF_READER) $(PDF_READER_FLAGS) $(PDF_DIR)/$(NAME).pdf &
else
	@echo "File does not exist."
endif

# Open seminar outline
reado:
ifneq ($(wildcard $(SEM_DIR)/$(NAME).pdf),)
	$(PDF_READER) $(PDF_READER_FLAGS) $(SEM_DIR)/$(NAME).pdf &
else
	@echo "File does not exist."
endif

build: $(TEX_TARGET)

$(PLT_TARGET): $(PLT_SRC) $(PLT_INCLUDE_SRC)
	mkdir -p $(BUILD_DIR)
	mkdir -p $(PIC_DIR)
ifneq ($(PLT_SRC),)
	cd $(BUILD_DIR) && $(PLT) $(PLT_FLAGS) $(PLT_INPUT)
endif

$(TEX_TARGET): $(PLT_TARGET) $(TEX_SRC)
	mkdir -p $(BUILD_DIR)
	$(TEX) $(TEX_FLAGS) $(TEX_DIR)/main.tex
	cp $(BUILD_DIR)/main.pdf $(PDF_DIR)/$(NAME).pdf
