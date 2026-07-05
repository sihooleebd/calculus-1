#import "../../templates/templater.typ": *

= Average value of a function
The average value of a function is the height of a single horizontal line that would give the same total area over the interval.

#definition("Average Value of a Function")[
  The average value of $f(x)$ on $[a,b]$ is
  $ f_"avg" = 1/(b-a) integral_a^b f(x) d x $
]

#note("The water-leveling picture")[
  Pour the region under the graph into a rectangular aquarium of the same width $b - a$ and let the water settle flat. The final water level is exactly $f_"avg"$.
]

#example("A Quick Average")[
  Find the average value of $sin(x)$ on $[0, pi]$.
  #solution("")[
    $ f_"avg" = 1/pi integral_0^pi sin(x) d x = 1/pi [ -cos(x) ]_0^pi = 2/pi $
    So the famous sine arch, flattened out, is only about $0.64$ tall.
  ]
]

#theorem("Mean Value Theorem for Integrals")[
  If $f$ is continuous on $[a,b]$, then there exists some number $c$ in $[a,b]$ such that
  $ f(c) = 1/(b-a) integral_a^b f(x) d x $
  #proof("Picture a horizontal balancing line")[
    Because $f$ is continuous on a closed interval, it has a minimum value $m$ and a maximum value $M$.
    So for every $x$ in $[a,b]$,
    $ m <= f(x) <= M $

    Integrating across the whole interval gives
    $ m(b-a) <= integral_a^b f(x) d x <= M(b-a) $
    Divide by $b-a$ :
    $ m <= 1/(b-a) integral_a^b f(x) d x <= M $

    So the average value lies between the minimum and maximum heights of the graph.
    Since $f$ is continuous, it takes every intermediate height, so there must be some $c$ with
    $ f(c) = 1/(b-a) integral_a^b f(x) d x $
  ]
]

#canvas.cartesian-canvas(
  size: (8, 4.5),
  x-domain: (-0.3, 3.4),
  y-domain: (0, 7),
  graph.riemann-sum(x => x * calc.sqrt(x + 1), (0, 3), 60, method: "midpoint", smooth: true, style: (fill: rgb("#c6d8f5"), stroke: none)),
  graph.graph(x => x * calc.sqrt(x + 1), domain: (0, 3.2), label: $f(x) = x sqrt(x+1)$),
  graph.func(x => 116.0 / 45.0, domain: (0, 3), label: $f_"avg"$, style: (stroke: gray)),
)

#example("Average Value with a Substitution-Friendly Function")[
  Find the average value of
  $ f(x) = x sqrt(x+1) $
  on $[0,3]$.
  #solution("")[
    By definition,
    $ f_"avg" = 1/3 integral_0^3 x sqrt(x+1) d x $

    Let
    $ u = x + 1 $
    Then
    $ x = u - 1 $
    and
    $ d u = d x $

    The bounds become :
    If $x = 0$, then $u = 1$.
    If $x = 3$, then $u = 4$.

    Therefore
    $ integral_0^3 x sqrt(x+1) d x = integral_1^4 (u-1)u^(1/2) d u $
    $ = integral_1^4 (u^(3/2) - u^(1/2)) d u $
    $ = [ 2/5 u^(5/2) - 2/3 u^(3/2) ]_1^4 $
    $ = 116/15 $

    Hence
    $ f_"avg" = 1/3 dot 116/15 = 116/45 $

    In the picture, the shaded area under the curve equals the area of the rectangle capped by the gray line $y = 116/45$. The curve crosses that line at the point $c$ promised by the Mean Value Theorem for Integrals.
  ]
]
