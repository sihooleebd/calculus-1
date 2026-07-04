#import "../../templates/templater.typ": *

= The definite integral
The limit of the Riemann sums is what we really care about. That final number records the full accumulation, not just one rough sketch.

#definition("Definite Integral")[
  If the limit of the Riemann sums for $f$ on $[a,b]$ exists, then we write
  $ integral_a^b f(x) d x = lim_(n->infinity) sum_(i=1)^n f(x_i^*) Delta x $
  and call it the *definite integral* of $f$ from $a$ to $b$.

  Here :
  - $f(x)$ is the *integrand*.
  - $a$ is the *lower limit*.
  - $b$ is the *upper limit*.
  - $x$ is only the *variable of integration*.
]

#note("Signed area")[
  The integral remembers orientation. Regions above the axis contribute positively, and regions below the axis contribute negatively.
]

#example("A Geometric Integral with a Curved Boundary")[
  Evaluate
  $ integral_(-2)^2 sqrt(4-x^2) d x $
  using geometry.
  #solution("")[
    The graph $y = sqrt(4-x^2)$ is the upper semicircle of radius $2$ centered at the origin.
    So the integral is just the area of that semicircle :
    $ integral_(-2)^2 sqrt(4-x^2) d x = 1/2 pi (2)^2 = 2 pi $
  ]
]

#example("A Net Area Example")[
  Evaluate
  $ integral_(-pi)^pi sin(x) d x $
  #solution("")[
    The graph of $sin(x)$ is odd, so the part on $[-pi,0]$ is the mirror image of the part on $[0,pi]$ with opposite sign.
    The positive and negative regions cancel, so
    $ integral_(-pi)^pi sin(x) d x = 0 $
  ]
]

#theorem("Basic Properties of the Definite Integral")[
  If the integrals exist, then :
  1. $ integral_a^a f(x) d x = 0 $
  2. $ integral_a^b f(x) d x = - integral_b^a f(x) d x $
  3. $ integral_a^b c f(x) d x = c integral_a^b f(x) d x $
  4. $ integral_a^b [f(x) + g(x)] d x = integral_a^b f(x) d x + integral_a^b g(x) d x $
  5. $ integral_a^b f(x) d x = integral_a^c f(x) d x + integral_c^b f(x) d x $
  #proof("From the Riemann sums")[
    The picture is still useful here : every property comes from what happens to the rectangles. But we can also write it directly in symbols.

    For (1), if the interval is $[a,a]$, then
    $ Delta x = (a-a)/n = 0 $
    so every Riemann sum is
    $ sum_(i=1)^n f(x_i^*) Delta x = 0 $
    Hence
    $ integral_a^a f(x) d x = 0 $

    For (2), reversing the interval changes the width from $Delta x$ to $-Delta x$, so
    $ integral_b^a f(x) d x = lim_(n->infinity) sum_(i=1)^n f(x_i^*)(-Delta x) = - integral_a^b f(x) d x $

    For (3),
    $ integral_a^b c f(x) d x = lim_(n->infinity) sum_(i=1)^n c f(x_i^*) Delta x $
    $ = c lim_(n->infinity) sum_(i=1)^n f(x_i^*) Delta x = c integral_a^b f(x) d x $

    For (4),
    $ integral_a^b [f(x) + g(x)] d x = lim_(n->infinity) sum_(i=1)^n [f(x_i^*) + g(x_i^*)] Delta x $
    $ = lim_(n->infinity) lr([ sum_(i=1)^n f(x_i^*) Delta x + sum_(i=1)^n g(x_i^*) Delta x ]) $
    $ = integral_a^b f(x) d x + integral_a^b g(x) d x $

    For (5), if we split $[a,b]$ at $c$, then the full Riemann sum splits into the two partial sums on $[a,c]$ and $[c,b]$, so in the limit
    $ integral_a^b f(x) d x = integral_a^c f(x) d x + integral_c^b f(x) d x $
  ]
]
