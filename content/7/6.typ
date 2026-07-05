#import "../../templates/templater.typ": *

= Integration using tables and technology
Some integrals are not meant to end in elementary functions. In those cases, technology is not a shortcut. It is the correct tool.

#definition("Nonelementary antiderivatives")[
  Some integrals cannot be expressed with the elementary functions we normally use in calculus.
  Then we either :
  - leave the answer in integral form,
  - define a new special function,
  - or approximate the value numerically.
]

#canvas.cartesian-canvas(
  size: (8, 4),
  x-domain: (-3, 3),
  y-domain: (-0.3, 1.3),
  y-tick: 0.5,
  graph.riemann-sum(x => calc.exp(-x * x), (0, 1), 60, method: "midpoint", smooth: true, style: (fill: rgb("#c6d8f5"), stroke: none)),
  graph.graph(x => calc.exp(-x * x), domain: (-3, 3), label: $y = e^(-x^2)$),
)

#example("A Classical Nonelementary Integral")[
  Consider
  $ integral e^(-x^2) d x $
  #solution("")[
    This integral has no elementary antiderivative : the bell curve above encloses perfectly good areas, but no formula made of powers, exponentials, logs and trig functions describes them.
    So a definite value is usually found with technology or by defining a special function.

    For instance, the shaded region is
    $ integral_0^1 e^(-x^2) d x approx 0.7468 $

    Another well-known example is
    $ integral_0^1 sin(x^2) d x approx 0.3103 $
    which also has no elementary antiderivative.
  ]
]

= Using a table of integrals
A table is a museum of solved shapes. The skill is not reading the table ; it is *deforming your integral* until it matches an exhibit.

#example("Matching a Table Entry")[
  A standard table lists the entry
  $ integral 1/(u sqrt(a^2 + u^2)) d u = -1/a ln lr(|(a + sqrt(a^2+u^2))/u|) + C $
  Use it to evaluate
  $ integral 1/(x sqrt(4 + x^2)) d x $
  #solution("")[
    Pattern-match : $u = x$ and $a^2 = 4$, so $a = 2$. Substituting directly,
    $ integral 1/(x sqrt(4 + x^2)) d x = -1/2 ln lr(|(2 + sqrt(4+x^2))/x|) + C $

    No cleverness required, but note that we could also have earned this result ourselves with the substitution $x = 2 tan(theta)$ from the previous sections. Tables are frozen trig substitutions.
  ]
]

#note("When the computer disagrees with you")[
  A computer algebra system may answer in a different costume : it might return $sinh^(-1)(x/2)$ where your table said $ln(x + sqrt(x^2+4))$, or produce answers differing by a constant. Both are correct : antiderivatives are only unique *up to constants and identities*. Differentiate the machine's answer if you want to referee.
]

#note("What the student should learn here")[
  The goal is not to force every integral into hand computation. The goal is to recognize when the hand computation is over.
]
