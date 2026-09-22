import AppKit

final class dataUpdate {
    private(set) var points: [vertice] = []
    let config: lineConfig

    private var prevX: Double
    private var prevY: Double

    init(config: lineConfig) {
        self.config = config
        let pos = NSEvent.mouseLocation
        self.prevX = pos.x
        self.prevY = pos.y
    }

    func sample() {
        let pos = NSEvent.mouseLocation
        let dx = pos.x - prevX
        let dy = pos.y - prevY

        if dx * dx + dy * dy >= config.minMovement * config.minMovement {
            points.append(vertice(pos.x, pos.y))
            if points.count > config.vertices {
                points.removeFirst()
            }
            prevX = pos.x
            prevY = pos.y
        }

        points.removeAll { point in
            point.age > config.duration
        }
    }
}