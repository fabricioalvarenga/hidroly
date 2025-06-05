#!/bin/bash

DEVICE_NAME="iPhone 16 Pro"
BUNDLE_ID="com.alvarenga.Hidroly"
DERIVED_DATA="~/Library/Developer/Xcode/DerivedData/Hidroly-elzuktlznbzslaasjbjjtdthehri"
APP_PATH="$DERIVED_DATA/Build/Products/Debug-iphonesimulator/Hidroly.app"  

# Get device's ID
DEVICE_ID=$(xcrun simctl list devices available | grep "$DEVICE_NAME" | grep -v "unavailable" | head -n1 | awk -F '[()]' '{print $2}')

if [ -z "$DEVICE_ID" ]; then
    echo "Error: '$DEVICE_NAME' not found."
    exit 1
fi

# Open simulator if it not opened
if ! pgrep -x Simulator > /dev/null; then
    echo "Oppening simulator..."
    open -a Simulator
    # sleep 5  # Espera um pouco o app carregar
fi

# Boot on simulator
echo "Botting on simulator $DEVICE_NAME ($DEVICE_ID)..."
xcrun simctl boot "$DEVICE_ID" 2>/dev/null

# Uninstall the app
xcrun simctl uninstall booted $BUNDLE_ID

# Install the app on simulator
echo "Instalando o app no simulador..."
xcrun simctl install "$DEVICE_ID" "$APP_PATH"

# Execute the app
echo "Executing app..."
xcrun simctl launch --console "$DEVICE_ID" "$BUNDLE_ID"

# Bring the simulator forward
osascript -e 'tell application "Simulator" to activate'
