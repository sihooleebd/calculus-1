#import "../../templates/templater.typ": *

In Chapter 1 we defined limits and learned techniques for computing them. We now
revisit the problems of finding tangent lines and velocities from Section 1.4. The special
type of limit that occurs in both of these problems is called a derivative and we will see
that it can be interpreted as a rate of change in any of the natural or social sciences or
engineering.

= Tangents

#definition()[
  The derivative of a function $f$ at a number $a$, denoted by $f'(a)$ is
  $ f'(a) = limx(a) (f(x)-f(a))/(x-a) = lim_(h -> 0) (f(a+h) - f(a))/h $
  Provided that the limit exists.
]

#example()[
  Find the derivative of the function $f(x)=x sr -8x + 9$ at the number 2.
  #solution()[
    $ limx(2) (f(x)-f(2))/(x-2) = limx(2) (x sr -8x + 12)/(x-2) = -4 $
  ]
]

#example()[
  Determine whether $f'(0)$ exists.
  $ f(x) = cases(x sin 1/x &"if" x != 0, 0 &"if" x=0 ) $
  $ f(x) = cases(x sr sin 1/x &"if" x != 0, 0 &"if" x=0 ) $
  #solution()[
    $ (f(x)-f(0))/(x-0) = (x sin (1/x) - 0)/(x-0) = sin 1/x, quad x != 0 $
    We don't know the existence so we put limit afterwards.
    Since $limx(0) sin 1/x$ does not exist, $f$ is not differentiable at 0.
  ]
  #solution()[
    $ (f(x)-f(0))/(x-0) = (x sr sin (1/x) - 0)/(x-0) = x sin 1/x, quad x != 0 $
    Thus,
    $ f'(0) = limx(0) x sin 1/x = 0 $
    Squeeze Theorem.
  ]
]

#definition()[
  The *tangent line* to the curve $y=f(x)$ at the point $P(x, f(x))$ is line through $P$ #st the slope is $f'(x)$.
]

#example()[
  Find an equation of the tangent line to the hyperbola $y=3/x$ at $(3,1)$.
  #solution()[
    $ f'(3) = limx(3) (f(x)-f(3))/(x-3) = limx(3) (3/x-1)/(x-3) = limx(3) (3-x)/(x(x-3)) = limx(3) -1/x = -1/3 $
    So the equation of the tangent line is $y - 1 = -1/3 (x - 3)$, or $y = -1/3 x + 2$.
  ]
]

= Velocities

= Derivatives

= Rates of Change

#definition()[
  Let $y=f(x)$. If x changes from $x_1$ to $x_2$, then the *change (or increment, 증분)* in x is
  $ Delta x = x_2 - x_1 $
  and the corresponding increment in y is
  $ Delta y = f(x_2) - f(x_1) $
  The difference quitient
  $ (Delta y)/(Delta x) = (f(x_2) - f(x_1))/(x_2 - x_1) $
  is called the average rate of change.
]


#definition()[
  Taking the limit as $Delta x -> 0$ gives the *(instantaneous) rate of change*(순간변화율) of $y$ with respect to x at $x = x_1$. That is the derivative:
  $ f'(x) = lim_(Delta x -> 0) (Delta y)/(Delta x) = (f(x_2) - f(x_1))/(x_2 - x_1) $
]

#example("Symmetric difference quotient")[
  Suppose f is differentiable at a. Then
  $ lim_(h->0) (f(a+h) - f(a-h))/(2h) = f'(a) $
  Intuitively.
  #proof()[
    $ &lim_(h->0) (f(a+h) - f(a-h))/(2h) \ &= 1/2 [lim_(h->0)(f(a+h)-f(a))/h + lim_(h->0)(f(a)-f(a-h))/h] \ &= (f'(a) + f'(a))/2 = f'(a) $
  ]
  #note("Remark")[
    The symmetric difference quotient is known to converge faster than usual difference quotient. Moreover, the converse of the statement does not hold in general. This is not a definition, so the differentiability on $a$ may be required.

    #example("Counterexample")[
      $ f(x) = abs(x) $
      $ f'(0) = ? $
    ]
    #example("Exercise")[
      Let f be differentiable at a.

      $ limits(lim)_(h->0) g(c h) = limits(lim)_(t->0) g(t) $
    ]

    #example("Exercise")[
      Let f be differentiable at a.

      $ lim_(h->a) (f(a) - f(a-h))/h = f'(a) $
    ]
  ]
]
