#import "../../templates/templater.typ": *

= Inverse trigonometric functions
The ordinary trig functions repeat too much, so we restrict them first. After that, their inverses behave like normal functions and can be differentiated.

#definition("Inverse Sine and Inverse Tangent")[
  Restrict $sin$ to $[-pi/2, pi/2]$ and $tan$ to $(-pi/2, pi/2)$. Then :
  $ y = sin^(-1)(x) <==> sin(y) = x, quad y in [-pi/2, pi/2] $
  $ y = tan^(-1)(x) <==> tan(y) = x, quad y in (-pi/2, pi/2) $
  Similarly, $cos^(-1)(x)$ uses the restriction of $cos$ to $[0, pi]$.
]

#canvas.cartesian-canvas(
  size: (7, 5),
  x-domain: (-4, 4),
  y-domain: (-2, 2),
  y-tick: 0.5,
  graph.parametric(t => (calc.sin(t), t), domain: (-1.5707, 1.5707), label: $y = sin^(-1)(x)$),
  graph.parametric(t => (calc.tan(t), t), domain: (-1.32, 1.32), label: $y = tan^(-1)(x)$),
  graph.func(x => 1.5708, domain: (-4, 4), label: $y = pi/2$, style: (stroke: gray)),
  graph.func(x => -1.5708, domain: (-4, 4), style: (stroke: gray)),
)

#note("Read the picture")[
  $sin^(-1)$ lives only on $[-1,1]$ and exits vertically at the two endpoints, so its derivative must blow up there.
  $tan^(-1)$ accepts every real number, but its output is squeezed between the two gray lines $y = plus.minus pi/2$ : instant horizontal asymptotes.
]

#theorem("Derivative Formulae")[
  1. $ d/(d x) sin^(-1)(x) = 1/sqrt(1-x^2) $
  2. $ d/(d x) cos^(-1)(x) = -1/sqrt(1-x^2) $
  3. $ d/(d x) tan^(-1)(x) = 1/(1+x^2) $
  4. $ d/(d x) cot^(-1)(x) = -1/(1+x^2) $
  5. $ d/(d x) sec^(-1)(x) = 1/(x sqrt(x^2-1)) $ for the standard range choice
  6. $ d/(d x) csc^(-1)(x) = -1/(|x| sqrt(x^2-1)) $ with the range $[-pi/2, pi/2] without {0}$
  #proof("Use implicit differentiation")[
    Let
    $ y = sin^(-1)(x) $
    Then
    $ sin(y) = x $
    Differentiate :
    $ cos(y) d y/(d x) = 1 $
    so
    $ d y/(d x) = 1/cos(y) $
    Since $sin(y) = x$, we have
    $ cos(y) = sqrt(1-x^2) $
    on the principal interval, so
    $ d/(d x) sin^(-1)(x) = 1/sqrt(1-x^2) $

    If
    $ y = cos^(-1)(x) $
    then
    $ cos(y) = x $
    and differentiating gives
    $ -sin(y) d y/(d x) = 1 $
    Hence
    $ d y/(d x) = -1/sin(y) = -1/sqrt(1-x^2) $

    If
    $ y = tan^(-1)(x) $
    then
    $ tan(y) = x $
    so
    $ sec^2(y) d y/(d x) = 1 $
    Therefore
    $ d y/(d x) = 1/(sec^2(y)) = 1/(1+tan^2(y)) = 1/(1+x^2) $

    For the last one, suppose some authors define
    $ y = csc^(-1)(x) <==> csc(y) = x, quad y in [-pi/2, pi/2] - {0} $
    Differentiating $csc(y) = x$ :
    $ -csc(y) cot(y) d y/(d x) = 1 $
    so
    $ d y/(d x) = -1/(csc(y) cot(y)) $
    On this range, $cot(y) = plus.minus sqrt(csc^2(y) - 1)$ takes the sign of $y$ (hence of $x$), so $csc(y) cot(y) = |x| sqrt(x^2 - 1)$ and
    $ d/(d x) csc^(-1)(x) = -1/(|x| sqrt(x^2-1)) $
    valid for $|x| > 1$. The $sec^(-1)$ and $cot^(-1)$ formulas come from the same routine.
  ]
]

#example("Differentiating a Mixed Inverse-Trig Expression")[
  Differentiate
  $ y = x^2 tan^(-1)(x) + cos^(-1)(1-2x) $
  #solution("")[
    Use the product rule on the first part :
    $ d/(d x) [x^2 tan^(-1)(x)] = 2x tan^(-1)(x) + x^2/(1+x^2) $

    For the second part, use the chain rule :
    $ d/(d x) cos^(-1)(1-2x) = -1/sqrt(1-(1-2x)^2) dot (-2) $
    $ = 2/sqrt(1-(1-2x)^2) $

    Therefore
    $ y' = 2x tan^(-1)(x) + x^2/(1+x^2) + 2/sqrt(1-(1-2x)^2) $
  ]
]

#theorem("The Matching Integrals")[
  1. $ integral 1/sqrt(a^2-x^2) d x = sin^(-1)(x/a) + C $
  2. $ integral 1/(a^2+x^2) d x = 1/a tan^(-1)(x/a) + C $
]

#example("An Integral that Secretly Wants " + $sin^(-1)$)[
  Evaluate
  $ integral_0^((3sqrt(3))/2) 1/sqrt(9-x^2) d x $
  #solution("")[
    With $a = 3$,
    $ integral_0^((3sqrt(3))/2) 1/sqrt(9-x^2) d x = lr([ sin^(-1)(x/3) ])_0^((3sqrt(3))/2) $
    $ = sin^(-1)(sqrt(3)/2) - sin^(-1)(0) = pi/3 $
  ]
]

= A full sketch with an inverse trig function
#example("Sketching " + $y = sin^(-1)(2\/x)$)[
  Sketch the curve
  $ y = sin^(-1)(2/x) $
  domain, asymptotes, monotonicity, concavity and all.
  #solution("")[
    *Domain.* We need $|2/x| <= 1$, that is $|x| >= 2$ : two separate branches.

    *Endpoints and asymptotes.* At $x = 2$, $y = sin^(-1)(1) = pi/2$ ; at $x = -2$, $y = -pi/2$.
    As $x -> plus.minus infinity$, $2/x -> 0$, so $y -> 0$ : the $x$-axis is a horizontal asymptote on both sides. There is no intercept, since $2/x$ never equals $0$.

    *Monotonicity.* By the chain rule, for $|x| > 2$,
    $ y' = 1/sqrt(1-(2/x)^2) dot (-2/x^2) = -2/(|x| sqrt(x^2-4)) $
    which is negative on both branches : each branch falls.

    *Concavity.* On $(2, infinity)$,
    $ y' = -2/(x sqrt(x^2-4)) $
    and differentiating gives
    $ y'' = (2(2x^2-4))/(x^2 (x^2-4)^(3/2)) > 0 $
    so the right branch is concave up. The function is odd, so the left branch is concave down. At $x = plus.minus 2$ the derivative blows up : the curve leaves its endpoints vertically.

    #canvas.cartesian-canvas(
      size: (8, 4.5),
      x-domain: (-10, 10),
      y-domain: (-2, 2),
      x-tick: 2,
      y-tick: 0.5,
      graph.parametric(t => (2 / calc.sin(t), t), domain: (0.21, 1.5707), label: $y = sin^(-1)(2/x)$),
      graph.parametric(t => (2 / calc.sin(t), t), domain: (-1.5707, -0.21)),
      graph.point(2, 1.5708, label: ""),
      graph.point(-2, -1.5708, label: ""),
    )
  ]
]
