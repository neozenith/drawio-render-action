clean:
	rm -rf ./docs/png/*.png

build:
	docker build -t my-action .

test: build
	docker run -e "INPUT_PATH=./docs/diagrams" -e "OUTPUT_PATH=./docs/png" my-action

all: clean test


.PHONY: build test



