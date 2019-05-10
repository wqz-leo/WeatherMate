#!/bin/sh

# install required tools
scripts/install-tools.sh

# checkout and build dependencies
scripts/generate-dependencies.sh

# generate project
scripts/generate-project.sh
