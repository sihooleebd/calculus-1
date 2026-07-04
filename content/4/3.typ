#import "../../templates/templater.typ": *

= The Fundamental Theorem of Calculus
This is the moment where the picture clears up. The process of *accumulating* area and the process of *measuring* instantaneous change undo one another.

#theorem("Fundamental Theorem of Calculus Part I")[
  If $f$ is continuous on $[a,b]$, and if
  $ F(x) = integral_a^x f(t) d t $
  then
  $ F'(x) = f(x) $
  #proof("Think of a thin strip")[
    Compare $F(x+h)$ and $F(x)$ :
    $ F(x+h) - F(x) = integral_x^(x+h) f(t) d t $

    Geometrically, this is the area of a very thin strip of width $h$. Because $f$ is continuous, the height across that strip is almost constant and looks like $f(x)$.

    More precisely,
    $ (F(x+h)-F(x))/h = 1/h integral_x^(x+h) f(t) d t $
    and as $h -> 0$, the average height on that tiny interval approaches $f(x)$.

    Therefore
    $ F'(x) = lim_(h->0) (F(x+h)-F(x))/h = f(x) $
  ]
]

#example("Differentiating an Accumulation Function")[
  Let
  $ F(x) = integral_1^(x^3) ln(1+t^2) d t $
  Find $F'(x)$.
  #solution("")[
    First picture the inside quantity $x^3$ as the moving upper bound. By Part I,
    the derivative of the area function is the integrand evaluated at that moving bound, and then we multiply by the derivative of the bound.

    So
    $ F'(x) = ln(1+(x^3)^2) dot d/(d x)(x^3) $
    $ = 3x^2 ln(1+x^6) $
  ]
]

#theorem("Fundamental Theorem of Calculus Part II")[
  If $f$ is continuous on $[a,b]$ and $F$ is any antiderivative of $f$, then
  $ integral_a^b f(x) d x = F(b) - F(a) $
  #proof("Area and antiderivatives differ only by a constant")[
    Define
    $ G(x) = integral_a^x f(t) d t $
    Then Part I tells us
    $ G'(x) = f(x) $

    But $F'(x) = f(x)$ as well, so
    $ G'(x) = F'(x) $
    This means $G(x) - F(x)$ has derivative $0$, so it must be a constant.

    Evaluate at $x = a$ :
    $ G(a) = integral_a^a f(t) d t = 0 $
    Hence
    $ G(x) = F(x) - F(a) $
    Putting $x = b$ gives
    $ integral_a^b f(x) d x = G(b) = F(b) - F(a) $
  ]
]

#example("Evaluating a Definite Integral with a Logarithmic Antiderivative")[
  Evaluate
  $ integral_1^e (2 ln(x))/x d x $
  #solution("")[
    We look for an antiderivative. Since
    $ d/(d x) (ln(x))^2 = 2 ln(x)/x $
    we can take
    $ F(x) = (ln(x))^2 $

    Therefore
    $ integral_1^e (2 ln(x))/x d x = [ (ln(x))^2 ]_1^e $
    $ = (ln(e))^2 - (ln(1))^2 = 1 - 0 = 1 $
  ]
]
