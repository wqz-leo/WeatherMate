#!/bin/sh

echo "⚙️  Generating API"
./mint run swaggen swaggen generate spec.yml --template SwagGenTemplate --destination src/WM_API --option name:WMAPI --option targetName:WM_API --clean   all

echo "⚙️  Generating Project"
scripts/generate-project.sh
