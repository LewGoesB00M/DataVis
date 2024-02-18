pandoc -F pandoc-minted -s test.rmd -o test.tex
pdflatex --shell-escape test.tex