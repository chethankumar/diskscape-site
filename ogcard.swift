import AppKit
let size = NSSize(width: 1200, height: 630)
let img = NSImage(size: size)
img.lockFocus()
NSColor(red: 0.039, green: 0.047, blue: 0.059, alpha: 1).setFill()
NSRect(origin: .zero, size: size).fill()
let g = NSGradient(starting: NSColor(red: 0.10, green: 0.26, blue: 0.21, alpha: 1),
                   ending: NSColor(red: 0.039, green: 0.047, blue: 0.059, alpha: 1))!
g.draw(in: NSRect(x: 0, y: 0, width: 1200, height: 630), angle: -105)
// treemap motif
let tiles: [(NSRect, NSColor)] = [
    (NSRect(x: 760, y: 60, width: 360, height: 280), NSColor(red: 0.18, green: 0.75, blue: 0.6, alpha: 0.85)),
    (NSRect(x: 1130, y: 60, width: 30, height: 130), NSColor(red: 0.85, green: 0.65, blue: 0.38, alpha: 0.6)),
    (NSRect(x: 1130, y: 200, width: 30, height: 140), NSColor(red: 0.5, green: 0.55, blue: 0.9, alpha: 0.5)),
    (NSRect(x: 760, y: 350, width: 180, height: 220), NSColor(red: 0.24, green: 0.45, blue: 0.58, alpha: 0.7)),
    (NSRect(x: 950, y: 350, width: 120, height: 100), NSColor(red: 0.78, green: 0.45, blue: 0.45, alpha: 0.5)),
    (NSRect(x: 950, y: 460, width: 210, height: 110), NSColor(red: 0.30, green: 0.34, blue: 0.42, alpha: 0.8)),
]
for (r, c) in tiles {
    let p = NSBezierPath(roundedRect: r, xRadius: 14, yRadius: 14)
    c.setFill(); p.fill()
}
let title = NSAttributedString(string: "DiskScape", attributes: [
    .font: NSFont.systemFont(ofSize: 96, weight: .heavy), .foregroundColor: NSColor.white])
title.draw(at: NSPoint(x: 80, y: 330))
let sub = NSAttributedString(string: "See what's eating your disk.", attributes: [
    .font: NSFont.systemFont(ofSize: 42, weight: .semibold),
    .foregroundColor: NSColor(red: 0.33, green: 0.88, blue: 0.72, alpha: 1)])
sub.draw(at: NSPoint(x: 84, y: 262))
let desc = NSAttributedString(string: "Native macOS disk analyzer — signed & notarized",
    attributes: [.font: NSFont.systemFont(ofSize: 27), .foregroundColor: NSColor(white: 0.72, alpha: 1)])
desc.draw(at: NSPoint(x: 84, y: 200))
img.unlockFocus()
let rep = NSBitmapImageRep(data: img.tiffRepresentation!)!
let png = rep.representation(using: .png, properties: [:])!
try! png.write(to: URL(fileURLWithPath: "assets/og.png"))
print("og written: \(png.count) bytes")
