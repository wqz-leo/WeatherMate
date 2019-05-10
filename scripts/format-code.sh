#!/bin/sh

if [ "$1" == "" ]; then
  echo "Requires directory"
  exit 1
fi

# run Swiftformat
./mint run swiftformat swiftformat $1 --stripunusedargs closure-only --disable blankLinesAtStartOfScope --patternlet inline --exclude $1/Assets/SwiftGen,Axis_UI/Assets

# run Swiftlint
./mint run swiftlint swiftlint lint --path $1 --config ../../.swiftlint.yml
