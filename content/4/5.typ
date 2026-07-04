#import "../../templates/templater.typ": *

= The substitution rule
The chain rule told us what happens when functions are nested. Substitution is what happens when we reverse that nesting during integration.

#definition("Substitution Rule")[
  If $u = g(x)$ and $d u = g'(x) d x$, then
  $ integral f(g(x)) g'(x) d x = integral f(u) d u $

  For definite integrals, we also change the bounds :
  $ integral_a^b f(g(x)) g'(x) d x = integral_(g(a))^(g(b)) f(u) d u $
]

#note("What should we try to see?")[
  Look for an *outside function* and an *inside function*. If some derivative of the inside piece is sitting nearby, substitution is usually the right picture.
]

#example("A Power hiding inside another power")[
  Evaluate
  $ integral x^3 sqrt(x^4 + 1) d x $
  #solution("")[
    The inner expression is
    $ x^4 + 1 $
    and its derivative is
    $ 4x^3 $
    which is almost sitting there already.

    Let
    $ u = x^4 + 1 $
    Then
    $ d u = 4x^3 d x $
    so
    $ x^3 d x = 1/4 d u $

    Therefore
    $ integral x^3 sqrt(x^4 + 1) d x = 1/4 integral u^(1/2) d u $
    $ = 1/4 dot 2/3 u^(3/2) + C $
    $ = 1/6 (x^4 + 1)^(3/2) + C $
  ]
]

#example("Substitution with Trigonometric Bounds")[
  Evaluate
  $ integral_0^(pi/4) sin(2x)/(1 + cos^2(2x)) d x $
  #solution("")[
    Here the inside function is
    $ cos(2x) $
    because its derivative gives a multiple of $sin(2x)$.

    Let
    $ u = cos(2x) $
    Then
    $ d u = -2 sin(2x) d x $
    so
    $ sin(2x) d x = -1/2 d u $

    Change the bounds :
    If $x = 0$, then $u = 1$.
    If $x = pi/4$, then $u = 0$.

    Therefore
    $ integral_0^(pi/4) sin(2x)/(1 + cos^2(2x)) d x = -1/2 integral_1^0 1/(1+u^2) d u $
    $ = 1/2 integral_0^1 1/(1+u^2) d u $
    $ = 1/2 [ tan^(-1)(u) ]_0^1 = 1/2 dot pi/4 = pi/8 $
  ]
]
