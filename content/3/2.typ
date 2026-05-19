#import "../../templates/templater.typ": *

#definition()[
  If
  $ integral^b_a f(x) dx = lim_(n-> oo) sum^n_(i=1) f(x_i^*)Delta x $
]

We should do this using epsilon-delta, but we try to avoid this. Usually done by manipulating sample points.

#note[
  Even in unequal width, $max Delta x_i$ must approach 0 to be an Riemann sum.
]

#notation()[
  In the notation
  $ integral^b_a f(x) dx $
  - $integral$ is the *integral sign*.
  - $f(x)$ is called the *integrand*.
  - $a, b$ is called the *limits of integral*.
  - $a$ is the *lower limit* and $b$ is the *upper limit*.
  - The procedure of calculating an integral is called *integration*.
]

#note[
  The definite integral is a number, so it does not depend on the variable of integraion. Thus we may replace x with any other letter without changing the value of integral
  $ integral^b_a f(x) dif x = integral^b_a f(r) dif r = integral^b_a f(t) dif t $
]

A definite integral can be interpreted as a *net area*. Area under x axis is subtracted from the value.

#example()[
  Evaluate the Riemann sum of the function $x cb - 6x$ on $[0, 3]$ with $n=6$ and with the sample point chosen to be right endpoints.

  #solution()[
    With $n=6$, we have
    $ Delta x = (3-0)/6 = 1/2 $
    Then, the sample points are
    $ x_1 = 1/2, x_2 = 1, x_3 = 3/2, x_4 = 2, dots $
    Therefore,
    $ A = "todo" $
  ]
]

#theorem()[
  If f is continuous on $[a,b]$, or if f has only a finite number of jump discontinuities, then f is integrable on $[a,b]$.
]

#theorem()[
  If f is integrable on $[a,b]$, then
  $ integral^b_a f(x) dx = lim_(n->oo) sum^n_(i=1) f(x_i)Delta x_i $
  where
  $ Delta x = (b-a)/n wide "and" wide x_i = a+i Delta x $
]

#example()[
  Evaluate $integral^3_0 (x cb - 6x) dx $
  #solution()[
    Since
    $ Delta x = (3-0)/n wide "and" wide x_i = 0+i Delta x $
    $
      integral^3_0 (x cb - 6x) dx &= lim_(n->oo) sum^n_(i=1)f(x_i)Delta x \
      &= lim_(n->oo) sum^n_(i=1) ((27i cb)/(n cb) - (18i)/n)3/n \
      &= lim_(n->oo) (81/(n^4) i^3 - ) dots
    $
  ]
]

#example()[
  Evaluate the followin integrals by interpreting each in terms of area.
  $ integral^1_0 sq(1-x sr) dx $
  $ integral&3_0 (x-1) dx $
  #solution()[
    $ integral^1_0 sq(1-x sr) dx $
    This is the quater of a circle.
    $ therefore (pi dot 1^2)/4 $
  ]
]

#theorem()[
  $ integral^b_a f(x) dx = Delta x [f(bar(x_1)) + f(bar(x_2)) + dots + f(bar(x_n))] $
  where
  $ Delta x (b-a)/n $
  and $x_i$ is midpoint of the interval.

  Converges very fast, as the trapezoid method.
]


#theorem("Properties of the Integral")[
  Assume f and g are continuous, and c is a constant.
  #set enum(numbering: "(a)")
  + $display(integral ^a_b f(x) dx = -integral^b_a f(x) dx)$

  + $display(integral^a_a f(x) dx = 0)$
  + $display(integral^a_b c = c(b-a))$
  + $display(integral^a_b [f(x) + g(x)] dx = integral^a_b f(x) dx + integral^a_b g(x) dx)$
  + $display(integral^a_b f(x) dx = integral^a_c f(x) dx + integral^c_b f(x) dx)$
  + If $f(x) >= 0 $ for $a<=x<=b$, then $display(integral^b_a f(x) dx >= 0)$
  + If $f(x) >= g(x) $ for $a<=x<=b$, then $display(integral^b_a f(x) dx >= integral^b_a g(x) dx)$
  + If $m <=f(x) <= M$ for $a<=x<=b$, then $display(m(b-a) <= integral^b_a f(x) dx <= M(b-a))$
  + $display(abs(integral^b_a f(x) dx) <= integral^b_a abs(f(x))dx)$
]

#note[
  Proof of (a) can be done by rearranging (rtl to ltr) the sample points.

  (i) can be deduced from (h). (Exercise)
]

= Review
