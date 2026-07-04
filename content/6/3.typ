#import "../../templates/templater.typ": *

= The natural exponential function
Since $ln(x)$ is increasing, it has an inverse. That inverse is the function $e^x$, and almost everything about it can be read off from the fact that it undoes $ln(x)$.

#definition("Natural Exponential Function")[
  The inverse of $ln(x)$ is denoted by $e^x$.
  So
  $ e^(ln(x)) = x " for " x > 0 $
  and
  $ ln(e^x) = x $
]

#theorem("Properties of " + $e^x$)[
  1. $ e^0 = 1 $
  2. $ e^(x+y) = e^x e^y $
  3. $ e^(x-y) = e^x / e^y $
  4. $ d/(d x) e^x = e^x $
  5. $ integral e^x d x = e^x + C $
  #proof("Use the inverse relationship with " + $ln(x)$)[
    Since $ln(1) = 0$, applying the inverse function gives
    $ e^0 = 1 $

    For the product law, compare the logarithms of both sides :
    $ ln(e^(x+y)) = x + y $
    and
    $ ln(e^x e^y) = ln(e^x) + ln(e^y) = x + y $
    Since $ln(x)$ is one-to-one,
    $ e^(x+y) = e^x e^y $

    Then
    $ e^(x-y) e^y = e^x $
    so
    $ e^(x-y) = e^x / e^y $

    For the derivative, let
    $ y = e^x $
    Then
    $ x = ln(y) $
    Differentiate :
    $ 1 = 1/y d y/(d x) $
    Hence
    $ d y/(d x) = y = e^x $

    The integral formula follows immediately because a function whose derivative is $e^x$ is itself $e^x$.
  ]
]

#example("Solving an Exponential Equation with a Hidden Quadratic")[
  Solve
  $ e^(2x) - 5e^x + 4 = 0 $
  #solution("")[
    Let
    $ u = e^x $
    Then the equation becomes
    $ u^2 - 5u + 4 = 0 $
    so
    $ (u-1)(u-4) = 0 $

    Therefore
    $ u = 1 " or " u = 4 $
    which means
    $ e^x = 1 " or " e^x = 4 $

    Hence
    $ x = 0 " or " x = ln(4) $
  ]
]

#example("Differentiating a Product with an Exponential Core")[
  Differentiate
  $ y = (x^2 + 1)e^(x^3) $
  #solution("")[
    Use the product rule and the chain rule :
    $ y' = 2x e^(x^3) + (x^2 + 1)e^(x^3) dot 3x^2 $
    $ = e^(x^3) lr([ 2x + 3x^2(x^2 + 1) ]) $
  ]
]
