#import "../../templates/templater.typ": *

= Hyperbolic functions
These are exponential functions wearing trigonometric clothes. Their formulas look familiar, but their geometry comes from hyperbolas rather than circles.

#definition("Hyperbolic Functions")[
  The two basic hyperbolic functions are
  $ sinh(x) = (e^x - e^(-x))/2 $
  and
  $ cosh(x) = (e^x + e^(-x))/2 $

  Also,
  $ tanh(x) = sinh(x)/cosh(x) $
]

#theorem("Basic Facts")[
  1. $ cosh^2(x) - sinh^2(x) = 1 $
  2. $ d/(d x) sinh(x) = cosh(x) $
  3. $ d/(d x) cosh(x) = sinh(x) $
  4. $ d/(d x) tanh(x) = 1/(cosh(x))^2 $
  #proof("Expand the exponential definitions")[
    Start with the identity :
    $ cosh^2(x) - sinh^2(x) = ((e^x + e^(-x))/2)^2 - ((e^x - e^(-x))/2)^2 $
    $ = (e^(2x) + 2 + e^(-2x) - e^(2x) + 2 - e^(-2x))/4 = 1 $

    For the derivatives,
    $ d/(d x) sinh(x) = d/(d x) (e^x - e^(-x))/2 = (e^x + e^(-x))/2 = cosh(x) $
    and
    $ d/(d x) cosh(x) = d/(d x) (e^x + e^(-x))/2 = (e^x - e^(-x))/2 = sinh(x) $

    Finally, use the quotient rule :
    $ d/(d x) tanh(x) = (cosh^2(x) - sinh^2(x))/cosh^2(x) = 1/(cosh(x))^2 $
  ]
]

#example("Differentiating a Product of Hyperbolic Functions")[
  Differentiate
  $ y = cosh(x^2) tanh(x) $
  #solution("")[
    Use the product rule :
    $ y' = d/(d x)(cosh(x^2)) tanh(x) + cosh(x^2) d/(d x)(tanh(x)) $

    Now apply the chain rule and the derivative formulas :
    $ d/(d x)(cosh(x^2)) = 2x sinh(x^2) $
    and
    $ d/(d x)(tanh(x)) = 1/(cosh(x))^2 $

    Therefore
    $ y' = 2x sinh(x^2) tanh(x) + cosh(x^2)/(cosh(x))^2 $
  ]
]
