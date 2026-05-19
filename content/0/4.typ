#import "../../templates/templater.typ" : *

= The tangent Problem

#definition("Tangent Line")[
  a *tangent line* to a curve at a point is the line that just youches the curve at that point and best approximates the curve near that point. A tangent line need not interscect at only on epoint; it may cross the curve or meet it again elsewhere
]

#let thet = 30deg
#let leng = 1

#example("Circle vs Function")[
  #blank-canvas(
    size: (4,4),
    circle((0,0), 1),
    segment((calc.cos(thet) + calc.tan(90deg - thet) * leng, calc.sin(thet) + calc.tan(thet - 90deg) * leng), (calc.cos(thet) - calc.tan(90deg - thet) * leng, calc.sin(thet) - calc.tan(thet - 90deg) * leng)),
    point(calc.sin(thet), calc.cos(thet), label: $P$, label-padding: 0.12, label-anchor: "north-east")
  )
  On circles, the tangent line can be easily defined following _Euclid_. The tangent line here at point $P$ is a line that only meets the circle *once* on $P$.

  However, this convenient definition cannot be generalized to all functions.

  #let lag-f =  lagrangian-interpolation((-4,1),(-3,-1), (-1, 3), (1, -1), (3, -2))
  #let tan-line = tangent(lag-f.f, -1, length: 8)
  #cartesian-canvas(
    size: (6,4),
    x-tick: 2,
    y-tick: 2,
    lag-f,
    tan-line,
    point(-1, (lag-f.f)(-1), label: $P$, label-anchor: "north-east", label-padding: 0.5),
    intersect-function-line(lag-f.f, tan-line, x0: -4, label: $Q$, label-anchor: "north-east", label-padding: 0.5)
  )

  As you can see, The tangent line on P also meets with the function at $Q$ too. We cannot simply use Euclidean definition here. How should we define this?
]

#pagebreak()

#example()[
  Now we try to find an equation of the tangent line to the parabola $y=x sr $ at the point $P(1,1)$.

  #let asdf(k, an: "west") = {
    let p = point(1,1,label:$P$, label-anchor: "north-east")
    let q = point(k, k*k, label:$Q$, label-anchor: an)
    cartesian-canvas(
        size:(4,3),
        x-domain: (-2.1,2.1),
        y-domain: (-1, 4.3),
        graph(x => x*x),
        p,
        q,
        line(p,q),
        tangent(x => x*x, 1, style: (stroke: active-theme.plot.highlight))
      )
  }
    #grid(
    columns: (1fr,1fr,1fr),
    rows: (auto, auto),
    asdf(2),asdf(1.5), asdf(1.2),
    asdf(0, an: "north-east"), asdf(0.5, an: "north-east"), asdf(0.8)
  )

  It seems like as $P$ approaches the approximation gets better.

  The slope is
  $ m_(P Q) = (x sr - 1 )/(x-1) $
  Thus,
  $ lim_(P -> Q) (x sr - 1 )/(x-1) = ("tangent slope") $

  How do we calculate? NGD.


  #let val1 = (2,1.5,1.1,1.01,1.001)
  #let val2 = (0.999, 0.99, 0.9, 0.5, 0)
  #value-table(
    variable: $P_x$,
    func: $m_(P Q)$,
    horizontal: true,
    values: val1,
    results: val1.map(x => calc.round((x*x - 1)/(x - 1), digits: 5))
  )
  #value-table(
    variable: $P_x$,
    func: $m_(P Q)$,
    horizontal: true,
    values: val2,
    results: val2.map(x => calc.round((x*x - 1)/(x - 1), digits: 5))
  )

  Looks like 2.

  $ therefore y = 2 x - 1 $
]

#example("pulse laser")[
    A pulse laser operates by storing charge on a capacitor and releasing it
  suddenly when the laser is fired. The data in the table describe the charge Q remaining
  on the capacitor (measured in coulombs) at time t (measured in seconds after the laser
  is fired). Use the data to draw the graph of this function and estimate the slope of the
  tangent line at the point where $t − 0.04$.

  (Note: The slope of the tangent line represents
  the electric current flowing from the capacitor to the laser [measured in amperes].)

  #table-plot(
    horizontal: true,
    headers: ($t$, $Q$),
    data: (
      (0, 10),
      (0.02, 8.187),
      (0.04, 6.703),
      (0.06, 5.488),
      (0.08, 4.493),
      (0.1, 3.676)
    )
  )

  #cartesian-canvas(
    x-domain: (-0,0.12),
    y-domain: (0,11),
    x-tick: 0.02,
    data-series(
        (
            (0, 10),
            (0.02, 8.187),
            (0.04, 6.703),
            (0.06, 5.488),
            (0.08, 4.493),
            (0.1, 3.676)
        ),
        plot-type: "both"
    )
  )

  Average adjacent slopes. (Justification: Taylor and... will someday discovered)
]
