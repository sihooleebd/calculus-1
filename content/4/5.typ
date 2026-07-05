#import "../../templates/templater.typ": *

= The substitution rule
The chain rule told us what happens when functions are nested. Substitution is what happens when we reverse that nesting during integration.

#definition("Substitution Rule")[
  If $u = g(x)$ and $d u = g'(x) d x$, then
  $ integral f(g(x)) g'(x) d x = integral f(u) d u $

  For definite integrals, we also change the bounds :
  $ integral_a^b f(g(x)) g'(x) d x = integral_(g(a))^(g(b)) f(u) d u $
]

#note("What should we try to see?")[
  Look for an *outside function* and an *inside function*. If some derivative of the inside piece is sitting nearby, substitution is usually the right picture.
]

#example("A Power hiding inside another power")[
  Evaluate
  $ integral x^3 sqrt(x^4 + 1) d x $
  #solution("")[
    The inner expression is
    $ x^4 + 1 $
    and its derivative is
    $ 4x^3 $
    which is almost sitting there already.

    Let
    $ u = x^4 + 1 $
    Then
    $ d u = 4x^3 d x $
    so
    $ x^3 d x = 1/4 d u $

    Therefore
    $ integral x^3 sqrt(x^4 + 1) d x = 1/4 integral u^(1/2) d u $
    $ = 1/4 dot 2/3 u^(3/2) + C $
    $ = 1/6 (x^4 + 1)^(3/2) + C $
  ]
]

#example("Substitution with Trigonometric Bounds")[
  Evaluate
  $ integral_0^(pi/4) sin(2x)/(1 + cos^2(2x)) d x $
  #solution("")[
    Here the inside function is
    $ cos(2x) $
    because its derivative gives a multiple of $sin(2x)$.

    Let
    $ u = cos(2x) $
    Then
    $ d u = -2 sin(2x) d x $
    so
    $ sin(2x) d x = -1/2 d u $

    Change the bounds :
    If $x = 0$, then $u = 1$.
    If $x = pi/4$, then $u = 0$.

    Therefore
    $ integral_0^(pi/4) sin(2x)/(1 + cos^2(2x)) d x = -1/2 integral_1^0 1/(1+u^2) d u $
    $ = 1/2 integral_0^1 1/(1+u^2) d u $
    $ = 1/2 [ tan^(-1)(u) ]_0^1 = 1/2 dot pi/4 = pi/8 $
  ]
]

#example("Substituting to Kill a Square Root")[
  Evaluate
  $ integral_0^1 1/(1 + sqrt(x))^3 d x $
  #solution("")[
    The annoying part is $sqrt(x)$, so make the whole parenthesis the new variable. Let
    $ u = 1 + sqrt(x) $
    Then
    $ sqrt(x) = u - 1 $
    so
    $ x = (u-1)^2 $
    and
    $ d x = 2(u-1) d u $

    Change the bounds :
    If $x = 0$, then $u = 1$.
    If $x = 1$, then $u = 2$.

    Therefore
    $ integral_0^1 1/(1 + sqrt(x))^3 d x = integral_1^2 (2(u-1))/u^3 d u $
    $ = 2 integral_1^2 (u^(-2) - u^(-3)) d u $
    $ = 2 lr([ -1/u + 1/(2u^2) ])_1^2 $
    $ = 2 lr([ (-1/2 + 1/8) - (-1 + 1/2) ]) = 2 dot 1/8 = 1/4 $
  ]
]

= Integrals of symmetric functions
Substitution also explains why symmetry is such a powerful shortcut on symmetric intervals.

#theorem("Symmetry Theorem")[
  Suppose $f$ is continuous on $[-a,a]$.
  1. If $f$ is even, so $f(-x) = f(x)$, then
  $ integral_(-a)^a f(x) d x = 2 integral_0^a f(x) d x $
  2. If $f$ is odd, so $f(-x) = -f(x)$, then
  $ integral_(-a)^a f(x) d x = 0 $
  #proof("Substitute in the left half")[
    Split the integral :
    $ integral_(-a)^a f(x) d x = integral_(-a)^0 f(x) d x + integral_0^a f(x) d x $

    In the first piece, substitute $u = -x$, so $d u = -d x$ :
    $ integral_(-a)^0 f(x) d x = integral_0^a f(-u) d u $

    If $f$ is even, this equals $integral_0^a f(u) d u$ and the two halves add.
    If $f$ is odd, this equals $-integral_0^a f(u) d u$ and the two halves cancel.
  ]
]

#canvas.cartesian-canvas(
  size: (8, 4.5),
  x-domain: (-2.4, 2.4),
  y-domain: (-4, 4),
  graph.riemann-sum(x => x * x * x - 2 * x, (-2, 0), 60, method: "midpoint", smooth: true, style: (fill: rgb("#c6d8f5"), stroke: none)),
  graph.riemann-sum(x => x * x * x - 2 * x, (0, 2), 60, method: "midpoint", smooth: true, style: (fill: rgb("#f5c6c6"), stroke: none)),
  graph.graph(x => x * x * x - 2 * x, domain: (-2, 2), label: $y = x^3 - 2x$),
)

#example("Symmetry Doing All the Work")[
  Evaluate
  $ integral_(-3)^3 (x^5 + x^3 sin^2(x))/(x^4 + 2) d x $
  #solution("")[
    Check the symmetry of the integrand. Replacing $x$ by $-x$ :
    - $x^5$ and $x^3$ flip sign,
    - $sin^2(x)$ and $x^4 + 2$ stay the same.

    So the whole integrand is *odd*, and the interval $[-3,3]$ is symmetric. Therefore
    $ integral_(-3)^3 (x^5 + x^3 sin^2(x))/(x^4 + 2) d x = 0 $
    with no computation at all. The shaded picture above shows exactly why : the two lobes are congruent with opposite signs.
  ]
]
