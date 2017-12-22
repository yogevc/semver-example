CURRENT_DIR=$(shell basename `pwd`)
FULL_VERSION=`semver-tool ${CURRENT_DIR}`
CANONICAL_VERSION_STRING=$(shell semver-tool ${CURRENT_DIR} | jq -r '.canonical_version_string')


all: build

print_tag:
	@echo ${FULL_VERSION} | jq '.'

create_tag:
	@if [ ! `git tag | grep ${CANONICAL_VERSION_STRING}` ]; then\
		git tag -a ${CANONICAL_VERSION_STRING} -m v${CANONICAL_VERSION_STRING};\
	fi

release:


build: build/semver-example

build/semver-example:
	@mkdir -p build
	go build -o build/semver-example


clean:
	rm -rf build
