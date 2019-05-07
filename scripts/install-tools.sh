#!/bin/sh

echo "📦  Installing libxml2"
brew install libxml2

echo "📦  Installing Mint"
rm -f mint.zip
rm -f mint
curl -L -o mint.zip https://github.com/yonaskolb/Mint/releases/download/0.12.0/mint.zip
unzip mint.zip
rm mint.zip

echo "📦  Installing Mint packages from Mintfile"
./mint bootstrap
