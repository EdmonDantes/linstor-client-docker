#!/bin/bash

for i in $(find -name "Dockerfile*" -type f); do
  if ! docker run --rm -v "./:/app" hadolint/hadolint hadolint "/app/$i"; then
    exit 1
  fi
done