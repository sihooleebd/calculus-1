#import "../../templates/templater.typ": *

= Volumes by cylindrical shells
Sometimes washers force us to rewrite everything in a clumsy way. Shells let us keep the original variable and picture thin hollow cylinders instead.

#definition("Shell Method")[
  When a region is rotated about an axis, a vertical strip can create a cylindrical shell.
  Its volume is approximately
  $ Delta V approx 2 pi ("radius")("height")("thickness") $

  So in the limit,
  $ V = 2 pi integral_a^b ("radius")("height") d x $
]

#note("Why shells are visual")[
  You should imagine wrapping a thin rectangle around the axis. The width becomes thickness, the height stays height, and the distance from the axis becomes radius.
]

#example("Using Shells on the Same Region")[
  Rotate the region between
  $ y = 2x $
  and
  $ y = x^2 $
  on $[0,2]$ about the $y$-axis. Find the volume.
  #solution("")[
    A shell at position $x$ has
    - radius $x$
    - height $2x - x^2$

    Therefore
    $ V = 2 pi integral_0^2 x(2x - x^2) d x $
    $ = 2 pi integral_0^2 (2x^2 - x^3) d x $
    $ = 2 pi [ 2x^3/3 - x^4/4 ]_0^2 $
    $ = 2 pi lr([ 16/3 - 4 ]) = 8 pi / 3 $
  ]
]
