#import "../../templates/templater.typ": *

= Average value of a function
The average value of a function is the height of a single horizontal line that would give the same total area over the interval.

#definition("Average Value of a Function")[
  The average value of $f(x)$ on $[a,b]$ is
  $ f_"avg" = 1/(b-a) integral_a^b f(x) d x $
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
  ]
]
