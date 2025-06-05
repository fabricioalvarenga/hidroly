#!/bin/bash

SCHEME="Hidroly"
CONFIGURATION="Debug"
DEVICE_NAME="iPhone 16 Pro"
PLATFORM="iOS Simulator"
OS_VERSION="18.0"
DESTINATION="platform=$PLATFORM,name=$DEVICE_NAME,OS=$OS_VERSION" 

set -o pipefail 

# Verify if xcpretty is already installed
if ! which xcpretty &> /dev/null; then
    if which gem &> /dev/null; then
        echo "xcpretty not installed. Installing it with 'sudo gem install xcpretty'..."
        sudo gem install xcpretty
    else
        echo "RubyGems (gem) not installed. Install it first." >&2
        exit 1
    fi
fi

# Compile for macOS
# xcodebuild -scheme "$SCHEME" \
# -destination "$DESTINATION" \
# -configuration "$CONFIGURATION" \
# clean build | \
# tee build.log | \
# xcpretty  

# Compile for iPhone
xcodebuild -scheme "$SCHEME" \
    -destination "$DESTINATION" \
    -configuration "$CONFIGURATION" \
    -sdk iphonesimulator \
    clean build | \
    tee build.log | \
    xcpretty  

# Verify xcodebuild output status
BUILD_STATUS=$? 
if [ $BUILD_STATUS -ne 0 ]; then
    echo "" echo "===== COMPILATION FAILED ====="
    echo "" 

    # Extrai e mostra erros específicos do log echo "Errors found:"
    grep -n "error:" build.log | head -10 
    echo ""
    echo "Warnings found:"
    grep -n "warning:" build.log | head -5 
    echo ""
    echo "Full build log saved in: build.log"
    echo "Use 'cat build.log' to see complete output" 
    exit 1
fi

# Execute the app
./exec.sh 
