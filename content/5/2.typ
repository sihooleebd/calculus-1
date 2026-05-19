#import "../../templates/templater.typ": *


#definition("The Logarithmic Function")[
  *The logarithmic function* is the function defined by
  $ ln x = int^x_1 1/t dt, wide x>0 $
]

Since $1\/t$ is continuous on $(0,oo)$, the funciton $ln x$ is well-defined for $x>0$.

#grid(
  columns: (1fr, 1fr),

)

#example()[
  + By conparing areas, show that $1/2 <= ln 2 <= 3/4$.

  #solution()[
    From the figure below, the area $y=1/t$ from 1 to 2 is larger than the area of rectangle BCDE and smaller than the area of trapezoid ABCD. Thus we have
    $ 1/2 dot 1 >= ln 2 >= 1 dot 1/2 dot (1 + 1/2) =3/4 $
  ]
]

#example()[
  By comparing areas, show that for $n>= 2$,
  $ 1/2 + 1/3 + dots.c + 1/n < ln n < 1 + 1/2 + 1/3 + dots.c + 1/(n-1) $
  #solution()[
    Since
    $ ln n = int^n_1 1/t dt $
    we can interpret $ln n$ as the area under the curve $y=1/t$ from $t=1$ to $t=n$.

    Divide $[1,n]$ into the unit intervals
    On each interval $[k,k+1]$, the function $1/t$ is decreasing. Hence
    $ 1/(k+1) <= 1/t <= 1/k wide (k <= t <= k+1) $
    Also, $1/t$ is not a constant on the inverval $[k,k+1]$, so
  ]
]

#proof("Power Rule on Rationals")[
  By FTC1, we have
  $ d/ dx ln x = d/ dx int^x_1 1/t dt = 1/x, wide x>0 $
  Now consider
  $f(x) = ln abs(x)$
  Then,
  $ f(x) = cases(ln x\, &wide x>0, ln(-x)\, &wide x<0) $
  Therefore, by the Chain Rule,
  $ f'(x) = cases(1/x\, &wide "if" x>0, 1/(-x) dot (-1) dot \, &wide "if" x<0) $
]

#example()[
  Differentiate the function.
  + $f(x) = ln(x cb + 1)$
  + $g(x) = sq(1+ln x)$
  + $h(x) = (ln x)/(1+ln(2x))$

  #solution()[
    $ f'(x) = 1/(x cb + 1) dot (x cb + 1)' = (3 x sr)/(x cb + 1) $
  ]
  #solution()[
    $ g'(x) = 1/2 dot 1/sq(1 + ln x) dot [1 + ln x]' = 1/(2x sq(1 + ln x)) $
  ]
  #solution()[
    By Quotient Rule,
    $
      h'(x) &= ([ln x]'(1+ln(2x)) - (ln x)[1 + ln (2x)]')/((1+ln(2x))^2) \
      &= (1/x dot (1 + ln (2x)) - (ln x) dot (1/(2x) dot 2))/((ln(2x))^2 + 2 ln (2x) + 1) \
    $
    or
    $
      h'(x) &= (ln x )' dot 1/91+ln(2x) (ln x) dot (1/(1+ ln(2x)))' \
      &= 1/(x[1+ln(2x)]) + (ln x) dot (-1/([1+ln(2x)]^2 )) dot [1 + ln(2x)] '\
      &=1/(x[1+ln(2x)]) - (ln x) ([1+ln(2x)]^2) dot 2/(2x) \
      &= (1+ln 2)/(x[1+ln(2x)]^2)
    $
  ]
]

In general, the Chain Rule gives us the formula

$ d/dx [ln abs(g(x))] = (g'(x))/(g(x)) $
on an interval #st $g(x) != 0$

#example()[
  Let's evaluate $int tan x dx$
]

#example()[
  Let's evaluate $int sec x dx$
  #solution()[
    Let $u = sin x$. Then $du = cos x dx$.
    Therefore,
    $
      int sec x dx &= int 1/(cos x) dx = int 1/(cos sr x) dx \
      &= int 1/(1 - u sr) du = 1/2 int (1/(1+u) + 1/(1-u))du \
      &= 1/2(ln abs(1+u) - ln abs(1-u)) + C
    $
    Substituting $u$ back,
    $ int sec x dx = 1/2(ln (1 + sin x)/(1 - sin x)) + C = ln sq((1 + sin x)/(1 - sin x)) + C $
  ]
  #solution()[
    Multiply numerator and denominator by $tan x + sec x$. Then
    $
      int sec x dx &= int (sec x (tan x + sec x))/(tan x + sec x) dx \
      &=
    $
  ]
]

#theorem("Laws of Logarithms")[
  If x and y are positive numbers and r is a rational number, then
  #set enum(numbering: "(a)")
  + $ln(xy) = ln x + ln y$
  + $ln x/y = ln x - ln y$
  + $ln(x^r) = r ln x$

  #proof("(a)")[
    Fix $ y>0$, and define
    $ F(x) = ln(xy) wide (x>0), $
    By the Chain Rule,
    $ F'(x) = 1/xy dot  $
    show that antiderivative of each side is identical.
  ]

  #proof("(b)")[
    We first prove the *reciprocal rule*. Let $y>0$. By the product law,
    $ ln(1/y) + ln(y) = ln(1/y dot y) = ln 1 = 0 $
    Therefore,
    $ ln(1/y) = - ln(y) $
    Thus,
    $ ln x/y = ln(x dot 1/y) = ln x + ln 1/y = ln x - ln y $
  ]

  #proof("(c)")[
    Before proving part c, we continue our discussion of differentiating power functions. In chapter 2, we proved
    $ d/dx x^n = n x^(n-1), wide n in ZZ \\ {0} $
    We now extend this to ratinoal exponents. To do this, we first take a look at the $n^"th"$ root formula
    $ root(n, x) $
  ]
]

#example()[
  Find $display(d/dx ln (x+1)/sq(x-2))$.
  #solution()[
    $
      d/dx ln(x+1)/sq(x-2) &= d/dx[ln(x+1) - 1/2 ln(x-2)] \
      &= 1/(x+1) - 1/2 (1/(x-2)) \
      &= (x-5)/(2(x+1)(x-2))
    $
    #note[
      Technically, we should have x boundary limited to make log do not go negative.
    ]
  ]
]

#example()[
  To sketch the graph of $y=ln x$, we first determine its end behavior.
  + $display(limx(oo) ln x = oo)$
  + $display(limx(0^+))$
  #proof("(a)")[
    Let $M>0$ be given. Since $ln 2 > 0$, choose a positive integer $n$ #st $n/ln > M$
  ]
]

#note("Base of the Natural Log")[
  $
    e = lim_(n->oo) (1+1/n)^n = sum_(n=0)^oo 1/(n!)
  $
]

#definition("Base of the Natural Log")[
  $e$ is the number such that $ln e = 1$.
]

#proof[
  Since $ln 1 = 0$ and $ln x -> oo$ as $x-> oo$, choose $b>1$ #st $ln b = 2$. Since $ln x$ is continuous on $[1, b]$, IVT guarantees a number $c in (1,b)$ #st $ln c = 1$. We denote the number by $e$. This is unique since $ln x$ is one-to-one function.
]

#theorem("Steps in Logarithmic Differentiation")[
  #set enum(numbering: "Step 1.")
  + Take natural logarithms of both sides of an equation $y=f(x)$ and use the laws of logarithms to expand the expression.
  + Differentiate implicitly with respect to $x$.
  + Solve the resulting equation for $y'$ and replace $y$ by $f(x)$.
]

#example("Practicality of Logarithmic Differentiation")[
  Differentiate the following where $x>0$.
  $ y = (x^(3\/4) sq(x sr + 1))/((3x+2)^5) $
  #solution()[
    Taking log of both sides and using the laws of logarithms, we get
    $ ln y = 3/4 ln x + 1/2 ln(x sr + 1) - 5 ln(3x+2). $
    Differentiating implicitly with respect to $x$ gives
    $ 1/y y' = 3/4 dot 1/x + 1/2 dot 2x dot 1/(x sr + 1) - 5 dot 3 dot 1/(3x+2) $
  ]
]

#example("x over x")[
  Differentiate $y=x^x$, where $x>0$
  #solution()[
    Logarithms of both sides gives
    $ ln y = ln(x^x) = x ln x $
    Differentiating implicitly with respect to $x$, we get
    $ (y')/y = 1 dot ln x + x dot 1/x = ln x + 1 $
    $ ==> y' = y ln x + y = x^x (ln x + 1) $
  ]
]

#example()[
  Let $f(x) = (x+1)^2(x+2)^2(x+3)^2dots.c(x+n)^2$. Find $f'(0)$.
  #solution()[
    For $x>-1$, taking log of both sides gives
    $
      ln(f(x)) &= ln((x+1)^2(x+2)^2(x+3)^2dots.c(x+n)^2) \
      &= 2[ln(x+1)+ln(x+2)+ln(x+3)+dots.c+ln(x+n)]
    $
  ]
]
