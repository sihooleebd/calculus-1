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
