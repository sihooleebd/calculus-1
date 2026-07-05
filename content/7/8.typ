#import "../../templates/templater.typ": *

= Improper integrals
Improper integrals appear when the region never ends or when the graph shoots off vertically. In both cases, the right way to read the picture is through a limit.

#definition("Improper Integral")[
  An integral is called *improper* if :
  - one or both bounds are infinite, or
  - the integrand becomes unbounded on the interval
]

#note("What are we really doing?")[
  We are replacing a dangerous endpoint by a moving cutoff, computing an ordinary integral first, and only then taking a limit.
]

#canvas.cartesian-canvas(
  size: (8, 4.5),
  x-domain: (0, 7),
  y-domain: (0, 2),
  y-tick: 0.5,
  graph.riemann-sum(x => 1 / (x * x), (1, 6.5), 80, method: "midpoint", smooth: true, style: (fill: rgb("#c6d8f5"), stroke: none)),
  graph.graph(x => 1 / (x * x), domain: (0.75, 6.8), label: $y = 1/x^2$),
  graph.graph(x => 1 / x, domain: (0.55, 6.8), label: $y = 1/x$),
)

- Both curves above sink to $0$, but their infinite tails behave completely differently : the shaded region under $1/x^2$ has *finite* total area, while the region under $1/x$ (which looks barely bigger) has infinite area. Speed of decay is everything.

#example("A Convergent Improper Integral on an Infinite Interval")[
  Evaluate
  $ integral_1^infinity 1/(x^2 + 4x + 3) d x $
  #solution("")[
    First factor the denominator :
    $ x^2 + 4x + 3 = (x+1)(x+3) $

    Use partial fractions :
    $ 1/((x+1)(x+3)) = 1/2 dot 1/(x+1) - 1/2 dot 1/(x+3) $

    Therefore
    $ integral_1^infinity 1/(x^2 + 4x + 3) d x = lim_(b->infinity) 1/2 integral_1^b [ 1/(x+1) - 1/(x+3) ] d x $
    $ = lim_(b->infinity) 1/2 [ ln(x+1) - ln(x+3) ]_1^b $
    $ = 1/2 lim_(b->infinity) lr([ ln((b+1)/(b+3)) - ln(2/4) ]) $
    $ = 1/2 lr([ 0 - ln(1/2) ]) = 1/2 ln(2) $

    So the integral converges to $1/2 ln(2)$.
  ]
]

#example("A Divergent Improper Integral with a Vertical Asymptote")[
  Evaluate
  $ integral_0^1 1/x^2 d x $
  #solution("")[
    Because the integrand blows up at $x = 0$, we define
    $ integral_0^1 1/x^2 d x = lim_(a->0+) integral_a^1 1/x^2 d x $
    $ = lim_(a->0+) [ -1/x ]_a^1 $
    $ = lim_(a->0+) (-1 + 1/a) $

    Since $1/a -> infinity$ as $a -> 0+$, the integral diverges.
  ]
]

= The p-integrals : the measuring sticks
#theorem("The p-Test at Infinity")[
  $ integral_1^infinity 1/x^p d x quad "converges if and only if" p > 1 $
  #proof("Just integrate")[
    For $p != 1$,
    $ integral_1^b x^(-p) d x = (b^(1-p) - 1)/(1-p) $
    As $b -> infinity$ : if $p > 1$, then $b^(1-p) -> 0$ and the limit is $1/(p-1)$. If $p < 1$, then $b^(1-p) -> infinity$ and the integral diverges.

    For $p = 1$,
    $ integral_1^b 1/x d x = ln(b) -> infinity $
    so it diverges too.
  ]
]

#theorem("The p-Test at Zero")[
  $ integral_0^1 1/x^p d x quad "converges if and only if" p < 1 $
  #proof("Same computation, other endpoint")[
    For $p != 1$,
    $ integral_a^1 x^(-p) d x = (1 - a^(1-p))/(1-p) $
    As $a -> 0^+$ : if $p < 1$, then $a^(1-p) -> 0$ and the limit is $1/(1-p)$. If $p > 1$, then $a^(1-p) -> infinity$ and the integral diverges. The case $p = 1$ gives $-ln(a) -> infinity$.

    Notice the perfect duality with the previous theorem : the two tests split the world of powers at $p = 1$, in opposite directions.
  ]
]

= Comparison : convergence without computation
#theorem("Comparison Theorem")[
  Suppose $f$ and $g$ are continuous with $0 <= g(x) <= f(x)$ for $x >= a$.
  1. If $integral_a^infinity f(x) d x$ converges, then $integral_a^infinity g(x) d x$ converges.
  2. If $integral_a^infinity g(x) d x$ diverges, then $integral_a^infinity f(x) d x$ diverges.
]

#example("Convergence Decided by Comparison")[
  For which values of $a > 0$ does
  $ integral_1^infinity (3 + cos(x))/x^a d x $
  converge?
  #solution("")[
    The numerator oscillates, but harmlessly : for all $x$,
    $ 2 <= 3 + cos(x) <= 4 $
    So the integrand is trapped :
    $ 2/x^a <= (3 + cos(x))/x^a <= 4/x^a $

    If $a > 1$, the upper bound $4/x^a$ has a convergent p-integral, so ours converges by comparison.
    If $a <= 1$, the lower bound $2/x^a$ has a divergent p-integral, so ours diverges.

    Therefore the integral converges *exactly* when $a > 1$. The cosine never had a vote : only the power of $x$ mattered.
  ]
]

= Two exam-grade computations
#example("An Infinite Integral Needing By Parts")[
  Evaluate
  $ integral_0^infinity x^2 e^(-3x) d x $
  #solution("")[
    Integrate by parts twice (or recycle the pattern from the by-parts section) :
    $ integral x^2 e^(-3x) d x = e^(-3x) lr([ -x^2/3 - (2x)/9 - 2/27 ]) + C $

    Now take the limit. For any polynomial $P$, $P(b)e^(-3b) -> 0$ as $b -> infinity$, because exponential decay beats polynomial growth (l'Hospital says so). Hence
    $ integral_0^infinity x^2 e^(-3x) d x = 0 - lr([ -2/27 ]) = 2/27 $
  ]
]

#example("An Endpoint Singularity Cured by Substitution")[
  Evaluate
  $ integral_0^1 e^(-2/x)/x^2 d x $
  #solution("")[
    The integrand is undefined at $x = 0$, so this is improper :
    $ integral_0^1 e^(-2/x)/x^2 d x = lim_(a->0^+) integral_a^1 e^(-2/x)/x^2 d x $

    Spot the derivative pair : since
    $ d/(d x) e^(-2/x) = e^(-2/x) dot 2/x^2 $
    we get
    $ integral_a^1 e^(-2/x)/x^2 d x = 1/2 lr([ e^(-2/x) ])_a^1 = 1/2 lr([ e^(-2) - e^(-2/a) ]) $

    As $a -> 0^+$, the exponent $-2/a -> -infinity$, so $e^(-2/a) -> 0$. Therefore
    $ integral_0^1 e^(-2/x)/x^2 d x = 1/(2e^2) $

    The "singularity" was a bluff : the function actually dives to $0$ near the origin faster than any power climbs.
  ]
]
