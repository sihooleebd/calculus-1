#import "../../templates/templater.typ": *

We already saw antiderivatives in chapter 3. Here they stop being isolated tricks and become part of a bigger picture.

= Indefinite integrals
#definition("Indefinite Integral")[
  The collection of all antiderivatives of $f(x)$ is called the *indefinite integral* of $f$ and is written as
  $ integral f(x) d x = F(x) + C $
  where $F'(x) = f(x)$ and $C$ is an arbitrary constant.
]

#theorem("Basic Indefinite Integral Formulae")[
  1. $ integral x^n d x = x^(n+1)/(n+1) + C $ if $n != -1$
  2. $ integral cos(x) d x = sin(x) + C $
  3. $ integral sin(x) d x = -cos(x) + C $
  4. $ integral e^x d x = e^x + C $
  5. $ integral 1/x d x = ln|x| + C $
  6. $ integral sec^2(x) d x = tan(x) + C $
  7. $ integral sec(x) tan(x) d x = sec(x) + C $
  8. $ integral 1/(1+x^2) d x = tan^(-1)(x) + C $
  #proof("Differentiate the answers")[
    The fastest way to see these is to go backward from derivative rules we already know.
    For instance,
    $ d/(d x) x^(n+1)/(n+1) = x^n $
    and
    $ d/(d x) sin(x) = cos(x) $

    The same check works for the other formulae, so each right-hand side really is an antiderivative of the left-hand side.
    Adding a constant changes nothing because constants differentiate to $0$.
  ]
]

#example("The Most General Antiderivative")[
  Find the most general antiderivative of
  $ f(t) = t^(-2/5) + sin(t) $
  #solution("")[
    Integrate term by term. The power rule with $n = -2/5$ gives
    $ integral t^(-2/5) d t = t^(3/5)/(3/5) = 5/3 t^(3/5) $
    and
    $ integral sin(t) d t = -cos(t) $

    One subtlety : $t^(-2/5)$ is undefined at $t = 0$, so the domain splits into two separate intervals, and each interval carries its *own* arbitrary constant. The most general antiderivative is therefore
    $
      F(t) = cases(
        5/3 t^(3/5) - cos(t) + C_1 & "    if" t < 0,
        5/3 t^(3/5) - cos(t) + C_2 & "    if" t > 0,
      )
    $
    A single $C$ would silently claim that the two branches move up and down together, but nothing connects them across the gap at $t = 0$.
  ]
]

#example("Finding an Indefinite Integral with Fractional Powers")[
  Find
  $ integral (x^4 - 3x^2 + 2)/sqrt(x) d x $
  #solution("")[
    First rewrite the integrand :
    $ (x^4 - 3x^2 + 2)/sqrt(x) = x^(7/2) - 3x^(3/2) + 2x^(-1/2) $

    Now integrate term by term :
    $ integral x^(7/2) d x = 2/9 x^(9/2) $
    $ integral -3x^(3/2) d x = -6/5 x^(5/2) $
    $ integral 2x^(-1/2) d x = 4 sqrt(x) $

    Therefore
    $ integral (x^4 - 3x^2 + 2)/sqrt(x) d x = 2/9 x^(9/2) - 6/5 x^(5/2) + 4 sqrt(x) + C $
  ]
]

= The net change theorem
#theorem("Net Change Theorem")[
  If a quantity changes at the rate $F'(x)$, then the total change from $a$ to $b$ is
  $ integral_a^b F'(x) d x = F(b) - F(a) $
  #proof("Visualize rate piling up into total change")[
    The function $F'(x)$ tells us the tiny change per tiny input change.
    Adding all those tiny changes from $a$ to $b$ should recover the full difference in the original quantity.

    Formally, $F$ is an antiderivative of $F'$, so the Fundamental Theorem of Calculus Part II gives
    $ integral_a^b F'(x) d x = F(b) - F(a) $
  ]
]

#example("Net Change of a Quantity")[
  Suppose a quantity $C$ changes according to
  $ C'(t) = 3t^2 - 2/t $
  for $1 <= t <= 3$. Find the total change in $C$ on this interval.
  #solution("")[
    By the net change theorem,
    $ C(3) - C(1) = integral_1^3 (3t^2 - 2/t) d t $

    An antiderivative is
    $ t^3 - 2 ln(t) $
    so
    $ integral_1^3 (3t^2 - 2/t) d t = [ t^3 - 2 ln(t) ]_1^3 $
    $ = (27 - 2 ln(3)) - (1 - 0) $
    $ = 26 - 2 ln(3) $

    Therefore the total change is $26 - 2 ln(3)$.
  ]
]

= Displacement versus distance
For a moving particle, the velocity graph carries *two* different accumulation stories at once.

#definition("Displacement and Total Distance")[
  If $v(t)$ is the velocity of a particle on $[a,b]$, then
  $ "displacement" = integral_a^b v(t) d t $
  and
  $ "total distance" = integral_a^b |v(t)| d t $
]

#note("Read it off the picture")[
  Displacement lets the region below the axis cancel the region above it.
  Total distance flips the below-axis region up before adding, so nothing cancels.
]

#canvas.cartesian-canvas(
  size: (8, 5),
  x-domain: (-0.4, 4.4),
  y-domain: (-8, 8),
  y-tick: 2,
  graph.riemann-sum(x => x * x - x - 6, (1, 3), 60, method: "midpoint", smooth: true, style: (fill: rgb("#f5c6c6"), stroke: none)),
  graph.riemann-sum(x => x * x - x - 6, (3, 4), 60, method: "midpoint", smooth: true, style: (fill: rgb("#c6d8f5"), stroke: none)),
  graph.graph(x => x * x - x - 6, domain: (1, 4), label: $v(t) = t^2 - t - 6$),
)

#example("Displacement and Distance from the Same Velocity")[
  A particle moves along a line with velocity
  $ v(t) = t^2 - t - 6 $
  for $1 <= t <= 4$. Find the displacement and the total distance traveled.
  #solution("")[
    The displacement is
    $ integral_1^4 (t^2 - t - 6) d t = lr([ t^3/3 - t^2/2 - 6t ])_1^4 $
    $ = (64/3 - 8 - 24) - (1/3 - 1/2 - 6) = -9/2 $
    So the particle ends up $9/2$ units to the *left* of where it started.

    For the distance, factor
    $ v(t) = (t-3)(t+2) $
    so on $[1,3]$ the velocity is negative and on $[3,4]$ it is positive. Then
    $ integral_1^4 |v(t)| d t = - integral_1^3 v(t) d t + integral_3^4 v(t) d t $

    Compute each piece :
    $ integral_1^3 v(t) d t = lr([ t^3/3 - t^2/2 - 6t ])_1^3 = -22/3 $
    $ integral_3^4 v(t) d t = lr([ t^3/3 - t^2/2 - 6t ])_3^4 = 17/6 $

    Therefore the total distance is
    $ 22/3 + 17/6 = 61/6 $
    which is much larger than $|-9/2|$, exactly because the backward trip was wasted motion.
  ]
]
