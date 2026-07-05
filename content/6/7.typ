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

#canvas.cartesian-canvas(
  size: (8, 5.5),
  x-domain: (-3, 3),
  y-domain: (-4, 4),
  graph.graph(x => (calc.exp(x) - calc.exp(-x)) / 2, domain: (-2.05, 2.05), label: $sinh(x)$),
  graph.graph(x => (calc.exp(x) + calc.exp(-x)) / 2, domain: (-2.05, 2.05), label: $cosh(x)$),
  graph.graph(x => (calc.exp(x) - calc.exp(-x)) / (calc.exp(x) + calc.exp(-x)), domain: (-3, 3), label: $tanh(x)$),
)

#note("Three personalities")[
  $sinh$ is odd and races off like $e^x/2$. $cosh$ is even, never smaller than $1$, and is the exact shape of a hanging chain (a *catenary*). $tanh$ is the tame one : squeezed between $-1$ and $1$, it is a smooth switch function.
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
    $ d/(d x) tanh(x) = (cosh^2(x) - sinh^2(x))/(cosh^2(x)) = 1/(cosh(x))^2 $
  ]
]

= Why "hyperbolic"?
The identity $cosh^2(t) - sinh^2(t) = 1$ says that the point $(cosh(t), sinh(t))$ always sits on the unit hyperbola $x^2 - y^2 = 1$, just as $(cos(t), sin(t))$ sits on the unit circle. But $t$ is *not* an angle here. So what is it?

#canvas.cartesian-canvas(
  size: (7, 6),
  x-domain: (-0.7, 3),
  y-domain: (-1.6, 1.6),
  y-tick: 0.5,
  graph.parametric(t => ((calc.exp(t) + calc.exp(-t)) / 2, (calc.exp(t) - calc.exp(-t)) / 2), domain: (-1.23, 1.23), label: $x^2 - y^2 = 1$),
  shape.segment(graph.point(0, 0), graph.point(1.543, 1.175), style: (stroke: gray)),
  graph.point(1.543, 1.175, label: $P(cosh(t), sinh(t))$),
  graph.point(1, 0, label: ""),
)

#example("The Area of a Hyperbolic Sector")[
  Let $P = (cosh(t), sinh(t))$ with $t > 0$ be a point on the hyperbola $x^2 - y^2 = 1$. Show that the area $A(t)$ of the "hyperbolic sector" (the region bounded by the segment $O P$, the arc of the hyperbola from $P$ down to the vertex $(1,0)$, and the $x$-axis) is
  $ A(t) = t/2 $
  #solution("")[
    Write the sector as a triangle minus the sliver under the hyperbola :
    $ A(t) = 1/2 cosh(t) sinh(t) - integral_1^(cosh(t)) sqrt(x^2 - 1) d x $

    Instead of computing the ugly integral, differentiate with respect to $t$. The first term gives
    $ 1/2 (sinh^2(t) + cosh^2(t)) $
    For the integral, the Fundamental Theorem Part I plus the chain rule (moving bound $cosh(t)$) gives
    $ sqrt(cosh^2(t) - 1) dot sinh(t) = sinh^2(t) $

    Therefore
    $ A'(t) = 1/2 (sinh^2(t) + cosh^2(t)) - sinh^2(t) = 1/2 (cosh^2(t) - sinh^2(t)) = 1/2 $

    Since $A(0) = 0$ and $A' equiv 1/2$,
    $ A(t) = t/2 $
    So $t$ measures *twice the sector area*, precisely the same statement that holds for the angle on the unit circle. That is the sense in which $sinh$ and $cosh$ deserve their names.
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

= The reciprocal trio
#definition("Reciprocal Hyperbolic Functions")[
  $ "sech"(x) = 1/cosh(x), quad "csch"(x) = 1/sinh(x), quad coth(x) = cosh(x)/sinh(x) $
]

#example("Sketching " + $y = "sech"(x)$)[
  Sketch the graph of $y = "sech"(x)$ by verifying its local extrema, concavity, inflection points, and asymptotes.
  #solution("")[
    *Domain and symmetry.* Since $cosh(x) >= 1$ everywhere, $"sech"$ is defined on all of $RR$, satisfies $0 < "sech"(x) <= 1$, and is even.

    *Asymptotes.* As $x -> plus.minus infinity$, $cosh(x) -> infinity$, so $"sech"(x) -> 0$ : the $x$-axis is a two-sided horizontal asymptote.

    *Extrema.* Differentiate :
    $ d/(d x) "sech"(x) = -("sinh"(x))/(cosh^2(x)) = -"sech"(x) tanh(x) $
    This is positive for $x < 0$ and negative for $x > 0$, so the only critical point $x = 0$ is a global maximum, with value
    $ "sech"(0) = 1 $

    *Concavity.* Differentiating once more (product rule on $-"sech" tanh$) :
    $ d^2/(d x^2) "sech"(x) = "sech"(x) lr([ tanh^2(x) - "sech"^2(x) ]) $
    The sign is decided by $tanh^2(x) - "sech"^2(x)$, i.e. by $sinh^2(x) - 1$ after multiplying through by $cosh^2(x)$. So the inflection points solve
    $ sinh(x) = plus.minus 1 $
    that is
    $ x = plus.minus sinh^(-1)(1) = plus.minus ln(1 + sqrt(2)) $
    using the logarithm formula proven below. At these points $cosh^2(x) = 1 + sinh^2(x) = 2$, so the height is exactly $1/sqrt(2)$.

    The curve is concave down on the middle interval and concave up on the two tails : a smooth, symmetric bump often mistaken for the bell curve $e^(-x^2)$, though its tails die exponentially rather than super-exponentially.

    #canvas.cartesian-canvas(
      size: (8, 4),
      x-domain: (-4, 4),
      y-domain: (-0.3, 1.3),
      y-tick: 0.5,
      graph.graph(x => 2 / (calc.exp(x) + calc.exp(-x)), domain: (-4, 4), label: $y = "sech"(x)$),
      graph.point(0, 1, label: ""),
      graph.point(0.8814, 0.7071, label: ""),
      graph.point(-0.8814, 0.7071, label: ""),
    )
  ]
]

= Inverse hyperbolic functions
Since $sinh$ is increasing on all of $RR$, it has a global inverse ; $cosh$ needs the usual restriction to $[0, infinity)$. Because the originals are built from $e^x$, the inverses can be written with logarithms, so no new functions are required.

#theorem("Logarithm Formulas for the Inverses")[
  1. $ sinh^(-1)(x) = ln(x + sqrt(x^2+1)) $ for all $x$
  2. $ cosh^(-1)(x) = ln(x + sqrt(x^2-1)) $ for $x >= 1$
  3. $ tanh^(-1)(x) = 1/2 ln((1+x)/(1-x)) $ for $|x| < 1$
  #proof("Solve a quadratic in " + $e^y$)[
    Let $y = sinh^(-1)(x)$, so
    $ x = (e^y - e^(-y))/2 $
    Multiply by $2e^y$ :
    $ e^(2y) - 2x e^y - 1 = 0 $
    This is a quadratic in $e^y$, so
    $ e^y = x plus.minus sqrt(x^2+1) $
    Since $e^y > 0$ we must take the $+$ sign, and taking logarithms gives
    $ y = ln(x + sqrt(x^2+1)) $
    The other two formulas come from the same trick applied to their definitions.
  ]
]

#theorem("Derivatives of the Inverses")[
  1. $ d/(d x) sinh^(-1)(x) = 1/sqrt(x^2+1) $
  2. $ d/(d x) cosh^(-1)(x) = 1/sqrt(x^2-1) $
  3. $ d/(d x) tanh^(-1)(x) = 1/(1-x^2) $
  #proof("Differentiate the logarithm formula")[
    For the first,
    $ d/(d x) ln(x + sqrt(x^2+1)) = (1 + x/sqrt(x^2+1))/(x + sqrt(x^2+1)) $
    $ = ((sqrt(x^2+1) + x)/sqrt(x^2+1))/(x + sqrt(x^2+1)) = 1/sqrt(x^2+1) $
    The others are identical exercises.
  ]
]
