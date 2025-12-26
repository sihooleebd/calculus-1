#import "../../templates/templater.typ": *

We now should discuss the elephant in the room, *derivatives*. 
= Introduction to Derivatives
- So far, we have discussed limits and how they can be used to find the slope of tangents and instantaneous velocity. However, we have not yet formally defined derivatives.
- Derivatives are a way to represent the rate of change of a function at a specific point. In simpler terms, it tells us how quickly the function's output is changing as we make small changes to its input.

#definition("The Tangent Line")[
  The tangent line to the curve $y = f(x)$ at the point $P(a, f(a))$ is the line through $P$ with the slope $ m = lim_(x->a) (f(x) - f(a)) / (x - a) $.
  provided that this limit exists.
  
  As we move the limit closer to $P$, the line more accurately represents the slope of the curve at that point.
  #cartesian-canvas(
    size: (8, 6),
    x-domain: (-2, 3),
    y-domain: (0, 6),
    show-grid: true,
    // Graph of f(x) = x^2
    graph(x => x * x, domain: (-2, 4), label: $f(x) = x^2$),
    // Tangent line at point P(1, 1)
    func(x => 2 * (x - 1) + 1, domain: (-2, 4), label: "", style: (stroke: red)),
    // Point P(1, 1)
    func(x => 3 * (x - 1) + 1, domain: (-2, 4), label: "", style: (stroke: orange)),
    func(x => 2.5 * (x - 1) + 1, domain: (-2, 4), label: "", style: (stroke: lime)),
    
    
    point(1, 1, label: $P(1, 1)$),
    point(1.5, 2.25, label: $Q(1.5, 2.25)$),
    point(2, 4, label: $R(2, 4)$),
  )
]

#example("Derivative Basics")[
  Find the equation of the tangent line to the curve $y = x^2$ at the point $P(2, 4)$.
  #solution("")[
    First, we need to find the slope of the tangent line at point $P$. We can use the definition of the tangent line:
    $ m = lim_(x->2) (f(x) - f(2)) / (x - 2) $
    where $f(x) = x^2$ and $f(2) = 4$.

    So,
    $ m = lim_(x->2) (x^2 - 4) / (x - 2) $
    We can factor the numerator:
    $ m = lim_(x->2) ((x - 2)(x + 2)) / (x - 2) $
    For $x ≠ 2$, we can cancel out $(x - 2)$:
    $ m = lim_(x->2) (x + 2) $
    Now, we can directly substitute $x = 2$:
    $ m = 2 + 2 = 4 $

    Now that we have the slope of the tangent line, we can use the point-slope form of a line to find its equation:
    $ y - y_1 = m(x - x_1) $
    where $(x_1, y_1) = (2, 4)$ and $m = 4$.

    Substituting these values in, we get:
    $ y - 4 = 4(x - 2) $
    Simplifying this, we get:
    $ y - 4 = 4x - 8 $
    $ y = 4x - 4 $

    Therefore, the equation of the tangent line to the curve $y = x^2$ at point $P(2, 4)$ is:
    $ y = 4x - 4 $
    #cartesian-canvas(
      size: (8, 6),
      x-domain: (0, 4),
      y-domain: (0, 10),
      show-grid: true,
      // Graph of f(x) = x^2
      graph(x => x * x, domain: (0, 4), label: $f(x) = x^2$),
      // Tangent line at point P(2, 4)
      graph(x => 4 * x - 4, domain: (0, 4), label: $y = 4x - 4$, style: (stroke: red)),
      // Point P(2, 4)
      point(2, 4, label: $P(2, 4)$),
    )
  ]
]

However, we can have a alternate method for defining derivatives. Imageine we have a points $P$ and $Q$, seperated by a small distance $h$ on the curve of $f(x)$. 
#cartesian-canvas(
  size: (8, 6),
  x-domain: (0, 4),
  y-domain: (0, 10),
  show-grid: true,
  // Graph of f(x) = x^2
  graph(x => x * x, domain: (0, 4)),
  // Secant line between points P and Q
  graph(x => 2.5 * (x - 1) + 1, domain: (0, 4), label: "", style: (stroke: orange)),
  // Points P and Q
  point(1, 1, label: $P(1, 1)$),
  point(1.5, 2.25, label: $Q(1 + h, f(1 + h))$),
)

#definition("Alternative Definition of the Derivative")[
  The derivative of a function $f(x)$ at a point $a$ is defined as :
  $ f'(a) = lim_(h->0) (f(a + h) - f(a)) / h $
  provided that this limit exists.
]

Do you remember the velocity problem we discussed in chapter 0? We can use this definition to find the instantaneous velocity of an object at a specific time.
#definition("Instantaneous Velocity")[
  The instantaneous velocity of an object at time $t = a$ is defined as :
  $ v(a) = lim_(h->0) (s(a + h) - s(a)) / h $
  where $s(t)$ is the position function of the object at time $t$.
  #note("Let's go a bit more...")[
    We can connect a few concepts of basic Physics here. For instance, acceleration can be defined as the derivative of velocity with respect to time. Thus, we have :
    $ a(t) = v'(t) = s''(t) $
    To write it out in the long method, we have :
    $ a(t) = lim_(h->0) (v(t + h) - v(t)) / h = lim_(h->0) ( (s(t + h) - s(t)) / h - v(t) ) / h $
  ]
] 

= Rate of Change
Derivatives can also be used to find the rate of change of one quantity with respect to another. For example, if we have a function that describes the relationship between distance and time, we can use derivatives to find the rate of change of distance with respect to time, which is velocity.
#definition("Rate of Change")[
  The rate of change of a function $f(x)$ with respect to $x$ at a point $a$ is given by the derivative $f'(a)$.
  We can represent it as : 
  $ "rate of change" = (Delta x)/(Delta y) = (f(x_2)-f(x_1))/(x_2-x_1) $
]

#example("Rate Of Change Example")[
  A car travels along a straight road, and its position at time $t$ (in seconds) is given by the function $s(t) = 3t^2 + 2t$. Find the car's velocity at time $t = 4$ seconds.
  #solution("")[
    To find the car's velocity at time $t = 4$ seconds, we need to find the derivative of the position function $s(t)$, which gives us the velocity function $v(t)$.

    The position function is:
    $ s(t) = 3t^2 + 2t $

    We can find the derivative $s'(t)$ using the power rule:
    $ s'(t) = d/(d t)(3t^2) + d/(d t)(2t) $
    $ s'(t) = 6t + 2 $

    Therefore, the velocity function is:
    $ v(t) = 6t + 2 $

    Now, we can find the velocity at time $t = 4$ seconds by substituting $t = 4$ into the velocity function:
    $ v(4) = 6(4) + 2 $
    $ v(4) = 24 + 2 $
    $ v(4) = 26 $

    Thus, the car's velocity at time $t = 4$ seconds is $26$ units per second.
  ]
]

