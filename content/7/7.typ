#import "../../templates/templater.typ": *

= Approximate integration
If an exact antiderivative is unavailable, we can still estimate the area very well by replacing the curve with shapes we understand.

#definition("Midpoint Rule")[
  If $[a,b]$ is split into $n$ equal pieces of width $Delta x$, and $overline(x)_i$ denotes the midpoint of the $i$th piece, then
  $ M_n = Delta x lr([ f(overline(x)_1) + f(overline(x)_2) + ... + f(overline(x)_n) ]) $
]

#definition("Trapezoidal Rule")[
  If $[a,b]$ is split into $n$ equal pieces of width $Delta x$, then
  $ T_n = Delta x/2 lr([ f(x_0) + 2f(x_1) + 2f(x_2) + ... + 2f(x_(n-1)) + f(x_n) ]) $
]

#definition("Simpson's Rule")[
  If $n$ is even, then
  $ S_n = Delta x/3 lr([ f(x_0) + 4f(x_1) + 2f(x_2) + 4f(x_3) + ... + 2f(x_(n-2)) + 4f(x_(n-1)) + f(x_n) ]) $
]

#note("How should we picture them?")[
  The Midpoint Rule uses flat-topped rectangles balanced at the middle. The Trapezoidal Rule connects nearby points by line segments. Simpson's Rule goes one step better and uses parabolic arcs. That is why its weights dance $1, 4, 2, 4, ..., 4, 1$.
]

#canvas.cartesian-canvas(
  size: (8, 4.5),
  x-domain: (-0.15, 1.25),
  y-domain: (0, 1.3),
  x-tick: 0.25,
  y-tick: 0.25,
  graph.riemann-sum(x => calc.exp(-x * x), (0, 1), 4, method: "trapezoid"),
  graph.graph(x => calc.exp(-x * x), domain: (-0.1, 1.2), label: $y = e^(-x^2)$),
)

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

    So Simpson's Rule is already extremely close to the actual value ($approx 0.74682$). The trapezoids undershoot because the curve is mostly concave down there : each chord hangs below the arc, exactly as the picture shows.
  ]
]

#example("Simpson's Rule against an Exact Answer")[
  Approximate
  $ integral_0^2 3^(-x) d x $
  with Simpson's Rule and $n = 4$, then compare with the exact value.
  #solution("")[
    Here $Delta x = 1/2$ and the sample values are
    $ f(0) = 1, quad f(1/2) approx 0.5774, quad f(1) approx 0.3333, quad f(3/2) approx 0.1925, quad f(2) approx 0.1111 $

    So
    $ S_4 = 1/6 lr([ 1 + 4(0.5774) + 2(0.3333) + 4(0.1925) + 0.1111 ]) approx 0.8095 $

    This time we *can* check. Since
    $ integral 3^(-x) d x = -3^(-x)/ln(3) + C $
    the exact value is
    $ integral_0^2 3^(-x) d x = (1 - 1/9)/ln(3) = 8/(9 ln(3)) approx 0.8091 $

    Four subintervals, and Simpson's Rule is already correct to three decimal places.
  ]
]

= How wrong can we be?
An approximation without an error estimate is a rumor. The error of each rule is controlled by how *curved* the function is.

#theorem("Error Bounds")[
  Suppose $|f''(x)| <= K$ on $[a,b]$. Then the errors satisfy
  $ |E_T| <= (K(b-a)^3)/(12n^2) quad "and" quad |E_M| <= (K(b-a)^3)/(24n^2) $
  If moreover $|f^((4))(x)| <= K_4$ on $[a,b]$, then Simpson's error satisfies
  $ |E_S| <= (K_4 (b-a)^5)/(180n^4) $
]

#note("Read the exponents")[
  Doubling $n$ divides the trapezoid error by about $4$, but divides Simpson's error by about $16$. And the midpoint rule is (perhaps surprisingly) about *twice as accurate* as the trapezoid rule, with the opposite sign of error.
]

#example("Choosing " + $n$ + " in Advance")[
  How large must $n$ be so that the Trapezoidal Rule approximates
  $ integral_0^1 e^(-x^2) d x $
  with error at most $10^(-4)$?
  #solution("")[
    We need a bound on the second derivative. From
    $ f''(x) = (4x^2 - 2)e^(-x^2) $
    the largest magnitude on $[0,1]$ occurs at $x = 0$, giving
    $ |f''(x)| <= 2 $

    So take $K = 2$, $b - a = 1$ :
    $ |E_T| <= 2/(12n^2) = 1/(6n^2) $

    Demanding $1/(6n^2) <= 10^(-4)$ gives
    $ n^2 >= 10^4/6 approx 1667 $
    so
    $ n >= 41 $

    41 trapezoids for four decimal places, while Simpson's Rule earned three decimals with $n = 4$. This is why Simpson's Rule is the default workhorse of numerical integration.
  ]
]
