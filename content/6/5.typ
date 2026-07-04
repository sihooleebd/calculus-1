#import "../../templates/templater.typ": *

= Exponential growth and decay
The most important picture here is feedback : the bigger the quantity is, the faster it changes. That is exactly what the equation $y' = k y$ says.

#theorem("Growth and Decay Model")[
  If a quantity $y$ satisfies
  $ d y/(d t) = k y $
  then the solution is
  $ y = C e^(k t) $

  If $k > 0$, this is growth.
  If $k < 0$, this is decay.
  #proof("Separate the variables")[
    Assuming $y != 0$, we can write
    $ 1/y d y = k d t $
    Integrate both sides :
    $ integral 1/y d y = integral k d t $
    $ ln|y| = k t + C_1 $

    Exponentiating gives
    $ |y| = e^(C_1) e^(k t) $
    so after absorbing the constant and sign into one symbol, we get
    $ y = C e^(k t) $
  ]
]

#definition("Doubling Time and Half-Life")[
  For the model $y = C e^(k t)$ :
  - The doubling time is $T = ln(2)/k$ if $k > 0$
  - The half-life is $T = ln(2)/|k|$ if $k < 0$
]

#example("Radioactive Decay with a Time Question")[
  A sample begins with $500$ mg of a substance and has half-life $6$ hours.
  Find the amount remaining after $14$ hours, and find when the amount first drops below $100$ mg.
  #solution("")[
    The decay model is
    $ A(t) = 500 e^(k t) $
    Since the half-life is $6$ hours,
    $ 250 = 500 e^(6k) $
    so
    $ e^(6k) = 1/2 $
    and
    $ k = -ln(2)/6 $

    Thus
    $ A(t) = 500 e^(-t ln(2)/6) = 500 dot 2^(-t/6) $

    After $14$ hours,
    $ A(14) = 500 dot 2^(-14/6) $

    To find when the amount falls below $100$ mg, solve
    $ 500 dot 2^(-t/6) = 100 $
    $ 2^(-t/6) = 1/5 $
    Taking natural logarithms,
    $ -t/6 ln(2) = -ln(5) $
    so
    $ t = 6 ln(5)/ln(2) $

    Therefore the amount first drops below $100$ mg after
    $ 6 ln(5)/ln(2) $
    hours, which is about $13.93$ hours.
  ]
]
