INDEX :=		$(shell basename $(CURDIR))
NAME :=			siryira_hw$(INDEX)

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
TEX_INCLUDE_DIR =	tex/include
TEX_SOLUTION_DIR =	tex/solutions
PLT_INCLUDE_DIR =	plt/include

BUILD_DIR =		.build
PDF_DIR =		../../pdf/$(INDEX)

PR1_NAME =		pr1
PR2_NAME =		pr2
EX1_NAME =		ex1
EX2_NAME =		ex2
EX3_NAME =		ex3
EX4_NAME =		ex4

TEX_INCLUDE_SRC =	$(wildcard $(TEX_INCLUDE_DIR)/*.tex)
TEX_SOLUTION_SRC =	$(wildcard $(TEX_SOLUTION_DIR)/*.tex)

TEX_PR1_SRC =		$(TEX_DIR)/$(PR1_NAME).tex $(TEX_SOLUTION_DIR)/problem1.tex
TEX_PR2_SRC =		$(TEX_DIR)/$(PR2_NAME).tex $(TEX_SOLUTION_DIR)/problem2.tex
TEX_EX1_SRC =		$(TEX_DIR)/$(EX1_NAME).tex $(TEX_SOLUTION_DIR)/exercise1.tex
TEX_EX2_SRC =		$(TEX_DIR)/$(EX2_NAME).tex $(TEX_SOLUTION_DIR)/exercise2.tex
TEX_EX3_SRC =		$(TEX_DIR)/$(EX3_NAME).tex $(TEX_SOLUTION_DIR)/exercise3.tex
TEX_EX4_SRC =		$(TEX_DIR)/$(EX4_NAME).tex $(TEX_SOLUTION_DIR)/exercise4.tex
TEX_MAIN_SRC = 		$(TEX_DIR)/main.tex

TEX_PR1_TARGET =	$(PDF_DIR)/$(NAME)_$(PR1_NAME).pdf
TEX_PR2_TARGET =	$(PDF_DIR)/$(NAME)_$(PR2_NAME).pdf
TEX_EX1_TARGET =	$(PDF_DIR)/$(NAME)_$(EX1_NAME).pdf
TEX_EX2_TARGET =	$(PDF_DIR)/$(NAME)_$(EX2_NAME).pdf
TEX_EX3_TARGET =	$(PDF_DIR)/$(NAME)_$(EX3_NAME).pdf
TEX_EX4_TARGET =	$(PDF_DIR)/$(NAME)_$(EX4_NAME).pdf
TEX_MAIN_TARGET = 	$(PDF_DIR)/$(NAME).pdf

PLT_INCLUDE_SRC =	$(wildcard $(PLT_INCLUDE_DIR)/*.gp)
PLT_ALL_SRC =		$(wildcard $(PLT_DIR)/*/*.gp)
PLT_PR1_SRC =		$(wildcard $(PLT_DIR)/$(PR1_NAME)/*.gp)
PLT_PR2_SRC =		$(wildcard $(PLT_DIR)/$(PR2_NAME)/*.gp)
PLT_EX1_SRC =		$(wildcard $(PLT_DIR)/$(EX1_NAME)/*.gp)
PLT_EX2_SRC =		$(wildcard $(PLT_DIR)/$(EX2_NAME)/*.gp)
PLT_EX3_SRC =		$(wildcard $(PLT_DIR)/$(EX3_NAME)/*.gp)
PLT_EX4_SRC =		$(wildcard $(PLT_DIR)/$(EX4_NAME)/*.gp)

PLT_PR1_EXEC =		$(PLT_PR1_SRC:%=(cd $(BUILD_DIR) && $(PLT) $(PLT_FLAGS) ../% ) &)
PLT_PR2_EXEC =		$(PLT_PR2_SRC:%=(cd $(BUILD_DIR) && $(PLT) $(PLT_FLAGS) ../% ) &)
PLT_EX1_EXEC =		$(PLT_EX1_SRC:%=(cd $(BUILD_DIR) && $(PLT) $(PLT_FLAGS) ../% ) &)
PLT_EX2_EXEC =		$(PLT_EX2_SRC:%=(cd $(BUILD_DIR) && $(PLT) $(PLT_FLAGS) ../% ) &)
PLT_EX3_EXEC =		$(PLT_EX3_SRC:%=(cd $(BUILD_DIR) && $(PLT) $(PLT_FLAGS) ../% ) &)
PLT_EX4_EXEC =		$(PLT_EX4_SRC:%=(cd $(BUILD_DIR) && $(PLT) $(PLT_FLAGS) ../% ) &)

PLT_PR1_TARGET =	$(PLT_PR1_SRC:$(PLT_DIR)/$(PR1_NAME)%.gp=$(PIC_DIR)%.svg)
PLT_PR2_TARGET =	$(PLT_PR2_SRC:$(PLT_DIR)/$(PR2_NAME)%.gp=$(PIC_DIR)%.svg)
PLT_EX1_TARGET =	$(PLT_EX1_SRC:$(PLT_DIR)/$(EX1_NAME)%.gp=$(PIC_DIR)%.svg)
PLT_EX2_TARGET =	$(PLT_EX2_SRC:$(PLT_DIR)/$(EX2_NAME)%.gp=$(PIC_DIR)%.svg)
PLT_EX3_TARGET =	$(PLT_EX3_SRC:$(PLT_DIR)/$(EX3_NAME)%.gp=$(PIC_DIR)%.svg)
PLT_EX4_TARGET =	$(PLT_EX4_SRC:$(PLT_DIR)/$(EX4_NAME)%.gp=$(PIC_DIR)%.svg)

.PHONY: build clean readh reado readp1 readp2 reade1 reade2 reade3 reade4
.DEFAULT_GOAL :=	build

$(PLT_PR1_TARGET): $(PLT_PR1_SRC) $(PLT_INCLUDE_SRC)
	mkdir -p $(BUILD_DIR)
ifneq ($(PLT_PR1_SRC),)
	$(PLT_PR1_EXEC)
endif

$(PLT_PR2_TARGET): $(PLT_PR2_SRC) $(PLT_INCLUDE_SRC)
	mkdir -p $(BUILD_DIR)
ifneq ($(PLT_PR2_SRC),)
	$(PLT_PR2_EXEC)
endif

$(PLT_EX1_TARGET): $(PLT_EX1_SRC) $(PLT_INCLUDE_SRC)
	mkdir -p $(BUILD_DIR)
ifneq ($(PLT_EX1_SRC),)
	$(PLT_EX1_EXEC)
endif

$(PLT_EX2_TARGET): $(PLT_EX2_SRC) $(PLT_INCLUDE_SRC)
	mkdir -p $(BUILD_DIR)
ifneq ($(PLT_EX2_SRC),)
	$(PLT_EX2_EXEC)
endif

$(PLT_EX3_TARGET): $(PLT_EX3_SRC) $(PLT_INCLUDE_SRC)
	mkdir -p $(BUILD_DIR)
ifneq ($(PLT_EX3_SRC),)
	$(PLT_EX3_EXEC)
endif

$(PLT_EX4_TARGET): $(PLT_EX4_SRC) $(PLT_INCLUDE_SRC)
	mkdir -p $(BUILD_DIR)
ifneq ($(PLT_EX4_SRC),)
	$(PLT_EX4_EXEC)
endif

$(TEX_MAIN_TARGET): $(PLT_ALL_SRC) $(TEX_SOLUTION_SRC) $(TEX_MAIN_SRC) $(TEX_INCLUDE_SRC)
	$(TEX) $(TEX_FLAGS) $(TEX_DIR)/main.tex
	$(TEX) $(TEX_FLAGS) $(TEX_DIR)/main.tex
	mv $(BUILD_DIR)/main.pdf $(PDF_DIR)/$(NAME).pdf

$(TEX_PR1_TARGET): $(PLT_PR1_SRC) $(TEX_PR1_SRC) $(TEX_INCLUDE_SRC)
	mkdir -p $(BUILD_DIR)
	mkdir -p $(PDF_DIR)
	$(TEX) $(TEX_FLAGS) $(TEX_DIR)/$(PR1_NAME).tex
	$(TEX) $(TEX_FLAGS) $(TEX_DIR)/$(PR1_NAME).tex
	mv $(BUILD_DIR)/$(PR1_NAME).pdf $(PDF_DIR)/$(NAME)_$(PR1_NAME).pdf

$(TEX_PR2_TARGET): $(PLT_PR2_SRC) $(TEX_PR2_SRC) $(TEX_INCLUDE_SRC)
	mkdir -p $(BUILD_DIR)
	mkdir -p $(PDF_DIR)
	$(TEX) $(TEX_FLAGS) $(TEX_DIR)/$(PR2_NAME).tex
	$(TEX) $(TEX_FLAGS) $(TEX_DIR)/$(PR2_NAME).tex
	mv $(BUILD_DIR)/$(PR2_NAME).pdf $(PDF_DIR)/$(NAME)_$(PR2_NAME).pdf

$(TEX_EX1_TARGET): $(PLT_EX1_SRC) $(TEX_EX1_SRC) $(TEX_INCLUDE_SRC)
	mkdir -p $(BUILD_DIR)
	mkdir -p $(PDF_DIR)
	$(TEX) $(TEX_FLAGS) $(TEX_DIR)/$(EX1_NAME).tex
	$(TEX) $(TEX_FLAGS) $(TEX_DIR)/$(EX1_NAME).tex
	mv $(BUILD_DIR)/$(EX1_NAME).pdf $(PDF_DIR)/$(NAME)_$(EX1_NAME).pdf

$(TEX_EX2_TARGET): $(PLT_EX2_SRC) $(TEX_EX2_SRC) $(TEX_INCLUDE_SRC)
	mkdir -p $(BUILD_DIR)
	mkdir -p $(PDF_DIR)
	$(TEX) $(TEX_FLAGS) $(TEX_DIR)/$(EX2_NAME).tex
	$(TEX) $(TEX_FLAGS) $(TEX_DIR)/$(EX2_NAME).tex
	mv $(BUILD_DIR)/$(EX2_NAME).pdf $(PDF_DIR)/$(NAME)_$(EX2_NAME).pdf

$(TEX_EX3_TARGET): $(PLT_EX3_SRC) $(TEX_EX3_SRC) $(TEX_INCLUDE_SRC)
	mkdir -p $(BUILD_DIR)
	mkdir -p $(PDF_DIR)
	$(TEX) $(TEX_FLAGS) $(TEX_DIR)/$(EX3_NAME).tex
	$(TEX) $(TEX_FLAGS) $(TEX_DIR)/$(EX3_NAME).tex
	mv $(BUILD_DIR)/$(EX3_NAME).pdf $(PDF_DIR)/$(NAME)_$(EX3_NAME).pdf

$(TEX_EX4_TARGET): $(PLT_EX4_SRC) $(TEX_EX4_SRC) $(TEX_INCLUDE_SRC)
	mkdir -p $(BUILD_DIR)
	mkdir -p $(PDF_DIR)
	$(TEX) $(TEX_FLAGS) $(TEX_DIR)/$(EX4_NAME).tex
	$(TEX) $(TEX_FLAGS) $(TEX_DIR)/$(EX4_NAME).tex
	mv $(BUILD_DIR)/$(EX4_NAME).pdf $(PDF_DIR)/$(NAME)_$(EX4_NAME).pdf

build: $(PLT_PR1_TARGET) $(PLT_PR2_TARGET) $(PLT_EX1_TARGET) $(PLT_EX2_TARGET) $(PLT_EX3_TARGET) $(PLT_EX4_TARGET) $(TEX_PR1_TARGET) $(TEX_PR2_TARGET) $(TEX_EX1_TARGET) $(TEX_EX2_TARGET) $(TEX_EX3_TARGET) $(TEX_EX4_TARGET) $(TEX_MAIN_TARGET)

clean:
	rm -r $(PIC_DIR) $(BUILD_DIR) $(PDF_DIR) svg-inkscape

# Open homework file
readh:
ifneq ($(wildcard $(PDF_DIR)/$(NAME).pdf),)
	$(PDF_READER) $(PDF_READER_FLAGS) $(PDF_DIR)/$(NAME).pdf &
else
	@echo "File does not exist."
endif

# Open seminar outline
reado:
ifneq ($(wildcard $(SEM_DIR)/$(INDEX).pdf),)
	$(PDF_READER) $(PDF_READER_FLAGS) $(SEM_DIR)/$(INDEX).pdf &
else
	@echo "File does not exist."
endif

readp1:
ifneq ($(wildcard $(PDF_DIR)/$(NAME)_$(PR1_NAME).pdf),)
	$(PDF_READER) $(PDF_READER_FLAGS) $(PDF_DIR)/$(NAME)_$(PR1_NAME).pdf &
else
	@echo "File does not exist."
endif

readp2:
ifneq ($(wildcard $(PDF_DIR)/$(NAME)_$(PR2_NAME).pdf),)
	$(PDF_READER) $(PDF_READER_FLAGS) $(PDF_DIR)/$(NAME)_$(PR2_NAME).pdf &
else
	@echo "File does not exist."
endif

reade1:
ifneq ($(wildcard $(PDF_DIR)/$(NAME)_$(EX1_NAME).pdf),)
	$(PDF_READER) $(PDF_READER_FLAGS) $(PDF_DIR)/$(NAME)_$(EX1_NAME).pdf &
else
	@echo "File does not exist."
endif

reade2:
ifneq ($(wildcard $(PDF_DIR)/$(NAME)_$(EX2_NAME).pdf),)
	$(PDF_READER) $(PDF_READER_FLAGS) $(PDF_DIR)/$(NAME)_$(EX2_NAME).pdf &
else
	@echo "File does not exist."
endif

reade3:
ifneq ($(wildcard $(PDF_DIR)/$(NAME)_$(EX3_NAME).pdf),)
	$(PDF_READER) $(PDF_READER_FLAGS) $(PDF_DIR)/$(NAME)_$(EX3_NAME).pdf &
else
	@echo "File does not exist."
endif

reade4:
ifneq ($(wildcard $(PDF_DIR)/$(NAME)_$(EX4_NAME).pdf),)
	$(PDF_READER) $(PDF_READER_FLAGS) $(PDF_DIR)/$(NAME)_$(EX4_NAME).pdf &
else
	@echo "File does not exist."
endif
