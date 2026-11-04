#!/bin/zsh
# Bygger om Scenplanering.app från källkoden i den här mappen.
cd "$(dirname "$0")"
A="../Scenplanering.app"
swiftc -O main.swift -o /tmp/Scenplanering || exit 1
rm -rf "$A/Contents/Resources/web" && cp -R web "$A/Contents/Resources/web"
cp /tmp/Scenplanering "$A/Contents/MacOS/Scenplanering"
xattr -cr "$A"; codesign --force --deep -s - "$A" && echo "Klart."
