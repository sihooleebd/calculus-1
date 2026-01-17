#import "@preview/cetz:0.3.1"
#cetz.canvas({
  import cetz.draw: *
  
  // The "Wall of Math" approach: 
  // No abstractions, just raw coordinate tuples and manual arithmetic.
  
  // Tangent Triangle Hypotenuse
  line((0, 0), (4, 4 * calc.tan(30deg)), stroke: (dash: "dashed"))
  
  // Vertical Sine Line (B to D)
  line((4 * calc.cos(30deg), 4 * calc.sin(30deg)), (4 * calc.cos(30deg), 0))
  
  // Tangent Height Line (A to C)
  line((4, 0), (4, 4 * calc.tan(30deg)))
  
  // Radius on X-axis
  line((0, 0), (4, 0))
  
  // Radius to B
  line((0, 0), (4 * calc.cos(30deg), 4 * calc.sin(30deg)))
  
  // The Chord (B to C)
  line((4 * calc.cos(30deg), 4 * calc.sin(30deg)), (4, 4 * calc.tan(30deg)))
  
  // Main Arc
  arc((0, 0), start: 0deg, stop: 30deg, radius: 4)
  
  // Angle Marker
  arc((0, 0), start: 0deg, stop: 30deg, radius: 1)
  content((1.2, 0.25), $theta$)
  
  // Right Angle at Projection (Manual coordinate subtraction)
  line(
    (4 * calc.cos(30deg), 0.25),
    (4 * calc.cos(30deg) - 0.25, 0.25),
    (4 * calc.cos(30deg) - 0.25, 0),
    stroke: 0.5pt,
  )
  
  // Right Angle at Tangent (Manual coordinate subtraction)
  line(
    (4, 0.25),
    (4 - 0.25, 0.25),
    (4 - 0.25, 0),
    stroke: 0.5pt,
  )
  
  // Labels (Manual offsetting instead of anchors)
  content((-0.2, 0.2), "O")
  content((4 - 0.2, 0.2), "A")
  content((4 * calc.cos(30deg) + 0.2, 4 * calc.sin(30deg) - 0.1), "B")
  content((4 - 0.2, 4 * calc.tan(30deg) - 0.1), "C")
  content((4 * calc.cos(30deg), 0.3), "D")
  content((2, 0.8), "r")
})