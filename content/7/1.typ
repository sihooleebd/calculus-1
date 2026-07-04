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
