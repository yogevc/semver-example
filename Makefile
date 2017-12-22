
CURRENT_DIR=$(shell basename `pwd`)

all: build

print_tag:
	@semver-tool ${CURRENT_DIR}

release:


build: build/semver-example

build/semver-example:
	@mkdir -p build
	go build -o build/semver-example


clean:
	rm -rf build
