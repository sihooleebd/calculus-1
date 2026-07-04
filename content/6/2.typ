#import "../../templates/templater.typ": *

= The natural logarithmic function
For the starred school track, logarithms are born from area. That is a very visual definition, but we will still push it all the way to algebra and derivatives.

#definition("Natural Logarithm")[
  For $x > 0$, the natural logarithmic function is defined by
  $ ln(x) = integral_1^x 1/t d t $
]

#note("The geometry behind it")[
  If $x > 1$, then $ln(x)$ is the area under $y = 1/t$ from $1$ to $x$.
  If $0 < x < 1$, the interval is reversed, so the value becomes negative.
]

#theorem("Properties of " + $ln(x)$)[
  For positive numbers $a$ and $b$ :
  1. $ ln(1) = 0 $
  2. $ ln(a b) = ln(a) + ln(b) $
  3. $ ln(a/b) = ln(a) - ln(b) $
  4. $ ln(a^r) = r ln(a) $
  #proof("Split the area, then write the algebra")[
    The first property is immediate from the definition :
    $ ln(1) = integral_1^1 1/t d t = 0 $

    For the product law,
    $ ln(a b) = integral_1^(a b) 1/t d t = integral_1^a 1/t d t + integral_a^(a b) 1/t d t $
    In the second integral let
    $ t = a u $
    so
    $ d t = a d u $
    Then
    $ integral_a^(a b) 1/t d t = integral_1^b 1/(a u) dot a d u = integral_1^b 1/u d u = ln(b) $
    Hence
    $ ln(a b) = ln(a) + ln(b) $

    Now
    $ ln(a/b) + ln(b) = ln((a/b)b) = ln(a) $
    so
    $ ln(a/b) = ln(a) - ln(b) $

    Finally, for rational $r$ we repeatedly use the product law to get
    $ ln(a^r) = r ln(a) $
    and then extend this to real $r$ by continuity.
  ]
]

#theorem("Derivative of the Natural Logarithm")[
  $ d/(d x) ln(x) = 1/x $
  #proof("Use the Fundamental Theorem directly")[
    Since
    $ ln(x) = integral_1^x 1/t d t $
    and the integrand $1/t$ is continuous for $x > 0$, the Fundamental Theorem of Calculus Part I gives
    $ d/(d x) ln(x) = 1/x $
  ]
]

#example("Differentiating a Logarithm with Several Layers")[
  Differentiate
  $ y = ln((x^2 + 1)^3 / sqrt(x^5 + 1)) $
  #solution("")[
    First use logarithm laws :
    $ y = 3 ln(x^2 + 1) - 1/2 ln(x^5 + 1) $

    Now differentiate term by term :
    $ y' = 3 dot 2x/(x^2 + 1) - 1/2 dot 5x^4/(x^5 + 1) $
    $ = 6x/(x^2 + 1) - 5x^4/(2(x^5 + 1)) $
  ]
]
