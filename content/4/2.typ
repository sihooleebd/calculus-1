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

#theorem("Which Functions are Integrable?")[
  If $f$ is continuous on $[a,b]$, or has only finitely many jump discontinuities there, then $f$ is integrable on $[a,b]$ : the limit of Riemann sums exists and gives the same value for every choice of sample points.
]

#note("Signed area")[
  The integral remembers orientation. Regions above the axis contribute positively, and regions below the axis contribute negatively.
]

#canvas.cartesian-canvas(
  size: (8, 4),
  x-domain: (-3.5, 3.5),
  y-domain: (-1.5, 1.5),
  graph.riemann-sum(x => calc.sin(x), (-calc.pi, 0), 60, method: "midpoint", smooth: true, style: (fill: rgb("#f5c6c6"), stroke: none)),
  graph.riemann-sum(x => calc.sin(x), (0, calc.pi), 60, method: "midpoint", smooth: true, style: (fill: rgb("#c6d8f5"), stroke: none)),
  graph.graph(x => calc.sin(x), domain: (-3.4, 3.4), label: $sin(x)$),
)

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

= Reading a limit of sums backwards
The definition is a two-way street. Whenever a complicated limit of sums has the shape $sum f(x_i) Delta x$, we can *recognize* it as a definite integral and evaluate it with geometry or (soon) antiderivatives.

#note("The recognition recipe")[
  Look for the block $1/n$ : that is $Delta x$ after dividing $[0,1]$ into $n$ pieces (or $c/n$ for the interval $[0,c]$).
  Then look for the block $i/n$ : that is the sample point $x_i$.
  Everything else is the integrand $f$.
]

#example("A Limit of Sums in Disguise")[
  Evaluate
  $ lim_(n->infinity) sum_(i=1)^n 2/n lr([ (2i)/n + sqrt(4 - ((2i)/n)^2) ]) $
  #solution("")[
    The repeated block is
    $ (2i)/n $
    so set
    $ x_i = (2i)/n $
    These are right endpoints of $[0,2]$ with
    $ Delta x = 2/n $

    The sum is therefore a Riemann sum for
    $ f(x) = x + sqrt(4-x^2) $
    on $[0,2]$, and the limit is
    $ integral_0^2 lr([ x + sqrt(4-x^2) ]) d x $

    The first piece is a triangle of base $2$ and height $2$, so it contributes $2$.
    The second piece is a quarter circle of radius $2$, so it contributes $1/4 pi (2)^2 = pi$.

    Hence
    $ lim_(n->infinity) sum_(i=1)^n 2/n lr([ (2i)/n + sqrt(4 - ((2i)/n)^2) ]) = 2 + pi $
  ]
]

#example("A Sum Hiding a Square Root")[
  Evaluate
  $ lim_(n->infinity) sum_(k=1)^n (k sqrt(n^2 - k^2))/n^3 $
  #solution("")[
    Pull the powers of $n$ inside :
    $ (k sqrt(n^2 - k^2))/n^3 = k/n dot sqrt(1 - (k/n)^2) dot 1/n $

    With $x_k = k/n$ and $Delta x = 1/n$, this is a Riemann sum for
    $ f(x) = x sqrt(1-x^2) $
    on $[0,1]$. So the limit equals
    $ integral_0^1 x sqrt(1-x^2) d x $

    We will soon compute such integrals by substitution ; for now, notice that
    $ d/(d x) lr([ -1/3 (1-x^2)^(3/2) ]) = x sqrt(1-x^2) $
    so the value is
    $ lr([ -1/3 (1-x^2)^(3/2) ])_0^1 = 0 - (-1/3) = 1/3 $
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

#theorem("Comparison Properties")[
  Suppose $a < b$ and the integrals exist.
  1. If $f(x) >= 0$ on $[a,b]$, then $ integral_a^b f(x) d x >= 0 $
  2. If $f(x) >= g(x)$ on $[a,b]$, then $ integral_a^b f(x) d x >= integral_a^b g(x) d x $
  3. If $m <= f(x) <= M$ on $[a,b]$, then
  $ m(b-a) <= integral_a^b f(x) d x <= M(b-a) $
  #proof("Rectangles inherit inequalities")[
    Every Riemann sum of a nonnegative function is a sum of nonnegative terms, so its limit is nonnegative. That is (1).

    For (2), apply (1) to the function $f(x) - g(x) >= 0$ and use additivity.

    For (3), apply (2) to the constant functions $m$ and $M$ : the integral of a constant $c$ over $[a,b]$ is $c(b-a)$, which gives both bounds.
  ]
]

#example("Estimating an Integral Without Computing It")[
  Show that
  $ 1/5 <= integral_1^2 1/(1+x^2) d x <= 1/2 $
  without evaluating the integral.
  #solution("")[
    On $[1,2]$, the function $1/(1+x^2)$ is decreasing, so its maximum is at $x = 1$ and its minimum is at $x = 2$ :
    $ 1/5 <= 1/(1+x^2) <= 1/2 $

    By the comparison property with $b - a = 1$,
    $ 1/5 <= integral_1^2 1/(1+x^2) d x <= 1/2 $
    No antiderivative was harmed in the making of this estimate.
  ]
]
