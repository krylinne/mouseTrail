#!/bin/bash
set -e

swift build -c release

rm -rf mouseTrail.app
mkdir -p mouseTrail.app/Contents/MacOS
cp .build/release/mouseTrail mouseTrail.app/Contents/MacOS/mouseTrail
cp Info.plist mouseTrail.app/Contents/Info.plist

codesign --force --deep --sign - mouseTrail.app

echo "Built mouseTrail.app"