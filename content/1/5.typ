#import "../../templates/templater.typ": *


= The limit
- In the previous section, whilst discussing tangents and velocity, we kept encountering a problem: how do we define the slope of a curve at a single point, or the velocity of a car at a precise moment in time?
- Both of these problems can be solved using the concept of *limits*.
#definition("Intuitive Definition of the Limit")[
  
  Suppose $f(x)$ is defined whilst $x$ is near $a$.
  Then we write $ \lim_{x \to a} f(x) = L $
  We read this as "the limit of $f(x)$ as $x$ approaches $a$ is $L$". This claim must be preceded by the statement that as $f(x)$ gets arbitrarily closer and closer to $L$ as $x$ gets closer and closer to $a$.

]

#example("Limit Basics")[
  Consider the function $f(x) = sin(x)/x$. Evaluate $f(x)$ at values of $x$ that get closer and closer to $0$:
  #solution("", "1")[
    #table-plot(
      headers: ($x$, $f(x)$),
      data: (
        (1, 0.84147098),
        (0.1, 0.99833417),
        (0.01, 0.99998333),
        (0.001, 0.99999983),
        (0.0001, 0.99999998),
      ),
    )
    By the intuitive definition of the limit, we can see that as $x$ approaches $0$, $f(x)$ approaches $1$. Therefore, we can conclude that:
    $ lim_(x -> 0) sin(x)/x = 1 $
    
    #cartesian-canvas(
      size: (8, 5),
      x-domain: (-8, 8),
      y-domain: (-0.5, 1.5),
      show-grid: true,
      // sin(x)/x - adaptive graph handles singularity at x=0
      graph(x => calc.sin(x) / x, domain: (-8, 8), hole: (0,), label: $sin(x)/x$),
      // Horizontal line at y=1 showing the limit
      func(x => 1, domain: (-8, 8), label: "y = 1", style: (stroke: gray)),
      // Hollow point at (0, 1) showing the limit value
    )
  ]
]

- Above, we briefly mentioned that limits may differ when approached from different sides. This can be expanded to the fact that limits may not exist at all  from some sides in some cases.
#definition("Intuitive Definition of One-Sided Limits")[
  Suppose $f(x)$ is defined whilst $x$ is near $a$.
  Then we write $ \lim_{x \to a^+} f(x) = L_1 $ and $ \lim_{x \to a^-} f(x) = L_2 $
  We read these as "the limit of $f(x)$ as $x$ approaches $a$ from the right is $L_1$" and "the limit of $f(x)$ as $x$ approaches $a$ from the left is $L_2$". This claim must be preceded by the statement that as $f(x)$ gets arbitrarily closer and closer to $L_1$ as $x$ gets closer and closer to $a$ from the right, and similarly for $L_2$ from the left. Here, we call $L_1$ as the *right-hand limit* and $L_2$ as the *left-hand limit*.

]

#example("The Heaveside Function")[
  Consider the Heaveside function $H(x)$ defined as follows:
  $
    H(x) = cases(
      0 & "    if" x < 0,
      1 & "    if" x >= 0,
    )
  $
  Evaluate $H(x)$ at values of $x$ that get closer and closer to $0$ from both sides:
  #solution("More Evaluation...")[
    #table-plot(
      headers: ($x$, $H(x)$),
      data: (
        (-1, 0),
        (-0.1, 0),
        (-0.01, 0),
        (0.01, 1),
        (0.1, 1),
        (1, 1),
      ),
    )
    By the intuitive definition of one-sided limits, we can see that as $x$ approaches $0$ from the left, $H(x)$ approaches $0$, and as $x$ approaches $0$ from the right, $H(x)$ approaches $1$. Therefore, we can conclude that:
    $ lim_(x -> 0^-) H(x) = 0 $
    $ lim_(x -> 0^+) H(x) = 1 $
    
    #cartesian-canvas(
      size: (8, 4),
      x-domain: (-3, 3),
      y-domain: (-0.5, 1.5),
      show-grid: true,
      // Heaviside: 0 for x < 0
      graph(x => 0, domain: (-3, -0.01), label: $H(x)$),
      // Heaviside: 1 for x >= 0
      graph(x => 1, domain: (0.01, 3)),
      // Show the jump discontinuity
      point(0, 0, label: "", style: (fill: none)),
      point(0, 1, label: ""),
    )
  ]
]

- With the basic idea, we can now consider the bigger problem : can limits *fail* to exist?
#example("Uh Oh")[
  Investigate the following :  $ lim_(x -> 0) sin(pi/x) $
  #solution("")[
    #table-plot(
      headers: ($x$, $sin(pi/x)$),
      data: (
        (1, 0),
        (0.1, 0.58778525),
        (0.01, 0.95105652),
        (0.001, 0.30901699),
        (0.0001, 0.98768834),
      ),
    )
    By evaluating $sin(pi/x)$ at values of $x$ that get closer and closer to $0$, we can see that the function does not approach a single value. Instead, it oscillates between $-1$ and $1$. Therefore, we can conclude that:
    $ lim_(x -> 0) sin(pi/x) $ does not exist.
    
    #cartesian-canvas(
      size: (8, 4),
      x-domain: (-1, 1),
      y-domain: (-1.5, 1.5),
      x-tick: 0.25,
      show-grid: true,
      // sin(π/x) - adaptive sampling handles singularity
      graph(x => calc.sin(calc.pi / x), domain: (-1, 1), label: $sin(pi/x)$),
    )
  ]
]

#example("Uh Oh 2")[
  Find $ lim_(x -> 0) (1/x^2) $ if it exists
  #solution("")[
    #table-plot(
      headers: ($x$, $1/x^2$),
      data: (
        (1, 1),
        (0.1, 100),
        (0.01, 10000),
        (0.001, 1000000),
        (0.0001, 10000000),
      ),
    )
    By evaluating $1/x^2$ at values of $x$ that get closer and closer to $0$, we can see that the function grows without bound. Therefore, we can conclude that:
    $ lim_(x -> 0) (1/x^2) = infinity $
    (which mathematically means that the limit does not exist in the real number system)
    
    #cartesian-canvas(
      size: (8, 5),
      x-domain: (-3, 3),
      y-domain: (-1, 10),
      show-grid: true,
      // 1/x² - adaptive graph handles singularity at x=0
      graph(x => 1 / calc.pow(x, 2), domain: (-3, 3), label: $1/x^2$),
      // Vertical asymptote line at x=0
      segment(point(0, -1), point(0, 10), style: (stroke: gray)),
    )
  ]
]

#definition("Intuitive Definition of an Infinite Limit")[
  Suppose $f(x)$ is defined whilst $x$ is near $a$ on both sides, except at $a$ itself.
  Then we write $ lim_(x -> a) f(x) = infinity $
  which means that the values of $f(x)$ can be made arbitrarily large by taking $x$ sufficiently close but not equal to $a$.

]
- Of course, we can do the same for negative infinity.
#definition("Intuitive Definition of a Negative Infinity Limit")[
  Suppose $f(x)$ is defined whilst $x$ is near $a$ on both sides, except at $a$ itself.
  Then we write $ lim_(x -> a) f(x) = -infinity $
  which means that the values of $f(x)$ can be made arbitrarily small (negatively large) by taking $x$ sufficiently close but not equal to $a$.
]

- At these points, we can define a *vertial asymptote*.
#definition("Vertical Asymptote")[
  A vertical asymptote is a vertical line $x = a$ when the function $f(x)$ suffices at least one of the 6 conditions :
  - $ lim_(x -> a^+) f(x) = infinity $
  - $ lim_(x -> a^+) f(x) = -infinity $
  - $ lim_(x -> a^-) f(x) = infinity $
  - $ lim_(x -> a^-) f(x) = -infinity $
  - $ lim_(x -> a) f(x) = infinity $
  - $ lim_(x -> a) f(x) = -infinity $
  In simpler terms, a vertical asymptote is a vertical line where the function grows without bound as it approaches the line from at least one side.
]

#example("Vertical Asymptote Example")[
  Investigate if the function $y = (2x) / (x-3)$ have a vertical asymptote.
  #solution("")[
    To find vertical asymptotes, we need to look for values of $x$ that make the denominator equal to $0$. Here, the denominator $x-3$ equals $0$ when $x=3$.
    Next, we need to evaluate the limits as $x$ approaches $3$ from both sides:
    $ lim_(x -> 3^+) (2x)/(x-3) = infinity $
    $ lim_(x -> 3^-) (2x)/(x-3) = -infinity $
    Since both one-sided limits approach infinity (one positive, one negative),
    we can conclude that the function has a vertical asymptote at $x=3$.
    
    #cartesian-canvas(
      size: (8, 6),
      x-domain: (-2, 8),
      y-domain: (-15, 15),
      x-tick: 1,
      y-tick: 5,
      show-grid: true,
      // 2x/(x-3) - split at x=3 (asymptote)
      graph(x => (2 * x) / (x - 3), domain: (-2, 2.9), label: $y = (2x)/(x-3)$),
      graph(x => (2 * x) / (x - 3), domain: (3.1, 8)),
      // Vertical asymptote at x=3
      segment(point(3, -15), point(3, 15), style: (stroke: gray)),
      // Horizontal asymptote at y=2
      func(x => 2, domain: (-2, 8), label: "y = 2", style: (stroke: gray)),
    )
  ]
]