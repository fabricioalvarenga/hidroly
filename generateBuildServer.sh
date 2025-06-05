#!/bin/bash

SCHEME="Hidroly"

xcode-build-server config -scheme $SCHEME -project *.xcodeproj
