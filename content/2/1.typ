#import "../../templates/templater.typ": *

#definition()[
  Let $c$ be a number in the domain $D$ of a function $f$. Then $f(c)$ is the
  - (absolute, global) *maximum value* of f on D if $f(c) >= f(x)$ for all $x in D$
  - (absolute, global) *minimum value* of f on D if $f(c) <= f(x)$ for all $x in D$

  These are called *extreme values* of $f$.
]

#definition()[
  The number $f(c)$ is a
  - *local maximum value* of f if $f(c) >= f(x)$ when x is _"near"_ c.
  - *local minimum value* of f if $f(c) <= f(x)$ when x is _"near"_ c.

  We say that something is _near_ c, we mean that it is true on some open interval containing c. In particular, every global maximum is local maximum and vice versa.
]

#note[
  The book somehow do not consider the endpoints of the interval as extrema. i.e., the domain is open interval. Thus if the function value at endpoint is smaller/greater than any other, the function do not have extreme valus.
]

#theorem("The Extreme Value Theorem")[
  If f is continuous on a closed interval $[a, b]$ then f attains an absolute maximum value $f(c)$ and an absolute minimum value $f(d)$ at some $c,d in [a,b]$.
]

#theorem("Fermat's Theorem")[
  If f has a local minimum or maximum at c and if $f'(c)$ exists, $f'(c) = 0$
  #proof[
    Suppose f has a local minimum at c. Then for h close to 0,
    $ f(c+h) - f(c) >=0 $

    If $h>0$,

  ]
]

#note[
  The converse of Fermat's theorem is not true.
  #cartesian-canvas(func(x => x*x*x), size: (4,4), x-domain: (-3,3), y-domain: (-3,3))
  at $x=0$, $f'(0) = 0$ but not extreme value.
  Also, Fermat's Theorem is only valid for when it is differentiable.
  #cartesian-canvas(func(x => calc.abs(x)), size: (4,4), x-domain: (-3,3), y-domain: (-3,3))
  at $x=0$, $f'(0)$ doesn't exist and is minimum value.
  Therefore, you should check the differentiable interval before finding critical values.
]

#definition("Critical Numbers")[
  Points where it can potentially be maxima / minima.
  + Points where $f'(x) = 0$
  + Points where $f'(x)$ is not defined.
  +
]

#theorem("Closed Interval Method")[
  Investigate all candidates.
  + critical numbers
  + endpoints of the interval
  The largerst of the values from 1 and 2 is absolute minimum/maximum value.
]
