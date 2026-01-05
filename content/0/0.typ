#import "../../templates/templater.typ": *

= What is calculus?
- We have two main problems that we deal in calculus: The area problem & the tangent problem.
  - The area problem is about finding the area under a curve.
  - Approximation of an area using rectangles.

#grid(
  columns: (1fr, 1fr, 1fr),
  rows: (auto),
  gutter: 3pt,
  cartesian-canvas(
    size: (4,3),
    x-domain: (-0.5, 3.5),
    y-domain: (-0.5, 2.5),
      func(x => 2 + 0.7*x - 1.5*x*x + 0.51*x*x*x - 0.033*x*x*x*x, domain: (-1,4)),
      riemann-sum(x => 2 + 0.7*x - 1.5*x*x + 0.51*x*x*x - 0.033*x*x*x*x, (0,3.5), 4, style: (stroke: active-theme.plot.highlight))
  ),
  cartesian-canvas(
    size: (4,3),
    x-domain: (-0.5, 3.5),
    y-domain: (-0.5, 2.5),
      func(x => 2 + 0.7*x - 1.5*x*x + 0.51*x*x*x - 0.033*x*x*x*x, domain: (-1,4)),
      riemann-sum(x => 2 + 0.7*x - 1.5*x*x + 0.51*x*x*x - 0.033*x*x*x*x, (0,3.5), 8, style: (stroke: active-theme.plot.highlight))
  ),
  cartesian-canvas(
    size: (4,3),
    x-domain: (-0.5, 3.5),
    y-domain: (-0.5, 2.5),
    func(x => 2 + 0.7*x - 1.5*x*x + 0.51*x*x*x - 0.033*x*x*x*x, domain: (-1,4)),
    riemann-sum(x => 2 + 0.7*x - 1.5*x*x + 0.51*x*x*x - 0.033*x*x*x*x, (0,3.5), 16, style: (stroke: active-theme.plot.highlight))
  )
)

  - The tangent problem is about finding the slope of a curve at a given point.

#cartesian-canvas(
  size: (8, 6),
  x-domain: (-0.5, 3),
  y-domain: (-0.5, 5),
  show-grid: true,
  // Plot f(x) = x²
  graph(x => calc.pow(x, 2), domain: (-1, 3.5)),
  // Tangent line at x=1: y = 2x - 1
  func(x => 2 * x - 1, domain: (-1, 3.5), style: (stroke: gray)),
  // Point on curve at x=1
  point(1, 1, label: $P$),
)

== The Area Problem

#definition("The Area Problem")[
  We can define the area under the curve as
  $ A = lim_(n -> infinity) A_n $
  Here, $A_i$ represents sum of each area block equally dividing the given range into n parts.
]

#example("Method of Exhaustion")[
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    gutter: 3pt,
    blank-canvas(
        size: (3,3),
        x-domain: (-1,1),
        y-domain: (-1,1),
        circle((0,0), 1),
        regular-polygon((0,0), (0,1), 3, fill: active-theme.plot.stroke.opacify(-90%), label: $A_3$)
    ),
    blank-canvas(
        size: (3,3),
        x-domain: (-1,1),
        y-domain: (-1,1),
        circle((0,0), 1),
        regular-polygon((0,0), (0,1), 5, fill: active-theme.plot.stroke.opacify(-90%), label: $A_5$)
    ),
    blank-canvas(
        size: (3,3),
        x-domain: (-1,1),
        y-domain: (-1,1),
        circle((0,0), 1),
        regular-polygon((0,0), (0,1), 7, fill: active-theme.plot.stroke.opacify(-90%), label: $A_7$)
    ),
    blank-canvas(
        size: (3,3),
        x-domain: (-1,1),
        y-domain: (-1,1),
        circle((0,0), 1),
        regular-polygon((0,0), (0,1), 9, fill: active-theme.plot.stroke.opacify(-90%), label: $A_9$)
    )
  )
  Ancient Greek mathmaticians knew the way to find the area of any given polynomial by dividing them to multiple triangles.
  In order to find the area of curved figures like circles, they used a method called *Method of Exhaustion*, that utilizes inscribe polygons.

  As the number of sides increases, it appears that $A_n$ gets closer and closer to the area of the circle. We say that the area $A$ of the circle is the *limit* of areas of the inscribed polygons.
    
  $ lim_(n->oo) A_n = A $
]

== The Tangent Problem

#let tanf = func.with(x => 3 - 0.4*(x - 3)*(x - 3))

#definition("The Tangent Problem")[
  #cartesian-canvas(
      size: (6,6),
      x-domain: (-1.5, 5.5),
      y-domain: (-1.5, 5.5),
      tanf(domain: (-1.5, 5.5)),
      tangent(tanf().f, 2, length: 3),
      point(2,(tanf().f)(2), label: $P$)
  )
  How should we find the tangent line to a curve at a given point on a curve? \
  Despite we can't find a line passing through one point, we stil can find a line passing through _two_ points.
  
  #grid(
    columns: (1fr,1fr,1fr),
    gutter: 2pt,
    {
        let dx = 1.5
      let p = (2,(tanf().f)(2))
      let q = (2+dx,(tanf().f)(2+dx))
      cartesian-canvas(
        size: (4,4),
        x-domain: (-1.5, 5.5),
        y-domain: (-1.5, 5.5),
        tanf(domain: (-1.5, 5.5)),
        point(..p, label: $P$),
        point(..q, label: $Q$),
        line(p,q)
      )
      align(center)[$Delta x=dx$]
    },
    {
      let dx = 1
      let p = (2,(tanf().f)(2))
      let q = (2+dx,(tanf().f)(2+dx))
      cartesian-canvas(
        size: (4,4),
        x-domain: (-1.5, 5.5),
        y-domain: (-1.5, 5.5),
        tanf(domain: (-1.5, 5.5)),
        point(..p, label: $P$),
        point(..q, label: $Q$),
        line(p,q)
      )
      align(center)[$Delta x=dx$]
    },
    {
        let dx = 0.4
      let p = (2,(tanf().f)(2))
      let q = (2+dx,(tanf().f)(2+dx))
      cartesian-canvas(
        size: (4,4),
        x-domain: (-1.5, 5.5),
        y-domain: (-1.5, 5.5),
        tanf(domain: (-1.5, 5.5)),
        point(..p, label: $P$),
        point(..q, label: $Q$),
        line(p,q)
      )
      align(center)[$Delta x=dx$]
    }
  )
  As the above illustration demonstrates, the secant line of $P$ and $Q$ gets closer and closer to the tangent line as $Q$ get closer and clser to the point $P$. However, $Q$ will never be able to be _identical_ with $P$ because that case secant line will no longer be defined. The solution here is to claim that if we take $Q$ _infinitely_ close to $P$, than the secant line will be _infinitely_ same as the tangent line.
  
  If we express this as a equation,
  $ m=lim_(Q->P)m_(P Q) and m_(P Q)=(f(x)-f(a))/(x-a) ==> m=limx(a)(f(x)-f(a))/(x-a) $
  Where $m$ is the slope of the tangent line, $m_(P Q)$ is a slope of a secant line, and $a$ is the x coord of the point $P$.
]

= The Fundamental Theorem of Calculus

#note("So what's the relation?")[
  Both problems involve limits. \
  The area problem uses a limit to find the exact area under a curve. \
  The tangent problem uses a limit to find the exact slope of a tangent line. \
  Despite both involving limits, the essence of each problems seem to have completely different properties.
  In the end, solving one of them leads to solving the other. We call this the *Fundamental Theorem of Calculus*.
]


