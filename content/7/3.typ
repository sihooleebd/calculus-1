#import "../../templates/templater.typ": *

= Trigonometric substitution
When a square root contains a quadratic expression, trigonometric substitution turns that root into something we can actually see and simplify.

#definition("Standard substitutions")[
  1. For $sqrt(a^2 - x^2)$, use $x = a sin(theta)$
  2. For $sqrt(a^2 + x^2)$, use $x = a tan(theta)$
  3. For $sqrt(x^2 - a^2)$, use $x = a sec(theta)$
]

#note("Why these choices work")[
  They are built to trigger the identities
  $ 1 - sin^2(theta) = cos^2(theta) $
  and
  $ 1 + tan^2(theta) = sec^2(theta) $
  so the square roots collapse nicely.
]

#example("A Trig Substitution with Extra Algebra")[
  Evaluate
  $ integral x^2/sqrt(9-x^2) d x $
  #solution("")[
    Since the root has the form $sqrt(9-x^2)$, let
    $ x = 3 sin(theta) $
    Then
    $ d x = 3 cos(theta) d theta $
    and
    $ sqrt(9-x^2) = 3 cos(theta) $

    Therefore
    $ integral x^2/sqrt(9-x^2) d x = integral (9 sin^2(theta))/(3 cos(theta)) dot 3 cos(theta) d theta $
    $ = 9 integral sin^2(theta) d theta $

    Use
    $ sin^2(theta) = (1-cos(2theta))/2 $
    so
    $ 9 integral sin^2(theta) d theta = 9/2 integral (1-cos(2theta)) d theta $
    $ = 9/2 theta - 9/4 sin(2theta) + C $

    Now
    $ theta = sin^(-1)(x/3) $
    and
    $ sin(2theta) = 2 sin(theta) cos(theta) = 2 dot x/3 dot sqrt(9-x^2)/3 $

    Thus
    $ integral x^2/sqrt(9-x^2) d x = 9/2 sin^(-1)(x/3) - x sqrt(9-x^2)/2 + C $
  ]
]

#note("Getting back to " + $x$ + " : draw the triangle")[
  After substituting $x = a sin(theta)$, draw a right triangle with hypotenuse $a$, opposite side $x$, and adjacent side $sqrt(a^2-x^2)$. Every trig expression of $theta$ can then be read straight off the triangle. This is how $sin(2theta)$ became $2x sqrt(9-x^2)/9$ above without any guessing.
]

#example("A Definite Integral with a Squared Quadratic")[
  Evaluate
  $ integral_0^1 1/(1+x^2)^2 d x $
  #solution("")[
    No square root in sight, but $(1+x^2)^2$ still begs for
    $ x = tan(theta) $
    Then
    $ d x = sec^2(theta) d theta $
    and
    $ (1+x^2)^2 = sec^4(theta) $
    The bounds $x = 0, 1$ become $theta = 0, pi/4$.

    Therefore
    $ integral_0^1 1/(1+x^2)^2 d x = integral_0^(pi/4) (sec^2(theta))/(sec^4(theta)) d theta = integral_0^(pi/4) cos^2(theta) d theta $
    $ = lr([ theta/2 + sin(2theta)/4 ])_0^(pi/4) = pi/8 + 1/4 $
  ]
]

#example("A Root of a Quotient")[
  Evaluate
  $ integral_0^(1/2) sqrt((1-x)/(1+x)) d x $
  #solution("")[
    Multiply inside the root by the conjugate $(1-x)/(1-x)$ :
    $ sqrt((1-x)/(1+x)) = sqrt((1-x)^2/(1-x^2)) = (1-x)/sqrt(1-x^2) $
    for $0 <= x < 1$. Now split :
    $ integral_0^(1/2) 1/sqrt(1-x^2) d x - integral_0^(1/2) x/sqrt(1-x^2) d x $

    The first integral is $sin^(-1)(x)$ on sight. The second falls to $u = 1 - x^2$ and gives $-sqrt(1-x^2)$. So the antiderivative is
    $ sin^(-1)(x) + sqrt(1-x^2) $

    Evaluating :
    $ lr([ sin^(-1)(x) + sqrt(1-x^2) ])_0^(1/2) = (pi/6 + sqrt(3)/2) - (0 + 1) $
    $ = pi/6 + sqrt(3)/2 - 1 $

    The "trig substitution" here was invisible : conjugation pre-simplified the root so thoroughly that only its two easiest fragments survived.
  ]
]

#example("Completing the Square First")[
  Evaluate
  $ integral 1/sqrt(x^2 + 4x + 13) d x $
  #solution("")[
    The quadratic is not centered, so complete the square :
    $ x^2 + 4x + 13 = (x+2)^2 + 9 $

    Now it has the $a^2 + u^2$ shape with $u = x + 2$ and $a = 3$, so let
    $ x + 2 = 3 tan(theta) $
    Then $d x = 3 sec^2(theta) d theta$ and $sqrt((x+2)^2 + 9) = 3 sec(theta)$ :
    $ integral (3 sec^2(theta))/(3 sec(theta)) d theta = integral sec(theta) d theta = ln|sec(theta) + tan(theta)| + C $

    From the triangle, $tan(theta) = (x+2)/3$ and $sec(theta) = sqrt(x^2+4x+13)/3$, so
    $ integral 1/sqrt(x^2 + 4x + 13) d x = ln lr(| x + 2 + sqrt(x^2+4x+13) |) + C $
    after absorbing the constant $-ln(3)$ into $C$.
  ]
]
