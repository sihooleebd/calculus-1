#import "../../templates/templater.typ": *

= Partial fractions
Rational functions often hide simpler pieces inside them. Partial fractions is the method of pulling those pieces back out.

#definition("Partial Fraction Decomposition")[
  Let $P(x)/Q(x)$ be a *proper* rational function (degree of $P$ less than degree of $Q$). Factor $Q$ over the reals ; each factor donates terms as follows :
  1. A distinct linear factor $(a x + b)$ donates $ A/(a x + b) $
  2. A repeated linear factor $(a x + b)^r$ donates $ A_1/(a x+b) + A_2/(a x+b)^2 + ... + A_r/(a x+b)^r $
  3. A distinct irreducible quadratic $(a x^2 + b x + c)$ donates $ (A x + B)/(a x^2 + b x + c) $
  4. A repeated irreducible quadratic donates a chain of such terms with rising powers, just like case 2.
]

#note("If the fraction is not proper")[
  Divide first. Long division rewrites the function as
  $ "polynomial" + "proper fraction" $
  and only the proper part needs decomposing. Forgetting this step is the single most common error in the whole method.
]

#example("Long Division Before Anything Else")[
  Evaluate
  $ integral (x^2+1)/(x^2-3x+2) d x $
  #solution("")[
    The degrees match, so divide :
    $ (x^2+1)/(x^2-3x+2) = 1 + (3x-1)/(x^2-3x+2) $

    Factor the denominator and decompose the proper part :
    $ (3x-1)/((x-1)(x-2)) = A/(x-1) + B/(x-2) $
    Multiplying out and substituting the roots :
    at $x = 1$, $A = (3-1)/(1-2) = -2$ ; at $x = 2$, $B = (6-1)/(2-1) = 5$.

    Therefore
    $ integral (x^2+1)/(x^2-3x+2) d x = x - 2 ln|x-1| + 5 ln|x-2| + C $
  ]
]

#example("A Repeated Linear Factor")[
  Evaluate
  $ integral (4x)/((x-1)^2 (x+1)) d x $
  #solution("")[
    Case 2 says the squared factor donates *two* terms :
    $ (4x)/((x-1)^2 (x+1)) = A/(x-1) + B/(x-1)^2 + C/(x+1) $

    Multiply through by the denominator :
    $ 4x = A(x-1)(x+1) + B(x+1) + C(x-1)^2 $

    Substituting $x = 1$ gives $4 = 2B$, so $B = 2$.
    Substituting $x = -1$ gives $-4 = 4C$, so $C = -1$.
    Comparing $x^2$ coefficients gives $0 = A + C$, so $A = 1$.

    Therefore
    $ integral (4x)/((x-1)^2 (x+1)) d x = ln|x-1| - 2/(x-1) - ln|x+1| + C $

    Note the middle term : the $B/(x-1)^2$ piece integrates to a *rational* function, not a logarithm. Repeated factors are exactly where non-log pieces sneak in.
  ]
]

#example("A Rational Function with Linear and Irreducible Factors")[
  Evaluate
  $ integral (2x^2 + 3x + 5)/(x(x^2+1)) d x $
  #solution("")[
    Decompose it as
    $ (2x^2 + 3x + 5)/(x(x^2+1)) = A/x + (B x + C)/(x^2+1) $

    Multiply through by $x(x^2+1)$ :
    $ 2x^2 + 3x + 5 = A(x^2+1) + (B x + C)x $
    $ = (A+B)x^2 + C x + A $

    Match coefficients :
    $ A = 5, C = 3, A+B = 2 $
    so
    $ B = -3 $

    Therefore
    $ integral (2x^2 + 3x + 5)/(x(x^2+1)) d x = integral [ 5/x + (-3x+3)/(x^2+1) ] d x $
    $ = 5 integral 1/x d x - 3 integral x/(x^2+1) d x + 3 integral 1/(x^2+1) d x $
    $ = 5 ln|x| - 3/2 ln(x^2+1) + 3 tan^(-1)(x) + C $
  ]
]

#example("Two Irreducible Quadratics at Once")[
  Evaluate
  $ integral_0^1 (2x^2 + x + 3)/((x^2+1)(x^2+3)) d x $
  #solution("")[
    Both factors are irreducible quadratics, so each donates a linear-over-quadratic term :
    $ (2x^2 + x + 3)/((x^2+1)(x^2+3)) = (A x + B)/(x^2+1) + (C x + D)/(x^2+3) $

    Multiplying out :
    $ 2x^2 + x + 3 = (A x + B)(x^2+3) + (C x + D)(x^2+1) $
    Compare coefficients degree by degree :
    - $x^3$ : $A + C = 0$
    - $x^2$ : $B + D = 2$
    - $x^1$ : $3A + C = 1$
    - $x^0$ : $3B + D = 3$

    From the first and third, $A = 1/2$ and $C = -1/2$. From the second and fourth, $B = 1/2$ and $D = 3/2$.

    Now integrate the four pieces over $[0,1]$ :
    $ 1/2 integral_0^1 x/(x^2+1) d x = 1/4 ln(2) $
    $ 1/2 integral_0^1 1/(x^2+1) d x = pi/8 $
    $ -1/2 integral_0^1 x/(x^2+3) d x = -1/4 ln(4/3) $
    $ 3/2 integral_0^1 1/(x^2+3) d x = 3/2 dot 1/sqrt(3) tan^(-1)(1/sqrt(3)) = (sqrt(3) pi)/12 $

    Adding the logarithms : $1/4 (ln(2) - ln(4/3)) = 1/4 ln(3/2)$. Therefore
    $ integral_0^1 (2x^2 + x + 3)/((x^2+1)(x^2+3)) d x = 1/4 ln(3/2) + pi/8 + (sqrt(3) pi)/12 $
  ]
]

#note("What can possibly come out?")[
  Integrating any rational function only ever produces three species : rational functions, logarithms, and arctangents. If your answer contains anything else, something went wrong.
]
