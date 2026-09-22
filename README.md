# mouseTrail

A macOS cursor trail. Native Swift + AppKit, no OpenGL, no dependencies.

## Features

- Smooth fading trail that follows the cursor across the whole screen
- Configurable color, width, fade duration, and glow
- Zero permissions required (uses `NSEvent.mouseLocation`, not `CGEventTap`)
- Runs as a background agent — no dock icon, no menu bar

## Build & Run

    swift run

## Package as a .app

    ./build-app.sh
    open mouseTrail.app

Stop it with:

    pkill mouseTrail

## Configuration

Edit `source/lineConfig.swift` to change:

- `red`, `green`, `blue`, `alpha` — color (0.0 to 1.0)
- `duration` — how long the trail lasts, in seconds
- `width` — maximum thickness, in points
- `vertices` — maximum points stored
- `minMovement` — minimum cursor movement before a new point is added
- `refreshRate` — polling frequency, in Hz
- `glow` — soft shadow behind each segment

## Structure

    source/
      main.swift        — entry point, AppKit coordinator, timer
      dataUpdate.swift  — mouse polling, point store
      lineRender.swift  — NSView subclass that draws the trail
      vertice.swift     — one trail point (position + timestamp)
      lineConfig.swift  — all tunable values