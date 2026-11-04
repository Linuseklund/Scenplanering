import Cocoa
let S: CGFloat = 1024
let img = NSImage(size: NSSize(width: S, height: S))
img.lockFocus()
let ctx = NSGraphicsContext.current!.cgContext
// rundad ruta
let r = NSRect(x: 100, y: 100, width: 824, height: 824)
let bg = NSBezierPath(roundedRect: r, xRadius: 185, yRadius: 185)
NSGradient(starting: NSColor(red: 0.17, green: 0.55, blue: 0.58, alpha: 1), ending: NSColor(red: 0.08, green: 0.28, blue: 0.36, alpha: 1))!.draw(in: bg, angle: -90)
// golvrutnät i perspektiv
ctx.saveGState(); bg.addClip()
NSColor(white: 1, alpha: 0.18).setStroke()
for i in 0...10 { let x = 100 + CGFloat(i) * 82.4; let p = NSBezierPath(); p.move(to: NSPoint(x: 512 + (x - 512) * 0.35, y: 520)); p.line(to: NSPoint(x: 512 + (x - 512) * 1.9, y: 60)); p.lineWidth = 6; p.stroke() }
for (i, y) in [520, 470, 400, 300, 160].enumerated() { let p = NSBezierPath(); p.move(to: NSPoint(x: 0, y: y)); p.line(to: NSPoint(x: 1024, y: y)); p.lineWidth = CGFloat(4 + i * 2); p.stroke() }
ctx.restoreGState()
// figurer
func fig(_ x: CGFloat, _ y: CGFloat, _ h: CGFloat, _ c: NSColor) {
  c.setFill()
  NSBezierPath(roundedRect: NSRect(x: x - h * 0.22, y: y, width: h * 0.44, height: h * 0.62), xRadius: h * 0.2, yRadius: h * 0.2).fill()
  NSBezierPath(ovalIn: NSRect(x: x - h * 0.17, y: y + h * 0.66, width: h * 0.34, height: h * 0.34)).fill()
  NSColor(white: 0, alpha: 0.18).setFill()
  NSBezierPath(ovalIn: NSRect(x: x - h * 0.3, y: y - h * 0.06, width: h * 0.6, height: h * 0.12)).fill()
}
fig(380, 300, 300, NSColor(red: 0.82, green: 0.41, blue: 0.24, alpha: 1))
fig(640, 360, 220, NSColor(red: 0.96, green: 0.86, blue: 0.62, alpha: 1))
// kamera
NSColor(white: 0.12, alpha: 1).setFill()
NSBezierPath(roundedRect: NSRect(x: 560, y: 640, width: 230, height: 150), xRadius: 30, yRadius: 30).fill()
let lens = NSBezierPath(); lens.move(to: NSPoint(x: 560, y: 715)); lens.line(to: NSPoint(x: 470, y: 665)); lens.line(to: NSPoint(x: 470, y: 765)); lens.close(); lens.fill()
NSColor(red: 0.82, green: 0.41, blue: 0.24, alpha: 1).setFill()
NSBezierPath(ovalIn: NSRect(x: 735, y: 750, width: 26, height: 26)).fill()
// synfält
NSColor(white: 1, alpha: 0.22).setFill()
let fov = NSBezierPath(); fov.move(to: NSPoint(x: 470, y: 715)); fov.line(to: NSPoint(x: 160, y: 560)); fov.line(to: NSPoint(x: 330, y: 520)); fov.close(); fov.fill()
img.unlockFocus()
let rep = NSBitmapImageRep(data: img.tiffRepresentation!)!
try! rep.representation(using: .png, properties: [:])!.write(to: URL(fileURLWithPath: "icon_1024.png"))
