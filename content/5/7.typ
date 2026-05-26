#import "../../templates/templater.typ": *

#definition()[
  $
    sinh x = (e^x - e^(-x))/2 wide &csch x = 1/(sinh x) \
    cosh x = (e^x + e^(-x))/2 wide &sech x = 1/(cosh x) \
    tanh x = (sinh x)/(cosh x) = (e^x - e^(-x))/(e^x + e^(-x)) wide &coth x = 1/(tanh x)
  $
]

Not periodic.

#theorem("Identities")[

]

#example()[
  If $tanh x = 12/ 13$, find the values of the other hyperbolic functions at $x$.

  #note("Hint")[
    There are two natural approaches.

    First, obtain $sinh x$ via $1 - tanh sr x = sech sr x$. Then find $cosh x$ and $sinh x$.

    Second, rewrite
  ]
]

Hyperbolic funcitons are parameterization of hyperbola $x sr - y sr = 1$. point $P = (cosh t, sinh t)$  lies on the right branch of the hyperbola. This is analogous to the circle and trig funcitons. However, in the hyperbolic case, $t$ is not an angle. Instead, it again represents *twice the area* of the corresponding hyperbolic sector.

Let $P = (cosh t, sinh t)$, where $t>0$

#theorem("Table of Derivatives of Hyperbolic Functions")[
  $
    d/dx(sinh x) = cosh x wide &d/dx(csch x) = -coth x csch x \
    d/dx
  $
  #proof[
    by definition.
  ]
]

The functions $sinh x$ and $tanh x$ are one-to-one functions, so they have inverse functions $sinh invs x$ and $tanh invs x$.

#definition("Closed form of hyperbolic inverse")
#theorem("Derivatives of inverse hyperbolic funtions.")
