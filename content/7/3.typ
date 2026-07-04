#import "../../templates/templater.typ": *

= Trigonometric substitution
When a square root contains a quadratic expression, trigonometric substitution turns that root into something we can actually see and simplify.

#definition("Standard substitutions")[
  1. For $sqrt(a^2 - x^2)$, use $x = a sin(theta)$
  2. For $sqrt(a^2 + x^2)$, use $x = a tan(theta)$
  3. For $sqrt(x^2 - a^2)$, use $x = a sec(theta)$
]

#note("Why these choices work")[
  They are built to trigger the identities
  $ 1 - sin^2(theta) = cos^2(theta) $
  and
  $ 1 + tan^2(theta) = sec^2(theta) $
  so the square roots collapse nicely.
]

#example("A Trig Substitution with Extra Algebra")[
  Evaluate
  $ integral x^2/sqrt(9-x^2) d x $
  #solution("")[
    Since the root has the form $sqrt(9-x^2)$, let
    $ x = 3 sin(theta) $
    Then
    $ d x = 3 cos(theta) d theta $
    and
    $ sqrt(9-x^2) = 3 cos(theta) $

    Therefore
    $ integral x^2/sqrt(9-x^2) d x = integral 9 sin^2(theta)/(3 cos(theta)) dot 3 cos(theta) d theta $
    $ = 9 integral sin^2(theta) d theta $

    Use
    $ sin^2(theta) = (1-cos(2theta))/2 $
    so
    $ 9 integral sin^2(theta) d theta = 9/2 integral (1-cos(2theta)) d theta $
    $ = 9/2 theta - 9/4 sin(2theta) + C $

    Now
    $ theta = sin^(-1)(x/3) $
    and
    $ sin(2theta) = 2 sin(theta) cos(theta) = 2 dot x/3 dot sqrt(9-x^2)/3 $

    Thus
    $ integral x^2/sqrt(9-x^2) d x = 9/2 sin^(-1)(x/3) - x sqrt(9-x^2)/2 + C $
  ]
]
