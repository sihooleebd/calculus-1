#import "../../templates/templater.typ": *

= Volumes
The one idea of this section : a volume is an integral of cross-sectional areas. Everything else (disks, washers, weird solids) is just a different formula for one slice.

#definition("Volume by Slicing")[
  Suppose a solid lies between $x = a$ and $x = b$, and the cross-section at position $x$ (perpendicular to the $x$-axis) has area $A(x)$. Then
  $ V = integral_a^b A(x) d x $
]

#note("Visualize one cross-section")[
  Freeze the solid, cut it with a plane, and stare at the flat face you produced. If you can write the area of that face as a function of the cut position, the volume is already yours.
]

#example("A Solid Built on an Elliptical Base")[
  The base of a solid $S$ is the elliptical region bounded by
  $ 4x^2 + 9y^2 = 36 $
  Cross-sections perpendicular to the $x$-axis are isosceles right triangles with hypotenuse in the base. Find the volume of $S$.
  #solution("")[
    Rewrite the ellipse as
    $ x^2/9 + y^2/4 = 1 $
    so $x$ runs over $[-3,3]$ and, at each $x$, the base segment reaches from
    $ y = -2/3 sqrt(9-x^2) $
    to
    $ y = 2/3 sqrt(9-x^2) $

    The hypotenuse of the triangle is that full segment, of length
    $ h = 4/3 sqrt(9-x^2) $
    An isosceles right triangle with hypotenuse $h$ has legs $h\/sqrt(2)$ and area
    $ A = 1/2 (h/sqrt(2))^2 = h^2/4 $

    So
    $ A(x) = 1/4 dot 16/9 (9 - x^2) = 4/9 (9-x^2) $
    and
    $ V = integral_(-3)^3 4/9 (9-x^2) d x = 4/9 lr([ 9x - x^3/3 ])_(-3)^3 = 4/9 dot 36 = 16 $
  ]
]

= Solids of revolution
When a plane region rotates, a thin slice turns into a solid piece. The main question is : what does one slice become?

#definition("Disk and Washer Methods")[
  If a slice perpendicular to the axis of rotation has outer radius $R(x)$ and inner radius $r(x)$, then
  $ V = pi integral_a^b [ R(x)^2 - r(x)^2 ] d x $

  If there is no hole, then $r(x) = 0$ and we get the *disk method* :
  $ V = pi integral_a^b R(x)^2 d x $
]

#note("Disk or washer?")[
  A slice becomes a disk if it fills in the middle. It becomes a washer if there is an empty hole in the middle, which happens exactly when the region does not touch the axis of rotation.
]

#canvas.cartesian-canvas(
  size: (8, 5),
  x-domain: (-0.4, 2.6),
  y-domain: (-0.5, 4.5),
  graph.graph(x => 2 * x, domain: (0, 2.2), label: $y = 2x$),
  graph.graph(x => x * x, domain: (0, 2.12), label: $y = x^2$),
  shape.segment(graph.point(1.2, 1.44), graph.point(1.2, 2.4), style: (stroke: gray)),
  graph.point(0, 0, label: ""),
  graph.point(2, 4, label: ""),
)

#example("A Washer Method Example")[
  Find the volume obtained by rotating the region between
  $ y = 2x $
  and
  $ y = x^2 $
  on $[0,2]$ about the $x$-axis.
  #solution("")[
    On $[0,2]$, the outer curve is
    $ y = 2x $
    and the inner curve is
    $ y = x^2 $
    The gray slice in the picture, once revolved, becomes a washer whose outer rim is traced by the line and whose hole is traced by the parabola.

    So the outer radius is
    $ R(x) = 2x $
    and the inner radius is
    $ r(x) = x^2 $

    Therefore
    $ V = pi integral_0^2 [ (2x)^2 - (x^2)^2 ] d x $
    $ = pi integral_0^2 (4x^2 - x^4) d x $
    $ = pi [ 4x^3/3 - x^5/5 ]_0^2 $
    $ = pi lr([ 32/3 - 32/5 ]) = 64 pi / 15 $
  ]
]

= Rotating about other lines
Nothing sacred about the coordinate axes. If the axis of rotation is the line $x = k$ or $y = k$, the only change is that every radius is now a *distance to that line*.

#example("Rotation about a Vertical Line")[
  Let $R$ be the region enclosed by
  $ y = ln(x) $
  the $x$-axis, and the line $x = 2$. Find the volume of the solid obtained by rotating $R$ about the line $x = 3$, using $y$ as the variable of integration.
  #solution("")[
    The region lives over $1 <= x <= 2$, and its height runs from $y = 0$ up to $y = ln(2)$.

    Slice horizontally at height $y$. Inside the region, $x$ runs from the curve $x = e^y$ to the wall $x = 2$. Rotating about $x = 3$ :
    - the *far* edge of the slice is $x = e^y$, at distance $R(y) = 3 - e^y$ from the axis,
    - the *near* edge is $x = 2$, at distance $r(y) = 3 - 2 = 1$.

    So each slice becomes a washer, and
    $ V = pi integral_0^(ln(2)) lr([ (3 - e^y)^2 - 1^2 ]) d y $
    $ = pi integral_0^(ln(2)) lr([ 8 - 6e^y + e^(2y) ]) d y $
    $ = pi lr([ 8y - 6e^y + e^(2y)/2 ])_0^(ln(2)) $

    At $y = ln(2)$ : $8 ln(2) - 12 + 2$.
    At $y = 0$ : $-6 + 1/2$.

    Therefore
    $ V = pi lr([ (8 ln(2) - 10) - (-11/2) ]) = pi lr([ 8 ln(2) - 9/2 ]) $
  ]
]
