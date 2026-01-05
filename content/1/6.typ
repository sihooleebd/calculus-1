#import "../../templates/templater.typ": *
- Limits have some rules that we must comply to.
#theorem("The Laws of Limits")[
  Suppose that $c$ is a constant and the limits $lim_(x -> a) f(x)$ and $lim_(x -> a) g(x)$ exist. Then, the following properties hold:
  1. $lim_(x -> a) [f(x) + g(x)] = lim_(x -> a) f(x) + lim_(x -> a) g(x)$
  2. $lim_(x -> a) [f(x) - g(x)] = lim_(x -> a) f(x) - lim_(x -> a) g(x)$
  3. $lim_(x -> a) [c * f(x)] = c * lim_(x -> a) f(x)$
  4. $lim_(x -> a) [f(x) * g(x)]
    = lim_(x -> a) f(x) * lim_(x -> a) g(x)$
  5. $lim_(x -> a) [f(x) / g(x)]
    = (lim_(x -> a) f(x)) / (lim_(x -> a) g(x))$, provided that $lim_(x -> a) g(x) ≠ 0$
]

Using these laws, we can derive a few more :

#theorem("The Power Law of Limits")[
  Suppose that $lim_(x -> a) f(x) = L$ and $n$ is a positive integer. Then,
  $lim_(x -> a) [f(x)]^n = [lim_(x -> a) f(x)]^n = L^n$
]

#theorem("The Root Law of Limits")[
  Suppose that $lim_(x -> a) f(x) = L$ and $n$ is a positive integer. Then,
  $lim_(x -> a) [f(x)]^(1/n) = [lim_(x -> a) f(x)]^(1/n) = L^(1/n)$, provided that if $n$ is even, then $L ≥ 0$
]

also, some special limits :

#theorem("The Constant Function Law")[
  For any constant $c$, $lim_(x -> a) c = c$

  Written differently, $lim_(x ->a) = a$
]

#example("Limit Law Basics")[
  Evaluate $lim_(x -> 5) (2x^2 - 3x + 4)$.
  #solution("")[
    $ lim_(x -> 5) (2x^2 - 3x + 4) = lim_(x -> 5) 2x^2 - lim_(x -> 5) 3x + lim_(x -> 5) 4 $

    ($because$ the Sum and Difference Law)

    $ = 2 * lim_(x -> 5) x^2 - 3 * lim_(x -> 5) x + 4 $

    ($because$ the Constant Multiple Law)
    $ = 2 * 5^2 - 3 * 5 + 4 $

    ($because$ the Power Law and Constant Function Law)
    $ = 50 - 15 + 4 = 39 $
  ]
]

Above, we have discussed that $lim_(x->a)x = a$. What if we generalize this into any function $f(x)$?
#theorem("The Direct Substitution Property")[
  If $f$ is a polynomial/rational function and $a$ is in the domain of $f$, at $x = a$, then $ lim_(x -> a) f(x) = f(a) $
]

#example("Direct Substitution Example")[
  Evaluate $lim_(x -> 2) (x^3 - 4x + 1)/(x^2 + 3)$.
  #solution("")[
    Since the function is a rational function and $2$ is in the domain of the function, we can use the Direct Substitution Property.

    $lim_(x -> 2) (x^3 - 4x + 1)/(x^2 + 3) = (2^3 - 4*2 + 1)/(2^2 + 3) = (8 - 8 + 1)/(4 + 3) = 1/7$
  ]
]

#example("Laws of Limits General")[
  Evaluate $lim_(x -> 1) (x^2-1)/(x-1)$.
  #solution("")[
    We cannot directly substitute $1$ into the function, since it would create a division by zero. However, we can simplify the expression first.

    $ (x^2 - 1)/(x - 1) = ((x - 1)(x + 1))/(x - 1) = x + 1 because x ≠ 1 $.

    Now we can find the limit:

    $ lim_(x -> 1) (x + 1) = 1 + 1 = 2 $
  ]
]

From the intuitive definition of left/right limits, we can know the following :
#theorem("Relationship between One-Sided Limits and Two-Sided Limits")[
  Let $f(x)$ be defined whilst $x$ is near $a$. Then, $ lim_(x -> a) f(x) = L $ if and only if both $ lim_(x -> a^+) f(x) = L $ and $ lim_(x -> a^-) f(x) = L $
]

= The Squeeze Theorem
- Sometimes, it is hard to find the limit of a function directly. However, if we can find two other functions that "squeeze" the function we are interested in, we can use the Squeeze Theorem to find the limit.
#theorem("The Squeeze Theorem")[
  Let $f(x)$, $g(x)$, and $h(x)$ be functions defined on an open interval containing $a$, except possibly at $a$ itself. If for every $x$ in this interval, except possibly at $a$, we have
  $ g(x) ≤ f(x) ≤ h(x) $
  and if
  $ lim_(x -> a) g(x) = lim_(x -> a) h(x) = L $
  then,
  $ lim_(x -> a) f(x) = L $
]

#example("Squeeze Theorem Example")[
  Evaluate $ lim_(x -> 0) x^2 sin(1/x) $
  #solution("")[
    We know that $ -1 ≤ sin(1/x) ≤ 1 $ for all $x ≠ 0$. Multiplying all parts of the inequality by $x^2$ (which is always non-negative), we get :
    $ -x^2 ≤ x^2 * sin(1/x) ≤ x^2 $

    Now, we can find the limits of the two outer functions as $x$ approaches $0$:
    $ lim_(x -> 0) -x^2 = 0 $
    $ lim_(x -> 0) x^2 = 0 $

    Since both limits are equal to $0$, by the Squeeze Theorem, we have :
    $ lim_(x -\u003e 0) x^2 * sin(1/x) = 0 $
    #cartesian-canvas(
      size: (8, 6),
      x-domain: (-0.5, 0.5),
      y-domain: (-0.25, 0.25),
      x-tick: 0.25,
      y-tick: 0.1,
      show-grid: true,
      // The squeeze envelope
      graph(x => x * x, domain: (-0.5, 0.5)),
      graph(x => -(x * x), domain: (-0.5, 0.5)),
      // The squeezed function
      graph(x => (x * x) * calc.sin(1 / x), domain: (-0.5, -0.0001)),
      graph(x => (x * x) * calc.sin(1 / x), domain: (0.0001, 0.5)),
    )
  ]

]
