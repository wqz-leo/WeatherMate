#!/bin/sh

PLATFORM="iOS"
if [ "$1" != "" ]; then
  PLATFORM=$1
fi

echo "⚙️  Checking out and building Carthage dependencies for $PLATFORM"
./mint run carthage carthage bootstrap --platform $PLATFORM --cache-builds
