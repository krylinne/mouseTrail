import QuartzCore
struct vertice {
    let x: Double        // horizontal screen position, in points
    let y: Double        // vertical screen position, in points
    let time: Double     // seconds since boot (monotonic), captured at init

    init(_ x: Double, _ y: Double) {
        self.x = x
        self.y = y
        self.time = CACurrentMediaTime()
    }

    var age: Double {    // seconds elapsed since this point was created
        CACurrentMediaTime() - time
    }
}