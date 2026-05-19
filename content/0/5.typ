#import "../../templates/templater.typ": *

In this section we introduce intuitive definitions of limits. Further detail on Ch 1.7

#definition("")[
  Suppose $f(x)$ is defined for $x$ _near_ the number $a$, meaning that $f$ is defined on some open interval including $a$.


  Then we write $ lim_{x -> a} f(x) = L $
  We read this as "the limit of $f(x)$ as $x$ approaches $a$ is $L$". This claim must be preceded by the statement that as $f(x)$ gets arbitrarily closer and closer to $L$ as $x$ gets closer and closer to $a$.

  #note[
    We don't care about $f(a)$. Even if it do not exist or rebel!
  ]
]


#example("Catastrophic cancellation / Round-off error")[
  Let's evalutate the values of $ lim_(t->0) (sq(t sr + 9) - 3)/(t sr) $
  #let dat = (1.0, 0.5, 0.1, 0.05, 0.01)
  #value-table(
    horizontal: true,
    variable: $ t $,
    func: $ (sq( t sr + 9 - 3 ))/(t sr) $,
    values: dat.map(x => [$plus.minus$ #x]),
    results: dat.map(x => align(center + horizon)[#calc.round((calc.sqrt(x * x + 9) - 3)/(x*x), digits: 7)])
  )
  We can see the results are approaching to 0.16666... \
  So it looks like the value of the limit is $1/6$.

  To make it sure, Let's try plugging in even smaller number.
  #let dat = (0.001, 0.0001, 0.00001, 0.00000001)
  #value-table(
    horizontal: true,
    variable: $ t $,
    func: $ (sq( t sr + 9 - 3 ))/(t sr) $,
    values: dat.map(x => [$plus.minus$ #x]),
    results: dat.map(x => align(center + horizon)[#calc.round((calc.sqrt(x * x + 9) - 3)/(x*x), digits: 9)])
  )
  ??????

  Is the real limit 0? Actually, the reason is imperfect algorithm of calculator. Since calculator is sort of a computer and it only can compute discrete values, very briefly speadking, it somehow works like _flooring_ the values of infinite (or very many) numbers in decimal space. This causes the calculator think $sq(t sr + 9)=0$ when $t$ is sufficiently small.

  #let asdf(t) = {
      cartesian-canvas(
        size: (2.5,2),
        x-domain: (-t,t),
        y-domain: (-0.05, 0.2),
        y-tick: 0.1,
        axis-label: ($t$, $y$),
        graph(x => (calc.sqrt(x*x + 9) - 3)/(x*x))
      )
      align(center)[#text(size: 0.9em)[$-#(t)<=t<=#(t)$]]
    }

  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    asdf(1),
    asdf(0.1),
    asdf(0.001),
    asdf(0.00001)
  )

  You can also see corrupted part on graphing calculator in extremely small values.
]

#example("Geuss the value of limits")[
  Evaluate the following: $limx(0) (sin x)/x = 1$

  Remember: $limx(0) (sin x)/x = 1$, $limx(0) (tan x)/x = 1$, $limx(0) (1-cos x)/(x sr) = 1/2$
]

#example()[
  Heaviside Function: $ H(t) = cases(0"  if "t<0, 1"  if "t>=0) $

  What is $limx(0) H(x)$?


  #cartesian-canvas(
    size: (8, 4),
    x-domain: (-3, 3),
    y-domain: (-0.5, 1.5),
    // Heaviside: 0 for x < 0
    graph(x => if (x < 0) {0} else {1}, domain: (-3, 3), label: $H(x)$, hole: (-0.001,), filled-hole: (0,)),
  )

  #definition("Intuitive Definition of One-Sided LImits")[
    Suppose $f(x)$ is defined whilst $x$ is near $a$. \
    Then we write $ lim_{x -> a^+} f(x) = L_1 $ and $ lim_{x -> a^-} f(x) = L_2 $
    We read these as "the limit of $f(x)$ as $x$ approaches $a$ from the right is $L_1$" and "the limit of $f(x)$ as $x$ approaches $a$ from the left is $L_2$". \
    This claim must be preceded by the statement that as $f(x)$ gets arbitrarily closer and closer to $L_1$ as $x$ gets closer and closer to $a$ from the right, and similarly for $L_2$ from the left. \
    Here, we call $L_1$ as the *right-hand limit* and $L_2$ as the *left-hand limit*.

    The value of limits only exist when both left- and right-hand limits are equal.
  ]

  Thus the limit here does not exist.
]



- With the basic idea, we can now consider the bigger problem : can limits *fail* to exist?
#example("Uh Oh")[
  Investigate the following :  $ lim_(x -> 0) sin(pi/x) $
  #solution("")[
    To sketch the graph of $f(x)=sin(pi/x)$, note first that $f$ is an odd function, thus its graph is symmetric with respect to the origin. As reaching 0, the oscillation gets faster.
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
      horizontal: true,
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
    #notation("Infinity")[
      When the value increase boundlessly,
      $ lim_(x -> 0) (1/x^2) = infinity $
    ]
    (which mathematically means that the limit does not exist in the real number system)

    #cartesian-canvas(
      size: (8, 5),
      x-domain: (-3, 3),
      y-domain: (-1, 1000),
      y-tick: 100,
      // 1/x² - adaptive graph handles singularity at x=0
      graph(x => 1 / calc.pow(x, 2), domain: (-3, 3), label: $1/x^2$),
      // Vertical asymptote line at x=0
      segment(point(0, -1), point(0, 10), style: (stroke: gray)),
    )

  ]
]

Another example is the Dirichliet funciotn, which will be introduced in Section 8.


    Of course, one-side limit that do not exist also exists.

#definition()[
  The vertical line $x=a$ is called a *vertical asymptote* of the curve $y=f(x)$ if at least one of the following statements is true.
  $ limx(a^-) f(x) = oo "   " limx(a^-) f(x) = -oo \
  limx(a^+) f(x) = oo "   " limx(a^+) f(x) = -oo $

  Thus if only one side is approaching infinity, it is considered as a vertical asymptote.
]

