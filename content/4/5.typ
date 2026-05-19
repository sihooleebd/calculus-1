#import "../../templates/templater.typ": *

For finitely many data values $y_1, y_2, ..., y_n$, the average is
$ y_"avg" = (y_1 + y_2 + dots.c + y_n)/n $

As $n -> oo$, the Riemann sum approaches a definite integral, and the average of the funciton.

#definition()[
  we define the *average value of f* on $[a,b]$ as
  $ f_"avg" = 1/(b-a) int^b_a f(x)dx $
]

#example()[
  Find the average value of the function $f(x) = 1 + x sr$ on the interval $[-1,2]$.
  #solution()[
    $ = 1/(2-(-1)) int^2_(-1) (1 + x sr) dx = 1/3  $
  ]
]

#theorem("The Mean Value Theorem for Integrals")[
  If $f$ is continuous on $[a,b]$, then there exists a number $c in [a,b]$ such that
  $ f(c) = f_"avg" = 1/(b-a) int^b_a f(x)dx $
  that is,
  $ int^b_a f(x)dx = f(c) (b-a) $
  #proof()[
    Define$ F(x) = int^x_0 f(x) dx, wide a <= x <= b $
    Then,
    $ f_ "avg" = (F(b) - F(a))/(b-a) $
  ]
  #proof[
    Since f is continuous on $[a,b]$, the Extreme Value Theorem guarantees that f attains max and min.
    Let
    $ f(p) = m = min_(x in [a,b)) f(x) wide f(q) = M = max_(x in [a,b)) f(x) $
    Then $ f(p) $
  ]
]

#example()[
  Find the average value of the function on the given interval \

  + $display( f(x) = (x sr)/((x cb + 3)^2)\, quad [-1,1] )$
  + $display( g(x) = (1 + sin x) ^2 cos x\, quad [pi\/2, 3pi\/2] )$
  #solution()[
    $
      f_ "avg" &eq.delta  1/(1-(-1)) int^1_(-1) (x sr)/((x cb + 3)^2) dx = 1/2 int^1_(-1) (x sr)/((x cb + 3)^2) \
    $
    $f$ is a even function.
    $
      = int^1_0 (x sr)/((x cb + 3)^2) dx
    $
    Substitution Method: \
    Let $ u = (x cb + 3)$. Then $du = 3 x sr dx$.
    $
      = int^1_0 1/3 (3x sr)/((x cb + 3)^2) dx
      = 1/3 int^1_0 1/(u sr) du
    $
  ]
]

#example()[
  Show that the _average velocity_ of a car over a time interval $[t_1, t_2]$ is the same as the _average of its velocities_ during the trip.
  #solution()[
    Let $s(t)$ be the position of the car and let $v(t) = s'(t)$. By FTC2, the average value of the velocity is
    $ v_ "avg" = 1/(t_2-t_1) int^(t_2)_(t_1) s'(t) dt = (s(t_2) - s(t_1))/(t_2 - t_1) $
  ]
]

#example()[
  Let $f_ "avg" [a,b]$ denote the average value of f on the interval $[a,b]$. Show that if f is continuous, then
  $ lim_(h->0^+) f_ "avg" [a,a+h] = f(a) $
  #solution()[
    $ f_ "avg" [a, a+h] eq.delta 1/((a+h) - a) int^(a+h)_a f(x) dx $
    Since f is continuous, by FTC 1,
    $ d/dx int f(x) dx = f(x) $
    Let $int f(x) dx = F(x)$
    By FTC2,
    $ 1/((a+h) - a) int^(a+h)_a f(x) dx = 1/h int^(a+h)_a f(x)dx = 1/h dot (F(a+h) - F(a)) $
    $ lim_( h->0^+) =  $
    #note[
      This is an one-sided limit. FTC1 does not explicitly mention this.
    ]
  ]
  #solution()[
    For each $h>0$, the MVT for Integrals gives a number $c_h in $
  ]
]
