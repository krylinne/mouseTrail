import AppKit

final class lineRender: NSView {
    var points: [vertice] = []
    var config: lineConfig

    init(frame: NSRect, config: lineConfig) {
        self.config = config
        super.init(frame: frame)
        wantsLayer = true
    }

    required init?(coder: NSCoder) { fatalError("not used") }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        guard points.count > 1 else { return }
    
        let ctx = NSGraphicsContext.current!.cgContext
        ctx.setBlendMode(.lighten)
    
        for i in 1..<points.count {
            let p0 = points[i - 1]
            let p1 = points[i]
    
            let fade = max(0, 1.0 - p1.age / config.duration)
            if fade <= 0 { continue }
    
            let path = NSBezierPath()
            path.move(to: CGPoint(x: p0.x, y: p0.y))
            path.line(to: CGPoint(x: p1.x, y: p1.y))
            path.lineWidth = fade * config.width
            path.lineCapStyle = .round
    
            config.color.withAlphaComponent(config.alpha * fade).setStroke()
            path.stroke()
        }
    
        ctx.setBlendMode(.normal)
    }
}