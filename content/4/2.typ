#import "../../templates/templater.typ": *

= Volumes

Suppose $S$ is a solid lying between the planes $x-a$ and $x=b$. For each $x in [a,b]$, let $P_x$ be the plane perpendicular to the x-axis ghrough $x$. and let $A(x)$ denote the area of the intersection $S inter P_x$.

To approximate the volume of $S$, divide $[a,b]$ into $n$ subintervals of width $Delta x$, and just like Riemann sum, but with cylinder-shaped object.



#image("../images/volume1", width: 50%)
#image("../images/volume2")

Let's define this pseudo-Riemann sum as the *Volume*.
#definition("Definition of Volume")[
  Let $S$ be a solid that lies between $x=a$ and $x=b$. If the cross-sectional area of $S$ in the plane $P_x$ through x and perpendicular to the x-axis, is $A(x)$, where $A$ is continuous function, then the *volume* of $S$ is
  $ V = lim_(n->oo) sum^n_(i=1) A(x_i^*)Delta x = int^b_a A(x) dx $
]

#example("Sphere")[
  Show that the volume of a sphere of radius $r$ is $V = 3/4 pi r^3$.
  #solution()[
    Let use place the sphere so that its center is at the origin. Then the plane $P_x$ intersects the sphere in a circle of radius $y=sq(r sr - x sr)$.
    #align(center)[#image("../images/volume_sphere", width:30%)]
    So the cross sectional area is
    $ A(x) = pi y sr = pi (r sr - x sr) $
    By definition,
    $
      V &= int^r_(-r) A(x) dx = int^r_(-r) pi (r sr - x sr)dx \
      &= 2pi int^r_0 (r sr - x sr) dx = 4/3 pi r cb
    $
  ]
]

== Volumes of Solids of Revolutions

#theorem()[
  For a *solid of revolution (회전체)*, a cross-section perpendicular to the axis of rotation is a circle. Suppose the region bounded by $y=f(x)$, the x-axis. Then the cross-sectional radius is $abs(f(x))$.
  $ A(x) = pi (f(x)) sr $
  $ V =  $
]

#example()[
  Find the volume of the solid obtained by rotating about the x-axis the retion under the curve $y=sq(x)$ from 0 to 1. Illustrate the definition of volume by sketching a typical approximating cylinder.
  #solution()[

  ]
]

#example()[
  The regionn $scr(R)$ enclosed by the curves $y=x$ and $y=x sr$ is rotated about the $x$-axis. Find the volume of the resulting solid.
  #solution()[
    The curves $y − x$ and $y − x^2$ intersect at the points (0, 0) and (1, 1).
The region between them, the solid of rotation, and a cross-section perpendicular
to the x-axis are shown in Figure 8. A cross-section in the plane Px has the shape of
a *washer (an annular ring)* with inner radius $x^2$ and outer radius $x$ [see Figure 8(c)], so
we find the cross-sectional area by subtracting the area of the inner circle from the area
of the outer circle:
    #image("../images/volume_r")
    We can also interprete this as sbtracting inner volume from outer.
  ]
]

#example()[
  Find the volume of the solid obtained by rotating the region in Example 4
about the line y − 2.
  #solution()[
    $ A(x) = pi (2-x sr) sr - pi (2-x) sr $
  ]
  #solution()[
    parallel transfrom!
  ]
]

#note[
  Always rigorously define cross-section.

  Introduce notation $P_x$ and specify the axis.
]

#example([Torus.. or a cup?])[
  Find the volume of the torus. Left as an exercise.
]

== Finding Volume Using Cross-Sectional Area

We now find the volumes of solids that are not solids of revolution but whose cross-sections have areas that are readily computable.

#example()[
  The figure below shows a solid with a circular _base(밑면)_ of radius 1. Parallel cross-sections perpendicular to the base are _equilatral triangles(정삼각형)_.
  #solution()[
    Since the triangle is equilateral, the height of the cross-section is $sq(3) y = sq(3) sq(1 - x sr)$.
    Therefore the cross-sectional area is
    $ A(x) = 1/2 (2sq(1-x sr))(sq(3)sq(1 - x sr)) = sq(3)(1-x sr) $
    So the volume of the solid is
  ]
]

#theorem([*Cavalieri's Principle*])[
  If a family of parallel planes gives equal cross-sectional areas for two solids $S_1$ and $S_2$, then the volumes of them are equal.
]

