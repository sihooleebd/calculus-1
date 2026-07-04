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

#canvas.cartesian-canvas(
  x-domain: (-0.2, 2.4),
  y-domain: (0, 5),
  graph.graph(x => 4 - x * x, domain: (0, 2.1)),
  graph.riemann-sum(x => 4 - x * x, (0, 2), 4, method: "left", label: $A_4$),
)

#example("Approximating the Area under " + $y = 4 - x^2$)[
  Approximate the area under $y = 4 - x^2$ from $x = 0$ to $x = 2$ using $4$ left-endpoint rectangles.
  #solution("")[
    Here
    $ Delta x = (2-0)/4 = 1/2 $
    and the left endpoints are
    $ x = 0, 1/2, 1, 3/2 $

    So
    $ A_4 = 1/2 lr([ 4 + (4 - 1/4) + (4 - 1) + (4 - 9/4) ]) $
    $ = 1/2 lr([ 4 + 15/4 + 3 + 7/4 ]) $
    $ = 1/2 dot 25/2 = 25/4 $

    Visually, each rectangle is too tall because the parabola is decreasing, so this left sum should overestimate the true area.
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
