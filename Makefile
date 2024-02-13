OUTPUT = main.pdf
OUTPUT_DIR = ./output/

make:
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make main.tex
	mv $(OUTPUT) $(OUTPUT_DIR)$(OUTPUT)

# Define the clean target for removing generated files
clean:
	rm -f *.aux *.log *.out *.toc *.fdb_latexmk *.fls *.synctex.gz main.pdf


