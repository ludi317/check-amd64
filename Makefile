.PHONY: all build clean

GOOS ?= linux
VERSIONS := v1 v2 v3 v4
SRCDIR := src
BUILDDIR := build/check_amd64_bins

all: $(VERSIONS)

$(VERSIONS):
	cd src && GOOS=$(GOOS) GOARCH=amd64 GOAMD64=$@ go build -ldflags "-X 'main.goamd64=$@'" -o ../$(BUILDDIR)/$@

build: all

clean:
	rm -rf build/
