#import "../../templates/templater.typ": *

To approximate the area between graph, divide intervals and approximate rectangle just like Riemann sum.

Therefore,
$ A = lim_(n->oo) sum^n_(i=1) [f(x_i^*) - g(x_i^*)]Delta x = int^b_a [f(x) - g(x)] dx $

#image("../images/area_between_graph")

What if $f(x) > g(x)$ is not guaranteed?
$ A = lim_(n->oo) sum^n_(i=1) |f(x_i^*) - g(x_i^*)|Delta x $
Use absolute value, but since it is difficult to compute the integral, divide interval where graphs intersect.

What if the curve is not a function from x to y? Invert it! Calculate with respect to $y$. Or divide curve to multiple functions, so that the curve can be a function of x. (Like implicit deriv)
