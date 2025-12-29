#import "../../templates/templater.typ": *

= Implicit Function Differentiation
Implicit functions are functions that dont take the form of $y=f(x)$. Some examples include $x^2 + y^2 = 1$ and $x^2/4 - y^2/9 = 1$.


How do we find the drerivative of these functions? We can use a very cool method called *Implicit Differentiation*.

#definition("Implicit Differentiation")[
  Implicit Differentatiation means to take $d/(d x)$ of both sides in order to relieve the final result in the form of $(d y)/(d x)$.
]

#example("Implicit Differentiation")[
  Find $(d y)/(d x)$ if $x^2 + y^2 = 25$. Then find the equation of the tangent to the circle $x^2 + y^2 = 25$ at point $(3,4)$.
  #solution("")[
    Take $d/(d x)$ on both sides.
    $ d/(d x)(x^2 + y^2) = d/(d x) 25 $
    $ d/(d x)x^2 + d/(d x) y^2 = 0 $
    Since $y$ is a function of $x$, we can use the chain rule.
    $ 2x + 2y(d y)/(d x) = 0 $
    $ (d y)/(d x) = -x/y $
    Therefore, at the point $(3,4)$, we get $(d y)/(d x) = -3/4$.

  ]


]

= Second derivatives
#example("Second Derivative of Implicit Functions")[
  Find $y''$ if $x^4 + y^4 = 16$.
  #solution("")[
    Differentiate once to get $4x^3 + 4y^3y' = 0$.
    Solving for $y'$ gives $y' = -x^3/y^3$.
    Differentiate again to get
    $ y'' = d/(d x) (-x^3/y^3) = -(y^3d/(d x)x^3 - x^3 d/(d x) y^3)/y^6 $
    $ = -(y^3 dot 3x^2 - x^3 dot 3y^2y')/y^6 $
    this can be simplified into
    $ y'' = -48 x^2/y^7 $

  ]
]
