#import "../../templates/templater.typ": *

In the previous section, we learned how to find the volume of a solid of revolution by using cross-sectional areas. However, finding the area can sometimes be problematic.

#cartesian-canvas(
  x-domain: (-0.3, 2),
  y-domain: (-0.3, 1.5),
  func(x => 2 *x*x - x*x*x, domain: (0,2))
)

You'll have to find an inverse function of a third degree polynomial...

= The Method of Cylindrical Shells
#image("../images/shell1")
#image("../images/shell2")

We can divide the solid vertically, creating set of cylindrical shell. Then we can first calculate the volume of each shell, then add it to obtain the volume.

The volume of the cylinder shell can be calculated by removing inner cylindrical hollow $V_1$ from the outer cylindrical volume $V_2$.

$
  V &= V_2 - V_1 \
  &= pi r_2 sr h - pi r_1 sr h = pi(r_2 sr - r_1 sr)h \
  &= pi(r_2 + r_1)(r_2 - r_1)h \
  &= 2pi(r_2+r_1)/2 h(r_2-r_1) = 2pi r h Delta r
$

Here, while rotating about the y axis and the solid is defined using graph $y=f(x)$, then

$ V_i = 2 pi x_i^* f(x_i) Delta x $
$ lim_(n->oo) sum^n_(i=1) V_i = lim_(n->oo) 2 pi x_i^* f(x_i) Delta x $
$ int^b_a 2 pi x f(x) dx $

#theorem()[
  The volume of the solid obtained by the cylindrical shell method about the y-axis, the region under the curve $y=f(x)$ from $a$ to $b$, is
  $ V = int^b_a 2 pi x f(x) dx wide "where" 0<= a < b $
]
