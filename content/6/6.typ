#import "../../templates/templater.typ": *

= Inverse trigonometric functions
The ordinary trig functions repeat too much, so we restrict them first. After that, their inverses behave like normal functions and can be differentiated.

#definition("Inverse Trigonometric Functions")[
  The most common inverse trigonometric functions are
  $ sin^(-1)(x), cos^(-1)(x), tan^(-1)(x) $
]

#theorem("Derivative Formulae")[
  1. $ d/(d x) sin^(-1)(x) = 1/sqrt(1-x^2) $
  2. $ d/(d x) cos^(-1)(x) = -1/sqrt(1-x^2) $
  3. $ d/(d x) tan^(-1)(x) = 1/(1+x^2) $
  #proof("Use implicit differentiation")[
    Let
    $ y = sin^(-1)(x) $
    Then
    $ sin(y) = x $
    Differentiate :
    $ cos(y) d y/(d x) = 1 $
    so
    $ d y/(d x) = 1/cos(y) $
    Since $sin(y) = x$, we have
    $ cos(y) = sqrt(1-x^2) $
    on the principal interval, so
    $ d/(d x) sin^(-1)(x) = 1/sqrt(1-x^2) $

    If
    $ y = cos^(-1)(x) $
    then
    $ cos(y) = x $
    and differentiating gives
    $ -sin(y) d y/(d x) = 1 $
    Hence
    $ d y/(d x) = -1/sin(y) = -1/sqrt(1-x^2) $

    If
    $ y = tan^(-1)(x) $
    then
    $ tan(y) = x $
    so
    $ sec^2(y) d y/(d x) = 1 $
    Therefore
    $ d y/(d x) = 1/sec^2(y) = 1/(1+tan^2(y)) = 1/(1+x^2) $
  ]
]

#example("Differentiating a Mixed Inverse-Trig Expression")[
  Differentiate
  $ y = x^2 tan^(-1)(x) + cos^(-1)(1-2x) $
  #solution("")[
    Use the product rule on the first part :
    $ d/(d x) [x^2 tan^(-1)(x)] = 2x tan^(-1)(x) + x^2/(1+x^2) $

    For the second part, use the chain rule :
    $ d/(d x) cos^(-1)(1-2x) = -1/sqrt(1-(1-2x)^2) dot (-2) $
    $ = 2/sqrt(1-(1-2x)^2) $

    Therefore
    $ y' = 2x tan^(-1)(x) + x^2/(1+x^2) + 2/sqrt(1-(1-2x)^2) $
  ]
]
