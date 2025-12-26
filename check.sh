#!/bin/bash

find . -name "*.sh" -type f -exec docker run --rm -v "./:/app" koalaman/shellcheck:stable "/app/{}" ';'

find . -name "Dockerfile*" -type f -exec docker run --rm -v "./:/app" hadolint/hadolint hadolint "/app/{}" ';'