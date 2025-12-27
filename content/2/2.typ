#import "../../templates/templater.typ": *

= Derivatives
As we did in the previous section, we can define derivatives using limits. 
#definition("The Derivative at a Point")[
  The derivative of the function $f(x)$ at the point $x = a$ is defined as:
  $ f'(a) = lim_(h->0) (f(a + h) - f(a)) / h $
  
  This limit represents the slope of the tangent line to the curve at the point $(a, f(a))$.
]

We can define a derivative on any point of a function as long as the limit exists.
#cartesian-canvas(
  size: (8, 6),
  x-domain: (0, 4),
  y-domain: (-2, 12),
  show-grid: true,
  // Graph of f(x) = x^2
  graph(x => x * x, domain: (0, 4)),
  // Tangent line at point P(1, 1)
  graph(x => 2 * (x - 1) + 1, domain: (0, 2), style: (stroke: red)),
  // Point P(1, 1)
  point(1, 1, label: $(1, 1)$), 
  //Tangent line at point P(2, 4)
  graph(x => 4 * (x - 2) + 4, domain: (1, 3), style: (stroke: green)),
  // Point P(2, 4)
  point(2, 4, label: $(2, 4)$),
  //Tangent line at point P(3, 9)
  graph(x => 6 * (x - 3) + 9, domain: (2, 4), style: (stroke: blue)), 
  // Point P(3, 9)
  point(3, 9, label: $(3, 9)$),
  
)

But, Are there functions that we can't define a derivative on? Yes! For example, consider the function $f(x) = |x|$ at the point $x = 0$.
#cartesian-canvas(
  size: (8, 6),
  x-domain: (-2, 2),
  y-domain: (-2, 2),
  show-grid: true,
  // Graph of f(x) = |x|
  graph(x => calc.abs(x), domain: (-2, 2)),
  // Point P(0, 0)
  point(0, 0, label: $(0, 0)$),
) 

Since there is a sharp corner at $x=0$, we cannot define a unique tangent line, and thus the derivative does not exist at that point.

#definition("Non-Differentiable Point")[
  A point $x = a$ is called a non-differentiable point of the function $f(x)$ if the derivative $f'(a)$ does not exist. The opposite is called a differentiable point, where the derivative does exist.

  We also call a function differentiable on an interval if it is differentiable at every point in an open interval.

  Then, what makes a function non-differentiable at a point? There are three common reasons:
  1. The function has a sharp corner or cusp at that point (like $f(x) = |x|$ at $x=0$).
  2. The function has a vertical tangent line at that point (like $f(x) = x^(1/3)$ at $x=0$).
  3. The function is not continuous at that point (like $f(x) = 1/x$ at $x=0$).
  #cartesian-canvas(
    size: (8, 6),
    x-domain: (-2, 2),
    y-domain: (-2, 2),
    show-grid: true,
    // Graph of f(x) = x^(1/3)
    graph(x => calc.root(x, 3), domain: (-2, 2)),
    // Point P(0, 0)
    point(0, 0, label: $(0, 0)$),
  )
]


= Other Notations
There are several notations for derivatives. The most common ones are:
- Lagrange's notation: $f'(x)$, $f''(x)$, $f'''(x)$ for the first, second, and third derivatives respectively.
- Leibniz's notation: In Leibniz's notation, the derivative of $y$ with respect to $x$ is denoted as
$ lr((d y)/(d x) |)_(x=a) "    or    " lr((d y)/(d x) ])_(x=a) $

We have noted earlier that if $f$ is differentiable at $x = a$, a limit at that point must exist, and also the function value must be defined at that point. This shows resemblance to the definition of continuity.
#theorem("Differentiability Implies Continuity")[
  If a function $f$ is differentiable at a point $x = a$, then it is also continuous at that point.
  #proof("")[
    Since $f$ is differentiable at $x = a$, the limit
    $ lim_(h->0) (f(a + h) - f(a)) / h $
    exists.

    This implies that
    $ lim_(h->0) (f(a + h) - f(a)) = 0 $
    because if the limit of the difference quotient exists, the numerator must approach zero as $h$ approaches zero.

    Therefore,
    $ lim_(h->0) f(a + h) = f(a) $
    which is the definition of continuity at the point $x = a$.
  ]
  #note("Converse")[
    The converse is not necessarily true; a function can be continuous at a point but not differentiable there. For example, the function $f(x) = |x|$ is continuous at $x = 0$ but not differentiable there.
  ]
]
= Higher Derivatives. 
Till now, we only dealt with the first derivative of a function. However, we can take derivatives of derivatives, leading to higher-order derivatives. The second derivative, denoted as $f''(x)$ or $(d^2 y)/(d x)^2$, represents the rate of change of the first derivative and provides information about the concavity of the function. Similarly, the third derivative, denoted as $f'''(x)$ or $(d^3 y)/(d x)^3$, represents the rate of change of the second derivative.

