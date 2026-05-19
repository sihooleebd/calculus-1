#import "../../templates/templater.typ": *

= Fundamental Theorem of Calculus

FTC deals with particular equation:

$ g(x) = int^x_0 f(t)dt $
#theorem("The Fundamental Theorem of Calculus")[
  Suppose f is continuous on $[a,b]$
  1. (Part 1) The function g defined by
  $ g(x) = int^x_a f(t)dt wide a <= x <= b $
  is continuous on $[a,b]$ and differentiable on $(a,b)$, and $g'(x) = f(x)$.

  2. (Part 2) For antiderivative of $f$ on $[a,b]$, which is $F$,
  $ int^b_a f(x) dx = F(b) - F(a) $
  #note[
    note that the interval is $[a,b]$, not $(a,b)$. We should consider the endpoints too. Despite antiderivatives are infinite and can have varying constant term, those are independent to the definite integral since they cancel out.
  ]
]

#proof("Part1")[
  Let
  $ g(x) = int^x_a f(t)dt $
  Fix $x in (a,b)$. If x and $x+h$ are in $(a,b)$, then
  $ g(x+h)-g(x) = int^(x+h)_a f(t)dt - int^x_a f(t)dt = int^(x+h)_x f(t)dt $
  Thus, for $h != 0$,
  $ (g(x+h)-g(x))/h = 1/h int^(x+h)_x f(t)dt $
  Since f is continuous, theere exists $u_h, v_h in [x, x+h]$
  #sym.because EVT #st
  $ f(u_h) <= f(t) <= f(v_n) wide t in [x, x+h] $
  Now let $h->0$. Then $u_h->x$, $v_n->x$ thus by Squeeze Theorem
  $ f(u_n) -> f(x) wide "and" wide f(v_n) -> f(x) $
  Therefore,
  $ lim_(h->0) (g(x+h)-g(x))/h = lim_(h->0) 1/h int^(x+h)_x f(t)dt = 1/h dot h f(t) = f(t) = g'(t) $
  #note[
    Since every differentiable function is continuous, g is continuous on $(a,b)$. At the endpoints, only one-sided limits are relevant. We can see that it is also continuous on the endpoints by evaluating one-side limits
  ]
]

#proof("Part2")[
  Let
  $ g(x) = int^x_a f(t)dt $
  By Part 1, we have
  $ g'(x) = f(x) $
  so g is an antiderivative.

  Let $F(x) = g(x) + C$
  It also stands for endpoints too.
  Then
  $ F(b) - F(a) &= [g(b) + C] - [g(a) + C] \ &= g(g) - g(a) = g(b) = int^b_a f(t)dt $
]

_"Differentiation and integration are inverse processes."_

#notation()[
  We often use the notation
  $ F(x)]^b_a eq.delta F(b) - F(a) $
  So the equation of FTC Part2 can be written as
  $ int^b_a f(t) dt = F(x)]^b_a $
  Alternative notations are
  $ F(x)|^b_a, wide [F(x)]^b_a $
]

#example()[
  Find the derivative of the following:
  $ g(x) = int^x_1 cos(t sr) dt $
  #solution()[
    For arbitary $x_0$,  let's find $a,b$ #st
    $ f "is continuous on " [a,b] wide "and" wide x_0 in [a,b] $
    // Todo
  ]
]

#example()[
  Suppose that f is continuous on an open interval I, and that g and h are differentiable functions whose values lie in I. show that
  $ d/dx int^(h(x))_(g(x))f(t)dt = f(h(x))h'(x) -  $
]

#example()[
  What is wrong with the following calculation?
  $ int^3_(-1) 1/(x sr) = ... = "negative" $
  #solution()[
    Contains $oo$, discontinuity.
  ]
]

#example()[
  Evalurate the integral $display(int^2_(-2) f(x) dx)$
]

#example()[
  Let

]
