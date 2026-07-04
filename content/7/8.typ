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
