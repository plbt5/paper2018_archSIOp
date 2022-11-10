BUILD_DIR := BUILDDIR
PROJ := 2022_archSIOp
LATEX_FILES = $(PROJ).aux $(PROJ).bbl $(PROJ).blg $(PROJ).fdb_latexmk $(PROJ).fls $(PROJ).log $(PROJ).out $(PROJ).spl $(PROJ).thm $(PROJ).xdv

$(PROJ).pdf: results/$(PROJ).tex src/docs/$(PROJ).md
	rm -f ./$(BUILD_DIR)/$(PROJ).pdf
	latexmk -logfilewarnings -interaction=nonstopmode -auxdir=$(BUILD_DIR) -outdir=$(BUILD_DIR) -pv -time -xelatex -f results/$(PROJ).tex

results/$(PROJ).tex: src/docs/$(PROJ).md 
	rm -f results/$(PROJ).tex
	pandocomatic -c ./pandocomatic-elsarticle.yaml --debug -o results/$(PROJ).tex src/docs/$(PROJ).md

src/docs/$(PROJ).md:
	echo "Create src/docs/$(PROJ).md"
	exit 1 

clean:
	rm -f $(foreach ltx_files,$(LATEX_FILES),./$(BUILD_DIR)/$(ltx_files)) src/docs/$(PROJ).md results/$(PROJ).tex
