#import "../../templates/templater.typ": *

To define inverse trigonometric functions, we need to restrict the domains of the trigonometric functions so that they become one-to-one. For the sine function, we use $[-pi/2, pi/2]$, where sine is one-to-one.

#cartesian-canvas(
  x-domain: (-3, 3),
  y-domain: (-1.5, 1.5),
  size: (4, 2),
  graph(calc.sin, domain: (-calc.pi / 2, calc.pi / 2))
)

#definition[
  The *inverse sine function* is obtained by finding an inverse for that fraction of the sine funciton above.
  $ y = sin invs x <==> x = sin y $
  This inverse sine function is also called *arcsine*, denoted by *$arcsin$*.
]

For the tangent function, we use $[-pi/2, pi/2]$ as well.
#cartesian-canvas(
  y-domain: (-3, 3),
  x-domain: (-1.5, 1.5),
  size: (2, 4),
  graph(calc.tan, domain: (-calc.pi / 2, calc.pi / 2))
)


#definition[
  The *inverse tangent function* is obtained by finding an inverse for that fraction of the sine funciton above.
  $ y = tan invs x <==> x = tan y $
  This inverse tangent function is also called *arctangent*, denoted by *$arctan$*.
]

#cartesian-canvas(
  x-domain: (-3, 3),
  y-domain: (-1.5, 1.5),
  size: (4, 2),
//  graph(x => calc.atan(x), adaptive: false)
)

= Differentiation

For $x in (-1,1)$, we have $y=sin invs x in (-pi/2, pi/2)$, so
$ d/dy sin y = cos y != 0 $
Hence, the Inverse Function Theorem guarantees that $sin invs x$ is differentiable on $(-1, 1)$.

We now derive the derivative by implicit differentiation. Let $y=sin invs x $ for $x in (-1, 1)$. Then $sin y = x$ and $y in (-pi/2, pi/2)$. Differentiating implicitly with respect to $x$, we get
$ cos y dy/dx = 1 ==> dy/dx = 1/(cos y), wide -pi/2<=y<=pi/2 $
Since $y in (-pi/2, pi/2)$, we have $cos y >= 0$. Therefore,
$ cos y = sq(1- sin sr y) = sq(1- x sr) $
#theorem([$sin invs$ Differentiation & Integration])[
  Hence,
  $ d/dx sin invs x = 1/(sq(1-x sr)), wide -1<x<1 $.
  Also,
  $ int 1/sq(1-x sr) dx = sin invs x + C $
]

#example()[
  Let $f(x) = sin invs (1 - x sr)$. Find
  #solution()[
    F
  ]
]

For $x in RR$, we have $y = tan invs x in (-pi/2, pi/2)$. Since

The remaining inverse trig functions are used less frequently and are summarized as follows

$
  y = csc invs x, abs(x) >= 1 &<==> csc y = x, quad &y in (0,pi/2] union
$

#example()[
  Prove the identity
  $ tan invs x + cot invs x = pi/2 $
  #solution()[
    Intuitively, each term is two angle of the right triangle. Geographically, since the sum of three angles of the triangle is $180 degree$, it should be $90 degree = pi/2$.
  ]
  #solution()[
    $ tan invs x + cot invs x = pi/2 $
    Let $f(x) = tan invs x + cot invs x$. Then,
  ]
]

#example()[
  Find $display(int x/(x^4+9)dx)$.
  #solution()[
    Substitution Method:

    Let $u = x sr$. Then $du = 2x dx$, so
    $ int x/(x^4+9) dx = 1/2 int 1/(u sr + 9) du = 1/2 dot 1/9 dot int 1/((u/3) sr + 1) du $

    Now let $t=u/3$. Then $du = 3dt$. Therefore,
    $ 1/18 int 1/((u/3)sr + 1) du = 1/6 int 1/(t sr + 1) dt = 1/6 tan invs t + C. $
    Substituting back $t=u/3 = (x sr) / 3$, we get
    $ therefore 1/6 tan invs (x sr)/3 +C $
  ]
]
#note[
  If there is something big squared plus a constant, you should think of $arctan$.
]

#example()[
  Prove that, for $xy != 1$,
  $ arctan x + arctan y = arctan(x+y)/(1-xy) $
  if the left side lies between $-pi/2$ and $pi/2$.
]
