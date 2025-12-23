OUTPUT = main.pdf
OUTPUT_DIR = ./output/

make:
	latexmk -output-directory="$(OUTPUT_DIR)" -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make main.tex

# Define the clean target for removing generated files
clean:
	rm -f *.aux *.log *.out *.toc *.fdb_latexmk *.fls *.synctex.gz main.pdf


