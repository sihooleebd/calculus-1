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

#canvas.cartesian-canvas(
  size: (8, 4.5),
  x-domain: (-1, 26),
  y-domain: (0, 600),
  x-tick: 6,
  y-tick: 125,
  graph.graph(x => 500 * calc.pow(2, -x / 6), domain: (0, 25), label: $A(t) = 500 dot 2^(-t/6)$),
  graph.point(6, 250, label: ""),
  graph.point(12, 125, label: ""),
  graph.point(18, 62.5, label: ""),
)

#note("Read the picture")[
  Every $6$ hours, the height halves : $500 -> 250 -> 125 -> 62.5$. Equal time steps produce equal *ratios*, not equal differences. That is the signature of an exponential process.
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

= Newton's law of cooling
A hot object does not cool at a constant rate : it cools fast while it is much hotter than the room, and slower as it approaches room temperature. The right variable is the temperature *difference*.

#theorem("Newton's Law of Cooling")[
  If $T(t)$ is the temperature of an object in surroundings of constant temperature $T_s$, and
  $ (d T)/(d t) = k(T - T_s) $
  then
  $ T(t) = T_s + (T(0) - T_s) e^(k t) $
  #proof("Shift the variable")[
    Let $y = T - T_s$. Since $T_s$ is constant,
    $ (d y)/(d t) = (d T)/(d t) = k y $
    which is exactly the growth-decay equation. Hence
    $ y = y(0) e^(k t) $
    and adding $T_s$ back gives the formula.
  ]
]

#example("Coffee Cooling in a Room")[
  A cup of coffee at $90 degree$C sits in a $20 degree$C room. After $5$ minutes it has cooled to $60 degree$C. When will it reach $40 degree$C?
  #solution("")[
    Using $T_s = 20$ and $T(0) = 90$ :
    $ T(t) = 20 + 70 e^(k t) $

    The measurement at $t = 5$ gives
    $ 60 = 20 + 70 e^(5k) $
    so
    $ e^(5k) = 4/7 $
    and
    $ k = 1/5 ln(4/7) $

    We want $T(t) = 40$ :
    $ 40 = 20 + 70 e^(k t) $
    $ e^(k t) = 2/7 $
    so
    $ t = ln(2/7)/k = 5 ln(2/7) / ln(4/7) $

    Numerically $t approx 11.2$ minutes. The second $20 degree$ drop takes more than twice as long as the first : the shrinking gap slows everything down, exactly as the differential equation predicted.
  ]
]
