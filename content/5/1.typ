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

    Therefore
    $ A = integral_(-2)^0 [(x^3 - 3x) - x] d x + integral_0^2 [x - (x^3 - 3x)] d x $
    $ = integral_(-2)^0 (x^3 - 4x) d x + integral_0^2 (4x - x^3) d x $

    By symmetry, these two areas are equal, so
    $ A = 2 integral_0^2 (4x - x^3) d x $
    $ = 2 [ 2x^2 - x^4/4 ]_0^2 $
    $ = 2(8 - 4) = 8 $
  ]
]
