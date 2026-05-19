#import "../../templates/templater.typ": *

#definition()[
  Recalll that the derivative of $f$ at a number $a$ is defined (when the limit exists)
  $ f'(a) = lim_(h -> 0) (f(a+h)-f(a))/h $
  Since $a$ is arbitrary, we may replace $a$ by $x$ and obtain a new function
  $ f'(x) = lim_(h->0) (f(x+h)-f(x))/h lim_(t->x) (f(t)-f(x))(t-x) $
  called the *derivative* of $f$.
]

To plot a graph of $f'(x)$, estimate the slope of the tangent line to the graph of $f$ at suveral values of $x$.

#image("../images/derivative_fig2")

#example()[
  If $f(x) = sq(x)$, find the derivative of $f$. State the domain of $f'$
  #solution()[
    $
      f'(x) &= lim_(h->0) (sq(x+h) - sq(x))/h \
      &= lim_(h->0) h/(h(sq(x+h)+sq(x))) \
      &= lim_(h->0) 1/(sq(x+h)+sq(x))
      = 1/(2sq(x))
    $
    The domain has changed.
  ]
]

#definition()[
  A function f is *differentiable* at a if $f'(a)$ exists. It is differentiable on an open interval $(a,b)$ if it is differentiable at every number in the interval.
]

#notation()[
  If $y=f(x)$, the derivative of f may be written as:
  $ f'(x) = y' = (d y)/(d x) = (d f)/(d y) = d/(d x) f(x) = D f(x) = D_x f(x) $
  The symbols $D$ and $d/(d x)$ are called *differentiation operators*, and they denote the operation of differentiation.

  #note()[
    Usually, the term _operator_ is regarded as a higher order function, that takes another functions as input or output.
  ]

  #note("Warning")[
    The notation $(d y)/(d x)$ introduced by Leibniz, *_should not be regarded as a ratio_*. It is simply another notation for $f'(x)$
  ]
]

#notation()[
  In Leibniz notation, the value of the derivative at $x=a$, we write
  $ (d y)/(d x)bar_(x=a) wide (d y)/(d x)]_(x=a) $
]

#theorem()[
  If $f$ is differentiable at a, then f is continuous at a.
  #proof()[
    $ limx(a) f(x) &= limx(a) [(f(x)-f(a))/(x-a) (x-a) + f(a)] \ &= limx(a) (f(x)-f(a))/(x-a) dot limx(a) (x-a) + f(a) \ &= f'(a) dot 0 + f(a) = 0 $

    The converse of the theorem is false. $abs(x)$ is an example.

    Weierstrass function. Continuous everywhere but differentiable nowhere.
  ]
]

#definition()[
  The *Second derivative(이계도함수)* of f is the derivative of $f'$:
  $ f''(x) = (f')'(x) = d/(d x) ((d y)/(d x)) = (d sr y)/(d x sr) $
  The *Third derivative* of f is the derivative of $f''$:
  $ f'''(x) = (f'')'(x) = d/(d x) (d/(d x) ((d y)/(d x))) = (d cb y)/(d x cb) $
  The *nth derivative * of f is denoted by
  $ f^((n))(x) = (d^n y)/(d y^n) $
]

If the function denotes the position of an object for given time, its derivative is velocity, second derivative is acceleration, and third derivative is _jerk_(?).

#pagebreak()

= How can a function fail to be differentiable?

== Corner of kink

If the graph of f has a corner or kink at $x=a$, then the tangent line do not exist.
#figure(image("../images/2_2_corner", width: 30%))

== Discontinuity.
If f is not contiuous at $x=a$, then the tangent line do not exist.
#figure(image("../images/2_2_discontinuity", width: 30%))

== Vertical tangent
If the tangent line is vertical, its slope does not exist.
#figure(image("../images/2_2_vertical", width: 30%))

= One-Sided Derivatives

#definition()[
  The *left-handed derivatives* of f at a point is defined by
  $ f'_- (a) = lim_(h->0^-) (f(a+h)-f(a))/h $
  Simillar to right handed derivatives.
]
