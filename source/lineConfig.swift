import AppKit

struct lineConfig {
    var colorName: String = "cyan"   // just a label
    var red: Double = 0.0
    var green: Double = 1.0
    var blue: Double = 1.0
    var alpha: Double = 1.0
    var duration: Double = 0.5
    var vertices: Int = 200
    var width: Double = 12.0
    var minMovement: Double = 0.5
    var refreshRate: Double = 60.0
    var glow: Bool = false
    var color: NSColor {
        NSColor(srgbRed: red, green: green, blue: blue, alpha: alpha)
    }
}