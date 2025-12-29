#import "../../templates/templater.typ": *

= Linear approximation
Remember our proof of the *chain rule* a few sections back? That was our preview of the topic of *linear approximation*.
We can define a tangent line at a point $(a, f(a))$ as
$ L(x) = f(a) + f'(a)(x-a) $
#cartesian-canvas(
  graph(x => x * x),
  graph(x => 2 * x - 1),
  point(1, 1),
)

We can use this linearized function to predict a value near $a$. For example, if we want to find $f(1.1)$, we can use the linearized function to predict $f(1.1) = 2.1$

#definition("Linear Approximation")[
  If $f(x)$ is differentiable at $a$, then the linear approximation of $f(x)$ at $a$ is $L(x) = f(a) + f'(a)(x-a)$. We can use this to predict $f(x)$ near $a$.
  $ f(x) approx L(x) = f(a) + f'(a)(x-a) $

]

So where is this used? It is a famous thing that $sin(theta) approx theta$ near $0$. This is used numerously for physics problems, such as finding the period of a pendulum.

#example("Period of a Pendulum")[
  Find the period of a pendulum with length $L$.
  #solution("")[
    #let pivot = point(0, 0)
    #let bob = point-at-angle(pivot, -60deg, 3)
    #let rest = point(0, -3)
    // Force vectors at the bob position
    #let bob-pos = (x(bob), y(bob))
    #let gravity = vector(0, -2.5, origin: bob-pos, label: $m g$, style: (stroke: blue))
    #let tangent-force = vector(
      2.2 * calc.cos(-30deg),
      2.2 * calc.sin(-30deg),
      origin: bob-pos,
      label: $-m g sin theta$,
      style: (stroke: red),
    )
    #let radial = vector(
      -1.5 * calc.sin(-30deg),
      1.5 * calc.cos(-30deg),
      origin: bob-pos,
      label: $m g cos theta$,
      style: (stroke: green),
    )
    #blank-canvas(
      segment(pivot, bob, label: $L$),
      point(x(bob), y(bob), label: "m"),
      segment(pivot, rest, style: (dash: "dashed")),
      arc(pivot, rest, bob, style: (dash: "dotted")),
      angle(rest, pivot, bob, label: $theta$),
      gravity,
      tangent-force,
      radial,
    )
    The equation of motion for a pendulum is derived from Newton's second law:
    $ m L (d^2 theta)/(d t^2) = -m g sin(theta) $
    This simplifies to:
    $ (d^2 theta)/(d t^2) = -g/L sin(theta) $
    For small angles, we use the linear approximation $sin(theta) approx theta$ (since $sin'(0) = 1$):
    $ (d^2 theta)/(d t^2) = -g/L theta $
    This matches the standard form of simple harmonic motion:
    $ (d^2 theta)/(d t^2) = -omega^2 theta $
    Comparing the two equations, we identify:
    $ omega^2 = g/L quad arrow.double quad omega = sqrt(g/L) $
    The period is therefore:
    $ T = (2 pi)/omega = 2 pi sqrt(L/g) $
  ]
]

= Differentials
- We dealed with $(d y)/(d x)$ a few times before. However, we can actually use this to obtain $d y$ and $d x$.
#definition("Differential")[
  If $f(x)$ is differentiable at $x$, then $d y = f'(x) d x$.
  #let f = x => 3 * calc.sqrt(x)
  #let A = point(3, 0, label: "a")
  #let B = point(5, 0, label: "a + Δx")
  #let GR = graph(f, domain: (0, 10))
  #let P = point(3, f(3), label: "P")
  #let Q = point(5, f(5), label: "Q")
  // Tangent line at x=3: slope = f'(3) = 3/(2*sqrt(3))
  #let slope = 3 / (2 * calc.sqrt(3))
  #let dx = 2  // from x=3 to x=5
  #let dy = slope * dx
  #let TNG = tangent(f, 3, length: 6)
  #let R = point(5, f(3) + dy, label: "R")

  #cartesian-canvas(
    x-domain: (0, 10),
    y-domain: (0, 10),
    TNG,
    GR,
    P,
    Q,
    R,
    segment(P, point(5, f(3)), style: (dash: "dashed"), label: $Delta x$),
    segment(point(5, f(3)), Q, style: (dash: "dashed"), label: $Delta y$),
    segment(point(5, f(3)), R, style: (dash: "dotted"), label: $d y$),
    segment(Q, R),
    A,
    B,
  )
]
