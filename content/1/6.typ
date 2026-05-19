#import "../../templates/templater.typ": *

= Implicit Function

#definition[
  Equation involving x and y of the form $F(x,y)=0$

  Is called the equation in form of *implicit funciton(음함수 형태)*.
]

= Implicit Funciton Theory

#theorem[
  In many cases an equation fo the form $F(x,y) = 0$ determines y as a function of x neara given point.
]

#example()[
  $ x sr + y sr = 25 $
  For points $y>0$,
  $ y = sq(25 - x sr) $
  Fot points $y<0$,
  $ y = -sq(25 - x sr) $
  However, on point $(5,0), (-5,0)$ we can't express y as a function.
]

In some cases, it is difficult to solve an equation expliitly ofr y as a funciton of x. For example, the foilum of Descartes

#example()[
  $ x cb + y cb = 6xy $
  #cartesian-canvas(
    func(t => (3*t / (1 + t*t*t), 3*t*t / (1 + t*t*t)), func-type: "parametric")
  )
]
By the implicit funciton theory, we can express it as a funciton on near the point.

Thus, we can treat $y=f(x)$

#example()[
  $ x sr + y sr = 25 $
  #solution()[
    $ x sr + (f(x))^2 = 25 $
    Differentiate both side
    $ d/dx (x sr + (f(x))^2) = d/dx 25 $
    $ 2x + 2f(x)dot f'(x) = 0 $
    $ f'(x) = -s/f(x) = -x/y $
  ]
]

#example()[
  Find y' of the Descartes foilum
  #solution()[
    $ y cb + x cb = 6xy $
    $ d/dx (y cb + x cb) = d/dx (6xy) $
    $ d/dx ( y cb ) + d/dx ( x cb ) = 6y $
    $ 3y sr dy/dx + 3x sr = 6y $
    $ dy/dx = (6y-3x sr)/(3y sr) wide (y != 0) $
  ]
]

= Second Derivatives of IMplicit Functions

#example()[
  Find $(d sr)/(dx sr) y$ for $ x^4 + y^4 = 16 $
  #solution()[
    Do it twice.
    $ d/dx (x^4 + y^4) = d/dx 16 $
    $ 4x cb + 4 y cb dy/dx = 0 $
  ]
]
