#import "../../templates/templater.typ": *

= Volumes
When a plane region rotates, a thin slice turns into a solid piece. The main question is : what does one slice become?

#definition("Disk and Washer Methods")[
  If a slice perpendicular to the axis of rotation has outer radius $R(x)$ and inner radius $r(x)$, then
  $ V = pi integral_a^b [ R(x)^2 - r(x)^2 ] d x $

  If there is no hole, then $r(x) = 0$ and we get the *disk method* :
  $ V = pi integral_a^b R(x)^2 d x $
]

#note("Visualize one cross-section")[
  A slice becomes a disk if it fills in the middle. It becomes a washer if there is an empty hole in the middle.
]

#example("A Washer Method Example")[
  Find the volume obtained by rotating the region between
  $ y = 2x $
  and
  $ y = x^2 $
  on $[0,2]$ about the $x$-axis.
  #solution("")[
    On $[0,2]$, the outer curve is
    $ y = 2x $
    and the inner curve is
    $ y = x^2 $

    So the outer radius is
    $ R(x) = 2x $
    and the inner radius is
    $ r(x) = x^2 $

    Therefore
    $ V = pi integral_0^2 [ (2x)^2 - (x^2)^2 ] d x $
    $ = pi integral_0^2 (4x^2 - x^4) d x $
    $ = pi [ 4x^3/3 - x^5/5 ]_0^2 $
    $ = pi lr([ 32/3 - 32/5 ]) = 64 pi / 15 $
  ]
]
