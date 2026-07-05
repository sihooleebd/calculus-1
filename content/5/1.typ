#import "../../templates/templater.typ": *

= Areas between curves
When two curves trap a region, the easiest way to understand it is to imagine thin slices filling the gap from one boundary to the other.

#definition("Area between Two Curves")[
  If $f(x) >= g(x)$ on $[a,b]$, then the area between the curves $y = f(x)$ and $y = g(x)$ is
  $ A = integral_a^b [ f(x) - g(x) ] d x $

  In short :
  $ "Area" = integral ("top" - "bottom") d x $
]

#note("Visualize the slice")[
  A vertical slice has height
  $ f(x) - g(x) $
  and width
  $ d x $
  so its area is approximately
  $ [f(x)-g(x)] d x $
]

#example("A Quick First Region")[
  Find the area of the region
  $ S = { (x,y) : y <= 9 - x^2, x >= 0, y >= 0 } $
  #solution("")[
    The region sits in the first quadrant, under the parabola $y = 9 - x^2$, which meets the axes at $(0,9)$ and $(3,0)$. Here the "bottom curve" is just $y = 0$, so
    $ A = integral_0^3 (9 - x^2) d x = lr([ 9x - x^3/3 ])_0^3 = 27 - 9 = 18 $
  ]
]

- When the curves cross, "top" and "bottom" can swap roles. Always find the intersection points first, then handle each stretch separately.

#canvas.cartesian-canvas(
  size: (8, 5.5),
  x-domain: (-2.8, 2.8),
  y-domain: (-3.5, 3.5),
  graph.graph(x => x * x * x - 3 * x, domain: (-2.15, 2.15), label: $y = x^3 - 3x$),
  graph.func(x => x, domain: (-2.6, 2.6), label: $y = x$),
  shape.segment(graph.point(-1, -1), graph.point(-1, 2), style: (stroke: gray)),
  shape.segment(graph.point(1, 1), graph.point(1, -2), style: (stroke: gray)),
  graph.point(-2, -2, label: ""),
  graph.point(0, 0, label: ""),
  graph.point(2, 2, label: ""),
)

#example("A Region where the Top Curve Changes")[
  Find the area enclosed by
  $ y = x^3 - 3x $
  and
  $ y = x $
  #solution("")[
    First find the intersection points :
    $ x^3 - 3x = x $
    $ x^3 - 4x = 0 $
    $ x(x^2 - 4) = 0 $
    so
    $ x = -2, 0, 2 $

    On $[-2,0]$, the curve $y = x^3 - 3x$ lies above $y = x$.
    On $[0,2]$, the line $y = x$ lies above $y = x^3 - 3x$.
    The two gray slices in the picture show the top and bottom swapping.

    Therefore
    $ A = integral_(-2)^0 [(x^3 - 3x) - x] d x + integral_0^2 [x - (x^3 - 3x)] d x $
    $ = integral_(-2)^0 (x^3 - 4x) d x + integral_0^2 (4x - x^3) d x $

    By symmetry, these two areas are equal, so
    $ A = 2 integral_0^2 (4x - x^3) d x $
    $ = 2 [ 2x^2 - x^4/4 ]_0^2 $
    $ = 2(8 - 4) = 8 $
  ]
]

= Slicing horizontally
Some regions hate vertical slices : a single vertical line may enter and exit the region through the *same* curve. In that case, flip your head sideways and slice horizontally.

#definition("Area with Respect to " + $y$)[
  If $x = f(y)$ lies to the right of $x = g(y)$ for $c <= y <= d$, then the area between them is
  $ A = integral_c^d [ f(y) - g(y) ] d y $

  In short :
  $ "Area" = integral ("right" - "left") d y $
]

#example("A Region that Prefers Horizontal Slices")[
  Find the area enclosed by
  $ x = y^2 - 4 $
  and
  $ x = 2y - 1 $
  #solution("")[
    Find the intersections by setting the two right-hand sides equal :
    $ y^2 - 4 = 2y - 1 $
    $ y^2 - 2y - 3 = 0 $
    $ (y-3)(y+1) = 0 $
    so $y = -1$ and $y = 3$.

    For $-1 <= y <= 3$, the line $x = 2y - 1$ lies to the *right* of the parabola $x = y^2 - 4$. So
    $ A = integral_(-1)^3 lr([ (2y - 1) - (y^2 - 4) ]) d y $
    $ = integral_(-1)^3 (3 + 2y - y^2) d y $
    $ = lr([ 3y + y^2 - y^3/3 ])_(-1)^3 $
    $ = (9 + 9 - 9) - (-3 + 1 + 1/3) = 9 + 5/3 = 32/3 $

    A vertical-slice version of this computation would need two separate integrals and a square root. Horizontal slices see the region the way it wants to be seen.
  ]
]
