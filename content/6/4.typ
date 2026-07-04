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
