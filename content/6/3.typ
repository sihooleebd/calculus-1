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

#canvas.cartesian-canvas(
  size: (7, 7),
  x-domain: (-4, 4),
  y-domain: (-4, 4),
  graph.graph(x => calc.exp(x), domain: (-4, 1.35), label: $y = e^x$),
  graph.graph(x => calc.ln(x), domain: (0.03, 4), label: $y = ln(x)$),
  graph.func(x => x, domain: (-4, 4), label: $y = x$, style: (stroke: gray)),
)

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

= A full portrait : the logistic curve
Here is a function built entirely out of $e^x$ that shows up everywhere, from probability to machine learning. Sketching it uses every tool from chapter 3 at once.

#example("Sketching " + $y = e^x/(1+e^x)$)[
  In a game without ties, let $x$ be the natural logarithm of the *odds*, that is, the probability of winning divided by the probability of losing. Solving for the probability $p$ in terms of $x$ gives
  $ p(x) = e^x/(1+e^x) $
  Sketch the graph of $y = p(x)$ : asymptotes, intercepts, monotonicity, and concavity.
  #solution("")[
    *Domain and intercepts.* The denominator is never zero, so the domain is all of $RR$, and
    $ p(0) = 1/2 $
    The function is always strictly between $0$ and $1$, which is a sanity check, since it is supposed to be a probability.

    *Asymptotes.* As $x -> infinity$, divide top and bottom by $e^x$ :
    $ p(x) = 1/(e^(-x) + 1) -> 1 $
    As $x -> -infinity$, $e^x -> 0$, so $p(x) -> 0$.
    Horizontal asymptotes : $y = 0$ and $y = 1$.

    *Monotonicity.* By the quotient rule,
    $ p'(x) = (e^x (1+e^x) - e^x dot e^x)/(1+e^x)^2 = e^x/(1+e^x)^2 > 0 $
    so $p$ is increasing everywhere : better log-odds always means better probability.

    *Concavity.* Write $p'(x) = e^x (1+e^x)^(-2)$ and differentiate :
    $ p''(x) = e^x (1+e^x)^(-2) - 2 e^(2x) (1+e^x)^(-3) $
    $ = (e^x (1 - e^x))/(1+e^x)^3 $
    So $p'' > 0$ for $x < 0$ and $p'' < 0$ for $x > 0$ : concave up, then concave down, with an inflection point at $(0, 1/2)$, exactly where the game is fair.

    #canvas.cartesian-canvas(
      size: (8, 4),
      x-domain: (-5, 5),
      y-domain: (-0.3, 1.3),
      y-tick: 0.5,
      graph.graph(x => calc.exp(x) / (1 + calc.exp(x)), domain: (-5, 5), label: $y = e^x/(1+e^x)$),
      graph.func(x => 1, domain: (-5, 5), label: $y = 1$, style: (stroke: gray)),
      graph.point(0, 0.5, label: ""),
    )
  ]
]
