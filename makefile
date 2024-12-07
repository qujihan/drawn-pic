file_name := "drawn-pic.pdf"

.PHONY: w c b
w:
	typst w main.typ ${file_name} --root . --font-path ./fonts
	
c:
	typst c main.typ ${file_name} --root . --font-path ./fonts

b: 
	python3 ./batch.py