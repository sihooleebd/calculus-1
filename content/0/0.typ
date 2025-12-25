#import "../../templates/templater.typ": *

= What is calculus?
- We have two main problems that we deal in calculus: The area problem & the tangent problem.
  - The area problem is about finding the area under a curve.
  - The tangent problem is about finding the slope of a curve at a given point.
  - #image("../images/Screenshot 2025-12-19 at 17.19.26.png")
  - Approximation of an area using rectangles.

  #cartesian-canvas(
    size: (8, 6),
    x-domain: (-0.5, 3),
    y-domain: (-0.5, 5),
    show-grid: true,
    // Plot f(x) = x²
    graph(x => calc.pow(x, 2), domain: (0, 2.2)),
    // Tangent line at x=1: y = 2x - 1
    func(x => 2 * x - 1, domain: (0, 2.5), style: (stroke: gray)),
    // Point on curve at x=1
    point(1, 1, label: $P$),
  )
  #notation("The Area Problem")[
    We can define the area under the curve as
    $ A = lim_(n -> infinity) A_n $
    Here, $A_i$ represents sum of each area block equally dividing the given range into n parts.
  ]

  #notation("The Tangent Problem")[
    The slope of a curve at a given point $a$ can be defined as
    $ m_a = lim_(h -> 0) (f(a + h) - f(a)) / h $
    Here, $m$ represents the slope of the tangent line to the curve at point x.
    Or, alternatively, we can write it as :
    $ m_a = lim_(x -> a) (f(x)-f(a))/(x-a) $
  ]

  #note("So what's the relation?")[
    Both problems involve limits.
    The area problem uses a limit to find the exact area under a curve.
    The tangent problem uses a limit to find the exact slope of a tangent line. In the end, solving one of them leads to solving the other. We call this the *Fundamental Theorem of Calculus*.
  ]

