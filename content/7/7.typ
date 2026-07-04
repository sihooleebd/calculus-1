#import "../../templates/templater.typ": *

= Approximate integration
If an exact antiderivative is unavailable, we can still estimate the area very well by replacing the curve with shapes we understand.

#definition("Trapezoidal Rule")[
  If $[a,b]$ is split into $n$ equal pieces of width $Delta x$, then
  $ T_n = Delta x/2 lr([ f(x_0) + 2f(x_1) + 2f(x_2) + ... + 2f(x_(n-1)) + f(x_n) ]) $
]

#definition("Simpson's Rule")[
  If $n$ is even, then
  $ S_n = Delta x/3 lr([ f(x_0) + 4f(x_1) + 2f(x_2) + 4f(x_3) + ... + 2f(x_(n-2)) + 4f(x_(n-1)) + f(x_n) ]) $
]

#note("How should we picture them?")[
  The Trapezoidal Rule connects nearby points by line segments. Simpson's Rule goes one step better and uses parabolic arcs.
]

#example("Approximating a Nonelementary Integral")[
  Use $n = 4$ to approximate
  $ integral_0^1 e^(-x^2) d x $
  by the Trapezoidal Rule and Simpson's Rule.
  #solution("")[
    Here
    $ Delta x = 1/4 $
    and
    $ f(x) = e^(-x^2) $

    The needed values are
    $ f(0) = 1 $
    $ f(1/4) approx 0.9394 $
    $ f(1/2) approx 0.7788 $
    $ f(3/4) approx 0.5698 $
    $ f(1) approx 0.3679 $

    Therefore
    $ T_4 = 1/8 lr([ 1 + 2(0.9394) + 2(0.7788) + 2(0.5698) + 0.3679 ]) $
    $ approx 0.7430 $

    And
    $ S_4 = 1/12 lr([ 1 + 4(0.9394) + 2(0.7788) + 4(0.5698) + 0.3679 ]) $
    $ approx 0.7469 $

    So Simpson's Rule is already extremely close to the actual value.
  ]
]
