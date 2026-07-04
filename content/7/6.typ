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

#example("A Classical Nonelementary Integral")[
  Consider
  $ integral e^(-x^2) d x $
  #solution("")[
    This integral has no elementary antiderivative.
    So a definite value is usually found with technology or by defining a special function.

    For instance,
    $ integral_0^1 e^(-x^2) d x approx 0.7468 $

    Another well-known example is
    $ integral_0^1 sin(x^2) d x approx 0.3103 $
    which also has no elementary antiderivative.
  ]
]

#note("What the student should learn here")[
  The goal is not to force every integral into hand computation. The goal is to recognize when the hand computation is over.
]
