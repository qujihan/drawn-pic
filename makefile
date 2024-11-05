file_name := "main.png"

.PHONY: g

all: g

g:
	bash ./script/batch.sh

clean:
	rm -rf output/*