#import "../../templates/templater.typ": *

= Trigonometric integrals
The main idea is to rewrite the trigonometric powers until one factor becomes the derivative of the inside of the other.

#definition("Useful identities")[
  1. $ sin^2(x) + cos^2(x) = 1 $
  2. $ 1 + tan^2(x) = sec^2(x) $
  3. $ 1 + cot^2(x) = csc^2(x) $
]

#note("The visual pattern")[
  Save one factor so that it can become $d u$, and convert everything else with identities until the integral is in one variable.
]

#example("A Higher-Power Trigonometric Integral")[
  Evaluate
  $ integral sin^5(x) cos^4(x) d x $
  #solution("")[
    Since the power of $sin(x)$ is odd, save one factor of $sin(x)$ :
    $ sin^5(x) = sin(x)(sin^2(x))^2 = sin(x)(1-cos^2(x))^2 $

    So
    $ integral sin^5(x) cos^4(x) d x = integral sin(x)(1-cos^2(x))^2 cos^4(x) d x $

    Let
    $ u = cos(x) $
    Then
    $ d u = -sin(x) d x $

    Therefore
    $ integral sin^5(x) cos^4(x) d x = - integral (1-u^2)^2 u^4 d u $
    $ = - integral (u^4 - 2u^6 + u^8) d u $
    $ = -u^5/5 + 2u^7/7 - u^9/9 + C $
    $ = -cos^5(x)/5 + 2cos^7(x)/7 - cos^9(x)/9 + C $
  ]
]
