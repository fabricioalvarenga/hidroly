#!/bin/bash

SCHEME="Hidroly"

rm -f buildServer.json
xcode-build-server config -scheme $SCHEME -project *.xcodeproj
