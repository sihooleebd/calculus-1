#import "../../templates/templater.typ": *

= General logarithmic and exponential functions
Once we understand $ln(x)$ and $e^x$, every other base is really just a translated version of those two.

#definition("General Exponential Function")[
  If $a > 0$ and $a != 1$, then
  $ a^x = e^(x ln(a)) $
]

#definition("General Logarithm")[
  If $a > 0$ and $a != 1$, then
  $ log_a(x) = ln(x)/ln(a) $
]

#canvas.cartesian-canvas(
  size: (8, 5),
  x-domain: (-3.2, 3.2),
  y-domain: (0, 8),
  graph.graph(x => calc.pow(2, x), domain: (-3, 3), label: $y = 2^x$),
  graph.graph(x => calc.pow(3, x), domain: (-3, 1.85), label: $y = 3^x$),
  graph.graph(x => calc.pow(0.5, x), domain: (-3, 3), label: $y = (1/2)^x$),
)

#note("One family, one master key")[
  All these curves pass through $(0,1)$, and each is just $e^(x ln(a))$ stretched horizontally by its own factor $ln(a)$. Bases $a > 1$ climb, bases $a < 1$ fall, and the case $a = e$ is the one whose tangent at $(0,1)$ has slope exactly $1$.
]

#theorem("Derivative Formulae")[
  1. $ d/(d x) a^x = a^x ln(a) $
  2. $ d/(d x) log_a(x) = 1/(x ln(a)) $
  #proof("Reduce everything to " + $e^x$ + " and " + $ln(x)$)[
    Since
    $ a^x = e^(x ln(a)) $
    the chain rule gives
    $ d/(d x) a^x = d/(d x) e^(x ln(a)) = e^(x ln(a)) ln(a) = a^x ln(a) $

    Also,
    $ log_a(x) = ln(x)/ln(a) $
    and $ln(a)$ is a constant, so
    $ d/(d x) log_a(x) = 1/ln(a) dot d/(d x) ln(x) = 1/(x ln(a)) $
  ]
]

#example("Differentiating a General Exponential with a Composite Exponent")[
  Differentiate
  $ y = 5^(x^2 - x) $
  #solution("")[
    Use the chain rule together with the derivative of $a^x$ :
    $ y' = 5^(x^2 - x) ln(5) dot (2x - 1) $
  ]
]

#example("Differentiating a General Logarithm of a Composite Function")[
  Differentiate
  $ y = log_3(x^2 + 1) $
  #solution("")[
    Using
    $ d/(d x) log_a(x) = 1/(x ln(a)) $
    together with the chain rule, we get
    $ y' = 1/((x^2 + 1) ln(3)) dot 2x $
    $ = 2x/((x^2 + 1) ln(3)) $
  ]
]

= Variable base, variable exponent
What about $x^x$-type functions, where *both* the base and the exponent move? Neither the power rule nor the exponential rule applies alone, but $a^x = e^(x ln a)$ still saves us.

#example("Differentiating " + $y = x^(sqrt(x))$)[
  Differentiate
  $ y = x^(sqrt(x)) $
  for $x > 0$.
  #solution("")[
    Rewrite with base $e$ :
    $ y = e^(sqrt(x) ln(x)) $

    Then by the chain and product rules,
    $ y' = x^(sqrt(x)) dot d/(d x) lr([ sqrt(x) ln(x) ]) $
    $ = x^(sqrt(x)) lr([ ln(x)/(2 sqrt(x)) + sqrt(x)/x ]) $
    $ = x^(sqrt(x)) (ln(x) + 2)/(2 sqrt(x)) $

    Equivalently, we could have taken $ln$ of both sides and differentiated implicitly : logarithmic differentiation and the $e^(x ln a)$ rewrite are the same move in different clothes.
  ]
]

#theorem("The Number " + $e$ + " as a Limit")[
  $ e = lim_(x -> 0) (1 + x)^(1/x) = lim_(n -> infinity) (1 + 1/n)^n $
  #proof("The derivative of " + $ln$ + " at " + $1$ + " in disguise")[
    Let $f(x) = ln(x)$, so $f'(1) = 1$. Writing the derivative as a limit :
    $ 1 = f'(1) = lim_(x->0) (ln(1+x) - ln(1))/x = lim_(x->0) ln((1+x)^(1/x)) $

    Since $e^x$ is continuous, we may exponentiate the limit :
    $ lim_(x->0) (1+x)^(1/x) = e^1 = e $
    The sequence version follows by setting $x = 1/n$.
  ]
]
