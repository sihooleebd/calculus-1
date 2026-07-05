#import "../../templates/templater.typ": *

= Integration by parts
This method is what happens when the product rule is run backward. The picture is simple : move the derivative from one factor to the other if that makes the integral easier.

#theorem("Integration by Parts")[
  $ integral u d v = u v - integral v d u $
  #proof("Start with the product rule")[
    The product rule says
    $ d/(d x) [u v] = u d v/(d x) + v d u/(d x) $

    Integrate both sides :
    $ integral d/(d x) [u v] d x = integral u d v/(d x) d x + integral v d u/(d x) d x $
    so
    $ u v = integral u d v + integral v d u $

    Rearranging gives
    $ integral u d v = u v - integral v d u $
  ]
]

#note("What should we look for?")[
  Try to choose $u$ so that differentiating it makes the expression simpler. Then choose $d v$ so that integrating it is harmless.
  A useful priority order for choosing $u$ is *L-I-A-T-E* : Logarithm, Inverse trig, Algebraic, Trig, Exponential. The earlier in the list, the more it wants to be $u$.
]

#example("A Repeated By-Parts Integral")[
  Evaluate
  $ integral x^2 e^x d x $
  #solution("")[
    Let
    $ u = x^2 " and " d v = e^x d x $
    Then
    $ d u = 2x d x " and " v = e^x $

    So
    $ integral x^2 e^x d x = x^2 e^x - 2 integral x e^x d x $

    Apply integration by parts again to
    $ integral x e^x d x $
    with
    $ u = x $
    and
    $ d v = e^x d x $
    Then
    $ integral x e^x d x = x e^x - e^x $

    Therefore
    $ integral x^2 e^x d x = x^2 e^x - 2(x e^x - e^x) + C $
    $ = e^x (x^2 - 2x + 2) + C $
  ]
]

#example("By Parts with a Logarithm")[
  Evaluate
  $ integral x ln(x) d x $
  #solution("")[
    Let
    $ u = ln(x) " and " d v = x d x $
    Then
    $ d u = 1/x d x " and " v = x^2/2 $

    Therefore
    $ integral x ln(x) d x = x^2/2 ln(x) - integral x^2/2 dot 1/x d x $
    $ = x^2/2 ln(x) - 1/2 integral x d x $
    $ = x^2/2 ln(x) - x^2/4 + C $
  ]
]

#example("The Invisible Second Factor")[
  Evaluate
  $ integral ln(x) d x $
  #solution("")[
    There seems to be no product here, until we write one in :
    $ u = ln(x) " and " d v = 1 dot d x $
    Then
    $ d u = 1/x d x " and " v = x $

    So
    $ integral ln(x) d x = x ln(x) - integral x dot 1/x d x = x ln(x) - x + C $

    The same trick integrates $tan^(-1)(x)$ and $sin^(-1)(x)$ : any function whose *derivative* is friendly can be integrated by parts against $d v = d x$.
  ]
]

#example("A Cyclic Integral")[
  Evaluate
  $ integral e^x sin(x) d x $
  #solution("")[
    Let $I$ denote the integral. Take
    $ u = sin(x), quad d v = e^x d x $
    so that
    $ I = e^x sin(x) - integral e^x cos(x) d x $

    Apply by parts again to the new integral, with $u = cos(x)$ :
    $ integral e^x cos(x) d x = e^x cos(x) + integral e^x sin(x) d x = e^x cos(x) + I $

    Substituting back :
    $ I = e^x sin(x) - e^x cos(x) - I $
    so
    $ 2I = e^x (sin(x) - cos(x)) $
    and
    $ I = 1/2 e^x (sin(x) - cos(x)) + C $

    Nothing ever got simpler. Instead, the original integral came back around, and we *solved for it* like an unknown in an equation.
  ]
]

#example("By Parts Meets an Inverse Tangent")[
  Evaluate
  $ integral_(-ln(sqrt(3)))^(ln(sqrt(3))) e^(-x) tan^(-1)(e^x) d x $
  #solution("")[
    L-I-A-T-E says the inverse trig factor should be $u$ :
    $ u = tan^(-1)(e^x), quad d v = e^(-x) d x $
    Then
    $ d u = e^x/(1+e^(2x)) d x, quad v = -e^(-x) $

    So the integral becomes
    $ lr([ -e^(-x) tan^(-1)(e^x) ])_(-ln(sqrt(3)))^(ln(sqrt(3))) + integral_(-ln(sqrt(3)))^(ln(sqrt(3))) e^(-x) dot e^x/(1+e^(2x)) d x $

    The leftover integral is
    $ integral 1/(1+e^(2x)) d x $
    Multiply top and bottom by $e^(-2x)$ :
    $ integral e^(-2x)/(e^(-2x)+1) d x = -1/2 ln(e^(-2x)+1) $

    Now evaluate everything. At $x = ln(sqrt(3))$ : $e^x = sqrt(3)$, $e^(-x) = 1/sqrt(3)$, and $tan^(-1)(sqrt(3)) = pi/3$.
    At $x = -ln(sqrt(3))$ : $e^x = 1/sqrt(3)$, $e^(-x) = sqrt(3)$, and $tan^(-1)(1/sqrt(3)) = pi/6$.

    The boundary term :
    $ -1/sqrt(3) dot pi/3 + sqrt(3) dot pi/6 = (sqrt(3) pi)/18 $

    The logarithm term :
    $ -1/2 lr([ ln(4/3) - ln(4) ]) = 1/2 ln(3) $

    Therefore
    $ integral_(-ln(sqrt(3)))^(ln(sqrt(3))) e^(-x) tan^(-1)(e^x) d x = (sqrt(3) pi)/18 + 1/2 ln(3) $
  ]
]
