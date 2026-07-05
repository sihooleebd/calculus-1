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

#canvas.cartesian-canvas(
  size: (8, 4.5),
  x-domain: (-0.05, 0.5),
  y-domain: (0, 80),
  x-tick: 0.1,
  y-tick: 20,
  graph.riemann-sum(x => 160 * x, (0.10, 0.40), 60, method: "midpoint", smooth: true, style: (fill: rgb("#c6d8f5"), stroke: none)),
  graph.func(x => 160 * x, domain: (0, 0.45), label: $F(x) = 160x$),
)

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

    The required work is the shaded area above :
    $ W = integral_(0.10)^(0.40) 160 x d x $
    $ = 160 [ x^2/2 ]_(0.10)^(0.40) $
    $ = 80(0.16 - 0.01) = 12 $

    So the work required is $12$ joules.
  ]
]

= When the force is gravity
For lifting problems, the "variable force" usually comes from a changing *amount of stuff* still being lifted, or a changing *distance* each piece must travel. Slice the object, and ask each slice two questions : how heavy are you, and how far do you go?

#example("Hauling up a Hanging Cable")[
  A uniform cable $20$ meters long with mass density $3$ kg/m hangs from the top of a tall building. How much work is required to pull the entire cable up to the top? (Use $g = 9.8$ m/s#super[2].)
  #solution("")[
    Slice the cable. The piece at depth $x$ below the roof has :
    - mass $3 d x$ kilograms, hence weight $3 dot 9.8 d x$ newtons,
    - a trip of length $x$ to reach the top.

    So the work for that one piece is
    $ 29.4 x d x $
    and the total is
    $ W = integral_0^20 29.4 x d x = 29.4 dot 400/2 = 5880 $

    The answer is $5880$ joules. Notice the structure : the *slice* was easy, and the integral did the bookkeeping.
  ]
]

#example("Pumping Water out of a Tank")[
  A cylindrical tank of radius $2$ meters and height $5$ meters is full of water (density $1000$ kg/m#super[3]). Find the work required to pump all of the water over the top rim. (Use $g = 9.8$ m/s#super[2].)
  #solution("")[
    Slice the water horizontally. The layer at height $y$ (measured from the bottom) is a thin disk :
    - volume $pi (2)^2 d y = 4 pi d y$ cubic meters,
    - weight $1000 dot 9.8 dot 4 pi d y$ newtons,
    - lifting distance $5 - y$ meters up to the rim.

    Therefore
    $ W = integral_0^5 9800 dot 4 pi (5 - y) d y $
    $ = 39200 pi integral_0^5 (5 - y) d y $
    $ = 39200 pi dot 25/2 = 490000 pi $

    So the work required is $490000 pi approx 1.54 times 10^6$ joules.
    Deep layers cost more, shallow layers cost less, and the integral averages the whole story.
  ]
]
