.PHONY: w c

w:
	typst w main.typ --root . --font-path ./fonts
	
c:
	typst c main.typ --root . --font-path ./fonts

ws:
	typst w main.typ --root . --font-path ./fonts --format=svg{i}
	
cs:
	typst c main.typ --root . --font-path ./fonts --format=svg{i}
