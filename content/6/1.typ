#import "../../templates/templater.typ": *

= Inverse functions and their derivatives
An inverse function undoes what the original function does. The key picture is reflection across the line $y = x$, but we still need the derivative formula in actual symbols.

#definition("Inverse Function")[
  A function $f$ has an inverse if it is one-to-one. Its inverse is written $f^(-1)$ and satisfies
  $ f(f^(-1)(x)) = x $
  and
  $ f^(-1)(f(x)) = x $
]

#note("What should we visualize?")[
  The graph of $f^(-1)$ is the reflection of the graph of $f$ across the line $y = x$. So a steep graph turns into a shallow one, which is exactly why the derivative gets inverted.
]

#theorem("Derivative of an Inverse Function")[
  If $f$ is differentiable and one-to-one, and if $f'(f^(-1)(a)) != 0$, then
  $ (f^(-1))'(a) = 1/(f'(f^(-1)(a))) $
  #proof("Differentiate the identity")[
    Let
    $ y = f^(-1)(x) $
    Then
    $ f(y) = x $

    Differentiate both sides with respect to $x$ :
    $ f'(y) d y/(d x) = 1 $
    Therefore
    $ d y/(d x) = 1/(f'(y)) $

    Since $y = f^(-1)(x)$, we get
    $ (f^(-1))'(x) = 1/(f'(f^(-1)(x))) $
    Replacing $x$ by $a$ gives the formula.
  ]
]

#example("Derivative of an Inverse at a Hidden Point")[
  Let
  $ f(x) = x^5 + x + 1 $
  Find $(f^(-1))'(3)$.
  #solution("")[
    We first need the point on the original graph that maps to $3$.
    Since
    $ f(1) = 1^5 + 1 + 1 = 3 $
    we know
    $ f^(-1)(3) = 1 $

    Also,
    $ f'(x) = 5x^4 + 1 $
    so
    $ f'(1) = 6 $

    Therefore
    $ (f^(-1))'(3) = 1/6 $
  ]
]
