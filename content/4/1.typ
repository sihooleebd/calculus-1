#import "../../templates/templater.typ": *

Remember the preview chapter? We kept talking about area and distance by chopping them into little pieces. Now let us really *visualize* those pieces.

= The area problem
- Take a nonnegative function on an interval $[a,b]$. If we draw many thin rectangles under the curve, the sum of their areas starts to resemble the true region.

#definition("Riemann Sum")[
  Suppose we divide $[a,b]$ into $n$ equal parts. Let
  $ Delta x = (b-a)/n $
  and choose a sample point $x_i^*$ in the $i$th subinterval. Then
  $ A_n = sum_(i=1)^n f(x_i^*) Delta x $
  is called a *Riemann sum* for $f$ on $[a,b]$.
]

- The most common choices of sample points are the *left endpoints*, the *right endpoints*, and the *midpoints*. Watch how differently they hug the same curve :

#canvas.cartesian-canvas(
  size: (8, 5),
  x-domain: (-0.2, 2.4),
  y-domain: (0, 5),
  graph.graph(x => 4 - x * x, domain: (0, 2)),
  graph.riemann-sum(x => 4 - x * x, (0, 2), 4, method: "left", label: $L_4$),
)

#canvas.cartesian-canvas(
  size: (8, 5),
  x-domain: (-0.2, 2.4),
  y-domain: (0, 5),
  graph.graph(x => 4 - x * x, domain: (0, 2)),
  graph.riemann-sum(x => 4 - x * x, (0, 2), 4, method: "right", label: $R_4$),
)

#note("Overestimates and underestimates")[
  Because $y = 4 - x^2$ is *decreasing* on $[0,2]$, every left rectangle pokes above the curve and every right rectangle hides below it. So
  $ R_n <= A <= L_n $
  and the true area $A$ is squeezed between the two. As $n$ grows, the squeeze tightens.
]

#example("Approximating the Area under " + $y = 4 - x^2$)[
  Approximate the area under $y = 4 - x^2$ from $x = 0$ to $x = 2$ using $4$ left-endpoint rectangles, then using $4$ right-endpoint rectangles.
  #solution("")[
    Here
    $ Delta x = (2-0)/4 = 1/2 $
    and the left endpoints are
    $ x = 0, 1/2, 1, 3/2 $

    So
    $ L_4 = 1/2 lr([ 4 + (4 - 1/4) + (4 - 1) + (4 - 9/4) ]) $
    $ = 1/2 lr([ 4 + 15/4 + 3 + 7/4 ]) $
    $ = 1/2 dot 25/2 = 25/4 $

    The right endpoints are
    $ x = 1/2, 1, 3/2, 2 $
    so
    $ R_4 = 1/2 lr([ 15/4 + 3 + 7/4 + 0 ]) = 1/2 dot 17/2 = 17/4 $

    Therefore the true area $A$ satisfies
    $ 17/4 <= A <= 25/4 $
    Each rectangle family errs in one consistent direction because the parabola is decreasing, which is exactly why we get a two-sided bound.
  ]
]

- Approximation is nice, but we can already do better. If we know how to add the numbers $1^2, 2^2, ..., n^2$, we can let $n -> infinity$ and get the *exact* area.

#note("Summation formulas worth memorizing")[
  $ sum_(i=1)^n i = (n(n+1))/2 $
  $ sum_(i=1)^n i^2 = (n(n+1)(2n+1))/6 $
  $ sum_(i=1)^n i^3 = ((n(n+1))/2)^2 $
]

#example("The Exact Area as a Limit")[
  Find the exact area under $y = 4 - x^2$ from $x = 0$ to $x = 2$ by taking the limit of right-endpoint Riemann sums.
  #solution("")[
    With $n$ rectangles,
    $ Delta x = 2/n $
    and the right endpoints are
    $ x_i = (2i)/n $

    So
    $ R_n = sum_(i=1)^n lr([ 4 - ((2i)/n)^2 ]) 2/n $
    $ = 8/n sum_(i=1)^n 1 - 8/n^3 sum_(i=1)^n i^2 $
    $ = 8 - 8/n^3 dot (n(n+1)(2n+1))/6 $

    As $n -> infinity$, the fraction
    $ (n(n+1)(2n+1))/n^3 -> 2 $
    so
    $ lim_(n->infinity) R_n = 8 - 8 dot 2/6 = 8 - 8/3 = 16/3 $

    The area is exactly $16/3$, safely inside the bracket $[17/4, 25/4]$ we found before.
  ]
]

= The distance problem
Now replace "height" by "velocity". Each little rectangle becomes velocity times a tiny time interval, so the picture becomes accumulated distance.

#definition("Distance from a Velocity Function")[
  If an object moves with velocity $v(t)$ on $[a,b]$, then an approximation of the traveled distance is
  $ D_n = sum_(i=1)^n v(t_i^*) Delta t $
  where
  $ Delta t = (b-a)/n $
]

#note("What should we picture here?")[
  Imagine the velocity graph. Each rectangle under it tells us how far the object would travel if the velocity stayed almost constant on that tiny interval.
]

#example("Distance Approximation with a Curved Velocity Graph")[
  A particle moves with velocity
  $ v(t) = t^3 - 2t + 4 $
  on $[0,2]$. Use $4$ midpoint rectangles to approximate the distance traveled.
  #solution("")[
    We have
    $ Delta t = (2-0)/4 = 1/2 $
    and the midpoints are
    $ 1/4, 3/4, 5/4, 7/4 $

    So
    $ D_4 = 1/2 lr([ v(1/4) + v(3/4) + v(5/4) + v(7/4) ]) $
    $ = 1/2 lr([ 225/64 + 187/64 + 221/64 + 375/64 ]) $
    $ = 1/2 dot 1008/64 = 63/8 $

    Therefore the approximate distance is $63/8$ units.
  ]
]
