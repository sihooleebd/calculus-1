#import "../../templates/templater.typ": *

We can use the Substitution Rule in reverse by setting $x=g(x)$. To make this work cleanly, we assume that $g$ is _one-to-one_. Then $dx = g'(t)dt$, and
$ int f(x) dx = int f(g(t))g'(t)dt $
This method is called *inverse substitution*. Usually $g$ is trigonometric function.

#note[
  The one-to-one condition is required. Consider $int^1_(-1) x sr dx$. If we use $t=x sr$, then $dt = 2x dx$, and
  $ int^1_(-1) t 1/(2sq(t)) dt = int^1_1 sq(t)/2 dt = 0 $
  This is not correct. The correct approach is to divide intervals, $[-1, 0)$ and $[0, 1]$.
]

= Table of Trigonometric Substitutions
Assume $a>0$

#table-plot(
  headers: ("Expression", "Substitution", "Identity"),
  data: (
    ($sq(a sr - x sr)$, $x=a sin theta, -pi/2 <= theta <= pi/2$, $1-sin sr theta = cos sr theta$),
    ($sq(a sr - x sr)$, $x=a cos theta, 0 <= theta <= pi$, $1-cos sr theta = sin sr theta$),
    ($sq(a sr + x sr)$, $x=a tan theta, -pi/2 <= theta <= pi/2$, $1 + tan sr theta = sec sr theta$),
    (align(horizon)[$sq(x sr - a sr)$], [$ x=a sec theta, cases(0 <= theta <= pi/2 , pi <= theta <= 3/2 pi) $], align(horizon)[$1-sin sr theta = cos sr theta$]),
  )
)

#example()[
  Evaluate $display(int dx/(x sr sq(x sr + 4)))$
  #solution()[
    Let $x=2tan theta$, where $-pi/2<theta<pi/2$ Then $dx = 2 sec sr theta d theta$, and since $sec theta > 0$,
    $ sq(x sr + 4) = sq(4(1+tan sr theta)) = 2 sec theta $
    $ int dx/(x sr sq(x sr + 4)) = int (2sec sr theta)/(4 tan sr theta dot 2 sec theta) d theta $
  ]
]
