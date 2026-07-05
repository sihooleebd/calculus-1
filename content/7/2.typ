#import "../../templates/templater.typ": *

= Trigonometric integrals
The main idea is to rewrite the trigonometric powers until one factor becomes the derivative of the inside of the other.

#definition("Useful identities")[
  1. $ sin^2(x) + cos^2(x) = 1 $
  2. $ 1 + tan^2(x) = sec^2(x) $
  3. $ 1 + cot^2(x) = csc^2(x) $
  4. $ sin^2(x) = (1 - cos(2x))/2 $
  5. $ cos^2(x) = (1 + cos(2x))/2 $
]

#note("The visual pattern")[
  Save one factor so that it can become $d u$, and convert everything else with identities until the integral is in one variable.
  - Odd power of $sin$ : save one $sin(x)$, convert the rest to $cos$, substitute $u = cos(x)$.
  - Odd power of $cos$ : save one $cos(x)$, convert the rest to $sin$, substitute $u = sin(x)$.
  - Both powers even : no factor can be saved, so use the half-angle identities (4) and (5) instead.
  - For $tan$-$sec$ (or $cot$-$csc$) integrals, the derivative pairs are $d(tan) = sec^2 d x$ and $d(sec) = sec tan d x$.
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
    $ = -(cos^5(x))/5 + (2cos^7(x))/7 - (cos^9(x))/9 + C $
  ]
]

#example("Both Powers Even")[
  Evaluate
  $ integral_0^pi sin^4(x) d x $
  #solution("")[
    No odd factor to save, so use the half-angle identity twice :
    $ sin^4(x) = ((1-cos(2x))/2)^2 = 1/4 lr([ 1 - 2cos(2x) + cos^2(2x) ]) $
    and
    $ cos^2(2x) = (1 + cos(4x))/2 $

    So
    $ sin^4(x) = 3/8 - 1/2 cos(2x) + 1/8 cos(4x) $

    The cosine terms integrate to sines, which vanish at both $0$ and $pi$. Hence
    $ integral_0^pi sin^4(x) d x = 3/8 dot pi = (3pi)/8 $
  ]
]

= Powers of tangent and secant
#theorem("Two Integrals Everyone Needs")[
  1. $ integral tan(x) d x = ln|sec(x)| + C $
  2. $ integral sec(x) d x = ln|sec(x) + tan(x)| + C $
  #proof("One substitution each")[
    For (1), write $tan(x) = sin(x)/cos(x)$ and substitute $u = cos(x)$ :
    $ integral sin(x)/cos(x) d x = - integral (d u)/u = -ln|cos(x)| + C = ln|sec(x)| + C $

    For (2), multiply by a clever form of $1$ :
    $ integral sec(x) dot (sec(x) + tan(x))/(sec(x) + tan(x)) d x = integral (sec^2(x) + sec(x)tan(x))/(sec(x) + tan(x)) d x $
    The numerator is exactly the derivative of the denominator, so the integral is
    $ ln|sec(x) + tan(x)| + C $
  ]
]

#example("A Pure Power of Tangent")[
  Evaluate
  $ integral_0^(pi/4) tan^4(x) d x $
  #solution("")[
    Peel off $tan^2(x)$ and convert it :
    $ tan^4(x) = tan^2(x)(sec^2(x) - 1) = tan^2(x)sec^2(x) - tan^2(x) $
    and convert the remaining $tan^2(x) = sec^2(x) - 1$ as well :
    $ tan^4(x) = tan^2(x)sec^2(x) - sec^2(x) + 1 $

    Each piece is now integrable on sight :
    $ integral tan^4(x) d x = (tan^3(x))/3 - tan(x) + x + C $

    Therefore
    $ integral_0^(pi/4) tan^4(x) d x = 1/3 - 1 + pi/4 = pi/4 - 2/3 $

    The same peeling reduces $tan^6$, $tan^8$, ... down the ladder two rungs at a time.
  ]
]

#example("Cosecants and Cotangents Play the Same Game")[
  Evaluate
  $ integral_(pi/4)^(pi/2) csc^4(theta) cot^2(theta) d theta $
  #solution("")[
    The derivative of $cot(theta)$ is $-csc^2(theta)$, so save one $csc^2$ and convert the other :
    $ csc^4(theta) cot^2(theta) = (1 + cot^2(theta)) cot^2(theta) csc^2(theta) $

    Let
    $ u = cot(theta) $
    Then $d u = -csc^2(theta) d theta$, and the bounds $theta = pi/4, pi/2$ become $u = 1, 0$.

    Therefore
    $ integral_(pi/4)^(pi/2) csc^4(theta) cot^2(theta) d theta = - integral_1^0 (u^2 + u^4) d u = integral_0^1 (u^2 + u^4) d u $
    $ = 1/3 + 1/5 = 8/15 $
  ]
]

#note("A summary table to carry with you")[
  For $integral tan^m (x) sec^n (x) d x$ :
  - $n$ even : save $sec^2(x)$, convert the rest to $tan$, use $u = tan(x)$.
  - $m$ odd : save $sec(x)tan(x)$, convert the rest to $sec$, use $u = sec(x)$.
  - $m$ even and $n$ odd : the hard case. Convert everything to $sec$ and integrate powers of $sec$ by parts.
]
