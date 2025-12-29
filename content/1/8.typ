
#import "../../templates/templater.typ": *


= Continuity
Intuitively, continuity can be simply defined as "a function that is connected"...but we dont deal with intuition here. We need a more "precise" definition of continuity.

#definition("Continuity at a Point")[
  A function $f$ is said to be continuous at a point $x = a$ if the following three conditions are satisfied :
  1. $f(a)$ is defined.
  2. $lim_(x -> a) f(x)$ exists.
  3. $lim_(x -> a) f(x) = f(a)$
]
If these conditions are not met, we call the function is "discontinuous" at $x = a$, or has a "discontinuity" at $x = a$.

#example("Continuity Example")[
  Identify if the functions are discontinuous.

  (a) $f(x) = (x^2 - x - 2)/(x-2)$

  (b) $f(x) = cases((x^2 - x - 2)/(x-2) &"    if  " x eq.not 2, 1 &"    if  " x = 2)$

  #solution("", "(a)")[
    The function is discontinuous at $x = 2$. This is because $f(2)$ is not defined, since the denominator becomes $0$ at this point. Therefore, the first condition for continuity is not satisfied.
  ]
  #solution("", "(b)")[
    The function is continuous at $x = 2$. Let's check the three conditions:
    1. $f(2) = 1$, so the first condition is satisfied.
    2. To find $lim_(x -> 2) f(x)$, we simplify the expression for $x eq.not 2$ :
      $f(x) = (x^2 - x - 2)/(x-2) = ((x-2)(x+1))/(x-2) = x + 1$ for $x eq.not 2$.
      Therefore, $lim_(x -> 2) f(x) = lim_(x -> 2) (x + 1) = 3$. So the second condition is satisfied.
    3. However, $lim_(x -> 2) f(x) = 3$ and $f(2) = 1$, so the third condition is not satisfied.

    Thus, the function is discontinuous at $x = 2$.
  ]

  #cartesian-canvas(
    size: (8, 5),
    x-domain: (-1, 5),
    y-domain: (-1, 6),
    show-grid: true,
    // f(x) = (x²-x-2)/(x-2) = x+1 for x ≠ 2
    graph(x => x + 1, domain: (-1, 1.95), hole: (2,), label: $f(x) = (x^2-x-2)/(x-2)$),

    graph(x => x + 1, domain: (2.05, 5)),
    // Show the hole at (2, 3) - use hollow point
    // Defined point at (2, 1)
    point(2, 1, label: "f(2) = 1"),
  )
]

As we did with limits, we can define the left and right continuities for a function too.
#definition("Left Continuity at a Point")[
  A function $f$ is said to be left continuous at a point $x = a$ if the following three conditions are satisfied :
  1. $f(a)$ is defined.
  2. $lim_(x -> a^-) f(x)$ exists.
  3. $lim_(x -> a^-) f(x) = f(a)$
]
#definition("Right Continuity at a Point")[
  A function $f$ is said to be right continuous at a point $x = a$ if the following three conditions are satisfied :
  1. $f(a)$ is defined.
  2. $lim_(x -> a^+) f(x)$ exists.
  3. $lim_(x -> a^+) f(x) = f(a)$
]
Using this info, we can create the following definition :

#definition("Continuity on an Interval")[
  A function $f$ is said to be continuous on an interval $I$ if it is continuous at every point in $I$.
  - If $I$ is a closed interval $[a, b]$, then we also need to check that $f$ is left continuous at $x = b$ and right continuous at $x = a$.
]

#example("Continuity on an Interval Example")[
  Show that the function $f(x) = 1 - sqrt(1-x^2)$ is continuous in the interval $[-1,1]$.
  #solution("")[
    If $-1 < a < 1$, the using the Limit Laws from Secton 1.6, we have :
    $ lim_(x -> a) f(x) = lim_(x -> a) (1 - sqrt(1-x^2)) = 1 - lim_(x -> a) sqrt(1-x^2) = 1 - sqrt(1 - a^2) = f(a) $. Thus, $f$ is continuous at every point in the open interval $(-1, 1)$.
    Now, we need to check the endpoints $x = -1$ and $x = 1$.
    - At $x = -1$ :
      $ lim_(x -> -1^+) f(x) & = lim_(x -> -1^+) (1 - sqrt(1-x^2)) \
                           & = 1 - lim_(x -> -1^+) sqrt(1-x^2) \
                           & = 1 - sqrt(1 - (-1)^2) \
                           & = 1 - 0 \
                           & = 1 = f(-1) $. Thus, $f$ is right continuous at $x = -1$.
    - At $x = 1$ :
      $ lim_(x -> 1^-) f(x) & = lim_(x -> 1^-) (1 - sqrt(1-x^2)) \
                          & = 1 - lim_(x -> 1^-) sqrt(1-x^2) \
                          & = 1 - sqrt(1 - 1^2) \
                          & = 1 - 0 \
                          & = 1 = f(1) $. Thus, $f$ is left continuous at $x = 1$.
      Therefore, $f$ is continuous on the closed interval $[-1, 1]$.

    #cartesian-canvas(
      size: (8, 5),
      x-domain: (-1.5, 1.5),
      y-domain: (-0.5, 1.5),
      show-grid: true,
      // f(x) = 1 - sqrt(1 - x²) - this is a lower semicircle shifted up
      graph(x => 1 - calc.sqrt(1 - calc.pow(x, 2)), domain: (-0.999, 0.999), label: $f(x) = 1 - sqrt(1-x^2)$),
      // Mark the endpoints
      point(-1, 1, label: $(-1, 1)$),
      point(1, 1, label: $(1, 1)$),
      point(0, 0, label: $(0, 0)$),
    )
  ]
]

= Properties of Continous Functions
Just like limits, continuous functions have some properties that we can use to solve problems more easily.
#theorem("Properties of Continuous Functions")[
  If $f$ and $g$ are continuous at $x = a$, then the following functions are also continuous at $x = a$ :
  1. $f + g$
  2. $f - g$
  3. $c f$, where $c$ is any constant
  4. $f g$
  5. $f/g$, provided that $g(a) eq.not 0$
  6. $[f(x)]^n$, where $n$ is a positive integer (derived from rule 4)
  #proof("Rule 1")[
    $ lim_(x -> a) [f(x) + g(x)] = lim_(x -> a) f(x) + lim_(x -> a) g(x) = f(a) + g(a) = (f + g)(a) $
    Thus, since $f(x)$ and $g(x)$ are continuous at $x = a$, $f + g$ is also continuous at $x = a$.
  ]
  #proof("Rule 2")[
    $ lim_(x -> a) [f(x) - g(x)] = lim_(x -> a) f(x) - lim_(x -> a) g(x) = f(a) - g(a) = (f - g)(a) $
    Thus, since $f(x)$ and $g(x)$ are continuous at $x = a$, $f - g$ is also continuous at $x = a$.
  ]
  #proof("Rule 3")[
    $ lim_(x -> a) [c f(x)] = c * lim_(x -> a) f(x) = c * f(a) = (c f)(a) $
    Thus, since $f(x)$ is continuous at $x = a$, $c f$ is also continuous at $x = a$.
  ]
  #proof("Rule 4")[
    $ lim_(x -> a) [f(x) g(x)] = lim_(x -> a) f(x) * lim_(x -> a) g(x) = f(a) * g(a) = (f g)(a) $
    Thus, since $f(x)$ and $g(x)$ are continuous at $x = a$, $f g$ is also continuous at $x = a$.
  ]
  #proof("Rule 5")[
    $ lim_(x -> a) [f(x) / g(x)] = (lim_(x -> a) f(x)) / (lim_(x -> a) g(x)) = (f(a)) / (g(a)) = (f/g)(a) $
    Thus, since $f(x)$ and $g(x)$ are continuous at $x = a$ and $g(a) eq.not 0$, $f/g$ is also continuous at $x = a$.
  ]
  #proof("Rule 6")[
    This rule is derived from Rule 4. Since $f(x)$ is continuous at $x = a$, using Rule 4 repeatedly, we can show that $[f(x)]^n$ is also continuous at $x = a$.
  ]
]

You may have noticed that we didnt even care about continuity during polynomials. This is because of the following theorem :
#theorem("Continuity of Polynomials and Rational Functions")[
  1. Every polynomial function is continuous for all real numbers; that is, it is continuous on $RR = (-infinity, infinity)$
  2. Every rational function is continuous at every point in its domain; that is, it is continuous on its domain.
  #proof("")[
    1. Let $P(x)$ be a polynomial function. Since polynomials are formed by adding, subtracting, and multiplying constant functions and the identity function $f(x) = x$, and both of these functions are continuous everywhere, by the Properties of Continuous Functions theorem, $P(x)$ is continuous for all real numbers.
    2. Let $R(x) = P(x)/Q(x)$ be a rational function, where $P(x)$ and $Q(x)$ are polynomial functions. Since both $P(x)$ and $Q(x)$ are continuous everywhere (from part 1), and provided that $Q(a) eq.not 0$, by the Properties of Continuous Functions theorem, $R(x)$ is continuous at every point in its domain.
  ]
]


#example("Continuity of a Rational Function")[
  Find $lim_(x->-2) (x^3 + 2x^2 - 1)/(5 - 3x)$.
  #solution("")[
    Since the function is a rational function and $2$ is in the domain of the function, we can use the Continuity of Rational Functions theorem.

    $lim_(x->-2) (x^3 + 2x^2 - 1)/(5 - 3x) = (-2^3 + 2*(-2)^2 - 1)/(5 - 3*(-2)) = (-8 + 8 - 1)/(5 + 6) = -1/11$
    #cartesian-canvas(
      size: (8, 5),
      x-domain: (-3, 1),
      y-domain: (-0.25, 0.25),
      show-grid: true,
      // f(x) = (x^3 + 2x^2 - 1)/(5 - 3x)
      graph(
        x => (calc.pow(x, 3) + 2 * calc.pow(x, 2) - 1) / (5 - 3 * x),
        domain: (-3, 1),
        label: $f(x) = (x^3 + 2x^2 - 1)/(5 - 3x)$,
      ),
      // Mark the point at (-2, -1/11)
      point(-2, -1 / 11, label: $(-2, -1/11)$),
    )
  ]
]

= Intermediate Value Theorem
The Intermediate Value Theorem is a very useful theorem that utilizes the property of continuous functions.
#theorem("Intermediate Value Theorem")[
  Let $f$ be a function that is continuous on the closed interval $[a, b]$, and let $N$ be any number between $f(a)$ and $f(b)$, where $f(a) eq.not f(b)$. Then, there exists at least one number $c$ in the open interval $(a, b)$ such that $f(c) = N$.
  #proof("")[
    Since $f$ is continuous on the closed interval $[a, b]$, by the definition of continuity, for every $x$ in $[a, b]$, $f(x)$ takes on every value between $f(a)$ and $f(b)$. Therefore, for any number $N$ between $f(a)$ and $f(b)$, there must exist at least one number $c$ in the open interval $(a, b)$ such that $f(c) = N$.
  ]
]

#example("Intermediate Value Theorem Example")[
  Show that the equation $x^3 + x - 1 = 0$ has a solution in the interval $[0, 1]$.
  #solution("")[
    Let $f(x) = x^3 + x - 1$. We need to show that there exists a number $c$ in the interval $(0, 1)$ such that $f(c) = 0$.
    First, we check the values of $f$ at the endpoints of the interval:
    $f(0) = 0^3 + 0 - 1 = -1$
    $f(1) = 1^3 + 1 - 1 = 1$
    Since $f(0) = -1$ and $f(1) = 1$, and $0$ is between $-1$ and $1$, by the Intermediate Value Theorem, there exists at least one number $c$ in the interval $(0, 1)$ such that $f(c) = 0$.
    Therefore, the equation $x^3 + x - 1 = 0$ has a solution in the interval $[0, 1]$.
    #cartesian-canvas(
      size: (8, 5),
      x-domain: (-0.5, 1.5),
      y-domain: (-1.5, 1.5),
      show-grid: true,
      // f(x) = x^3 + x - 1
      graph(x => calc.pow(x, 3) + x - 1, domain: (-0.5, 1.5), label: $f(x) = x^3 + x - 1$),
      // Mark the points at (0, -1) and (1, 1)
      point(0, -1, label: $(0, -1)$),
      point(1, 1, label: $(1, 1)$),
      point(0.6823, 0, label: $(c, 0)$),
    )
  ]

]
