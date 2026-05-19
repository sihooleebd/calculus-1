#import "../../templates/templater.typ": *

Since $f'(x)$ represents the slope of the curve $y=f(x)$ at the point $(x,f(x))$, it tells us the direction in which the curve proceeds at each point.

= I/D Test

#theorem("Increasing/Decreasing Test (I/D Test)")[
  #set enum(numbering: "(a)")
  + If $f'(x) > 0$ on an interval, then f is increasing on that interval
  + If $f'(x) < 0$ on an interval, then f is decreasing on that interval

  $f'(x) = 0$ needs caution.

  #note[
    $
      cases(
        a<b ==> f(a) < f(b) "(strictly) increasing",
        a<b ==> f(a) <= f(b) "(monotonicallly) increasing"
      )
    $
  ]
]

#example()[
  Find where the function
  $ f(x) = 3x^4 - 4x cb - 12 x sr + 5 $
  is increasing or decreasing.
  #solution()[
    $ f'(x) = 12x cb - 12 x sr - 24 x = 12x(x sr - x - 2) = 12x(x+1)(x-2) $
    \ \ \
    #table-plot(horizontal: true, data: ((-1,0,"?"),(sym.dots,"-","?")), headers: ($x$, $f(x)$, $f'(x)$))
    Differentiate to figure out the shape of the graph.
    #grid(columns: (1fr, 1fr), cartesian-canvas(size:(5,5), y-tick: 5, y-domain: (-30,30), x-domain:(-3,3), func(x => 3*calc.pow(x,4) - 4*x*x*x - 12*x*x + 5)), cartesian-canvas(size:(5,5), y-domain: (-30,30), x-domain:(-3,3), y-tick: 5, func(x => 12*calc.pow(x,3) - 12*x*x - 24*x)))
    Each $f(x)$ and $f'(x)$, respectively.
  ]
]

= First Derivative Test

The _First Derivative Test_ is a consequence of the _I/D Test_.

#theorem("First Derivative Test")[
  #set enum(numbering: "(a)")
  Suppose that $c$ is a critical number of a continuous function $f$.
  + If $f'$ changes from positive to negative at $c$, then $f$ has a local maximum at $c$.
  + If $f'$ changes from negative to positive at $c$, then $f$ has a local minimum at $c$.
  + If $f'$ is positive to the left and right of $c$, or negative to the left and right of $c$, then $f$ has no local maximum or minimum at $c$
]

#example()[
  Find the local maximum and minimum values of the function
  $ f(x) x+2 sin x, wide 0<=x<=2pi $
  #solution()[

  ]
]

= Concavity

#definition("Concavity")[
  If the graph of $f$ lies above all of its tangents on an interval $I$, then $f$ is called *concave upward* (위로 오목, 아래로 볼록) on $I$. If the graph of $f$ lies below all of its tangents on $I$, then $f$ is called *concave downward* (아래로 오목, 위로 볼록) on $I$.
  #note[
    This _concavity_ notation is not conventional, we usually use _convexity_. However, since Stewart Textbook is using concavity notation, we follow the prior.
  ]
]

#definition("Inflection Point")[
  A point $P$ on a curve $y=f(x)$ is called an *inflection point* if $f$ is continuous there and the curve changes from concave upward to concave downward or vice versa at $P$.
]

#theorem("Concavity Test")[
  #set enum(numbering: "(a)")
  + If $f''(x) > 0$ on an interval $I$, then the graph of $f$ is concave upward on $I$.
  + If $f''(x) < 0$ on an interval $I$, then the graph of $f$ is concave downward on $I$.
  #note[
    If you are confused, think of the function $y=x sr$, which is definately concave upward.
  ]
]

#theorem("The Second Derivative Test")[
  Suppose $f''$ is continuous near $c$.
  #set enum(numbering: "(a)")

  + If $f'(c) = 0$ and $f''(c)>0$, then $f$ has a local minimum at $c$.
  + If $f'(c) = 0$ and $f''(c)<0$, then $f$ has a local maximum at $c$.

]

#example()[
  Sketch the graph of $ f(x) = x^(2/3) (6-x)^(1/3) $
  #solution()[
    $ f'(x) = 2/3 x^(-1/3) (6-x)^(1/3) - 1/3 x^(2/3) (6-x)^(-2/3) $
    #note[

    ]
  ]
]
