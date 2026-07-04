#import "../../templates/templater.typ": *

= Partial fractions
Rational functions often hide simpler pieces inside them. Partial fractions is the method of pulling those pieces back out.

#definition("Partial Fraction Decomposition")[
  If a rational function is proper, we try to rewrite it as a sum of simpler rational functions whose denominators come from the factors of the original denominator.
]

#note("What should we see?")[
  A messy rational function may really be a combination of a logarithm piece, an arctangent piece, and maybe a few easier fractions.
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
