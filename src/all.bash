#!/bin/bash

TARGET_OS=${1:-linux}

for version in v1 v2 v3 v4; do
  GOOS=$TARGET_OS GOARCH=amd64 GOAMD64=$version go build -ldflags "-X 'main.goamd64=$version'" -o ../check_amd64_bins/$version
done
