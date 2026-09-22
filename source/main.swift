import AppKit

final class appDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    var data: dataUpdate!
    var render: lineRender!
    var timer: Timer?

    func applicationDidFinishLaunching(_ notification: Notification) {
        let config = lineConfig()

        guard let screen = NSScreen.main else {
            print("no screen found")
            NSApp.terminate(nil)
            return
        }
        let frame = screen.frame

        data = dataUpdate(config: config)

        window = NSWindow(
            contentRect: frame,
            styleMask: .borderless,
            backing: .buffered,
            defer: false
        )
        window.isOpaque = false
        window.backgroundColor = .clear
        window.level = .screenSaver
        window.ignoresMouseEvents = true
        window.hasShadow = false
        window.collectionBehavior = [.canJoinAllSpaces, .stationary, .fullScreenAuxiliary]

        render = lineRender(frame: NSRect(origin: .zero, size: frame.size), config: config)
        window.contentView = render
        window.orderFrontRegardless()

        timer = Timer.scheduledTimer(
            withTimeInterval: 1.0 / config.refreshRate,
            repeats: true
        ) { [weak self] _ in
            self?.tick()
        }
    }

    func tick() {
        data.sample()
        render.points = data.points
        render.needsDisplay = true
    }

    func applicationWillTerminate(_ notification: Notification) {
        timer?.invalidate()
    }
}

let app = NSApplication.shared
app.setActivationPolicy(.accessory)
let delegate = appDelegate()
app.delegate = delegate
app.run()