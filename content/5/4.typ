#import "../../templates/templater.typ": *

= Work
Work is not hard to picture : a force acts while something moves. If the force changes, then we add many tiny pieces of force times distance.

#definition("Work done by a Variable Force")[
  If a force $F(x)$ acts along a line from $x = a$ to $x = b$, then the work done is
  $ W = integral_a^b F(x) d x $
]

#definition("Hooke's Law")[
  For a spring, the force needed to hold it stretched by $x$ units is
  $ F(x) = k x $
  where $k$ is the spring constant.
]

#note("What should we picture?")[
  A spring gets harder to stretch the farther we pull it. So the force graph rises, and the work becomes the area under that rising line.
]

#example("Stretching a Spring over an Interval")[
  A force of $40$ newtons is required to hold a spring stretched $0.25$ meters beyond its natural length. Find the work required to stretch the spring from $0.10$ meters to $0.40$ meters beyond its natural length.
  #solution("")[
    By Hooke's Law,
    $ F(x) = k x $
    and since
    $ 40 = k(0.25) $
    we get
    $ k = 160 $

    Therefore
    $ F(x) = 160 x $

    The required work is
    $ W = integral_(0.10)^(0.40) 160 x d x $
    $ = 160 [ x^2/2 ]_(0.10)^(0.40) $
    $ = 80(0.16 - 0.01) = 12 $

    So the work required is $12$ joules.
  ]
]
