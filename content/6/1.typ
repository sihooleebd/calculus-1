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

#canvas.cartesian-canvas(
  size: (7, 7),
  x-domain: (-3, 3),
  y-domain: (-3, 3),
  graph.graph(x => x * x * x * x * x + x + 1, domain: (-1.2, 1), label: $f$),
  graph.parametric(t => (t * t * t * t * t + t + 1, t), domain: (-1.2, 1), label: $f^(-1)$),
  graph.func(x => x, domain: (-3, 3), label: $y = x$, style: (stroke: gray)),
)

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

#example("An Inverse of an Accumulation Function")[
  Let
  $ f(x) = integral_3^x sqrt(1 + t^4) d t $
  for $x in RR$. Find $(f^(-1))'(0)$.
  #solution("")[
    The integrand $sqrt(1+t^4)$ is always positive, so $f$ is strictly increasing and really does have an inverse.

    Where does $f$ take the value $0$? An accumulation function vanishes at its own starting line :
    $ f(3) = integral_3^3 sqrt(1+t^4) d t = 0 $
    so
    $ f^(-1)(0) = 3 $

    By the Fundamental Theorem of Calculus Part I,
    $ f'(x) = sqrt(1 + x^4) $
    hence
    $ f'(3) = sqrt(1 + 81) = sqrt(82) $

    Therefore
    $ (f^(-1))'(0) = 1/sqrt(82) $
    We never needed a formula for $f$ itself, only its derivative and one special point.
  ]
]

#example("The Second Derivative of an Inverse")[
  Let $f$ be one-to-one with a continuous second derivative, and suppose $f'(x) != 0$ on its domain. Writing $g = f^(-1)$, show that
  $ g''(x) = - (f''(g(x)))/((f'(g(x)))^3) $
  #solution("")[
    Start from the first-derivative formula :
    $ g'(x) = 1/(f'(g(x))) $

    Differentiate both sides with the chain rule and the reciprocal rule :
    $ g''(x) = - (f''(g(x)) dot g'(x))/((f'(g(x)))^2) $

    Now substitute $g'(x) = 1\/f'(g(x))$ once more :
    $ g''(x) = - (f''(g(x)))/((f'(g(x)))^3) $

    Read the sign : if $f$ is increasing ($f' > 0$) and concave upward ($f'' > 0$), the formula forces $g'' < 0$, so the inverse is concave *downward*. Reflection across $y = x$ flips concavity for increasing functions, and now we have proved it, not just stared at it.
  ]
]
