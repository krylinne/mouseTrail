# mouseTrail

A macOS cursor trail written in Swift.

## Build & Run

    swift run

## Package as .app

    swift build -c release
    mkdir -p mouseTrail.app/Contents/MacOS
    cp .build/release/mouseTrail mouseTrail.app/Contents/MacOS/
    # then add Info.plist
    codesign --force --deep --sign - mouseTrail.app
    open mouseTrail.app

## Config

Edit `source/lineConfig.swift` to change color, width, duration, etc.