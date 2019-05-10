#!/bin/sh

INPUT="$1"
OUTPUT="$INPUT/Assets/SwiftGen"
TEMPLATES="SwiftGenTemplates"

if [ "$INPUT" = "Axis_UI" ]; then
  ./mint run swiftgen swiftgen strings $INPUT/Assets/en.lproj/localizable.strings --output $OUTPUT/Strings.swift --templatePath $TEMPLATES/Strings.stencil
  ./mint run swiftgen swiftgen fonts Axis_Assets/Fonts --output $OUTPUT/Fonts.swift --templatePath $TEMPLATES/Fonts.stencil
else
  ./mint run swiftgen swiftgen storyboards $INPUT --output $OUTPUT/Storyboards.swift --templatePath $TEMPLATES/Storyboards.stencil
fi

./mint run swiftgen swiftgen xcassets $INPUT/Assets/Assets.xcassets --output $OUTPUT/Assets.swift --templatePath $TEMPLATES/Assets.stencil
