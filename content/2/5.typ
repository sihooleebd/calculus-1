#import "../../templates/templater.typ": *

#note[
  Always check *Periodicity*, *Symmetry*, *Domain* of the function.
]

#note[
  + Intervals of Increase and Decrease
  + End Behaviour
    + Asymptotes (Horizontal, Slant)
  + Horizontal Asymptotes
  + Concavity
  + Intervals of Increase or Decrease
  + Local Maximum or Minimum Values
  + Points of Inflection
  + Domain
  + Intercepts
  + Symmetry
  + #sym.dots.v
]

#definition()[
  f has a slant aymptote of $m x + b$ when
  $ limx(oo) [f(x) - (m x + b)] = 0 $
]

#theorem()[
  If
  $ limx(oo) (f(x))/x = m $
  $ limx(oo) (f(x) - m x) = b $
  Then,
  $ limx(oo) [f(x) - (m x + b)] = 0 $
]

#example()[
  Find the slant asymptote of $f(x) = sq(4 x sr + 4 x)$
  #solution()[
    $ limx(oo) (f(x))/x = limx(oo) sq(4 + 4/x) = 2 $
    $ limx(oo) [f(x) - 2 x] = limx(oo) ((cancel(4 x sr) + 4 x) - cancel(4 x sr))/(sq(4x sr + 4x) + 2x) =1 $
    Therefore, it has a slant asymptote $y=2x+1$.
  ]
]

#example()[
  Use the guidlines to sketch the curve
  $ y = (2 x sr)/(x sr - 1) $
  #solution()[
    *Domain*: $RR \\ {-1, 1}$ \
    *Intercepts*: x-intercepts 0, y-intercepts 0 \
    *Symmetry*: Even function. \
    *Periodicity*: any nonconstant rational function is not a periodic function. \
    *Asymptote*: \
    _Horizontal asymptotes._
    $ limx(oo) (2x sr)/(x sr - 1) = 2 ==> y=2 $
    Since f is even,
    $ limx(-oo) f(x) = 2 $
    Thus $y=2$ is the only horizontal asymptote. \
    Alternatively, $ f(x) = 2+ 2/(x sr - 1)$ \
    Since there is a horizontal asymptote, obviously, slant asymptote doesn't exist. \
    _Vertical Asymptotes_ \
    For $x!=1$, f is continuous. Thus the only possible candidates are $x=plus.minus 1$.
    $ limx(-1^-)f(x) = -oo wide limx(-1^+)f(x) = oo $
    $ limx(1^-)f(x) = -oo wide limx(1^+)f(x) = oo $
    *Intervals of Increase or Decrease, Local Maximum or Minimum Values, Concavity, and Points of Inflection*: \
    TODO
//    #cartesian-canvas(
//      func(x => (2 * x * x)/(x * x - 1))
//    )

  ]
  #note[
    Prove
    *Periodicity*: any nonconstant rational function is not a periodic function. \
    $ P/Q = c $
    $ P - c Q = 0 $
  ]
]

#example()[
  Sketch the curve
  $ y=sq(x sr + x) - x - 1 $
]
