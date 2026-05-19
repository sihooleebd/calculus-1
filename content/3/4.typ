#import "../../templates/templater.typ": *

#notation()[
  $ int f(x) dx $
  This is equivalent as the antiderivative of $f$. This is called an *indefinite integral* of function $f$.

  Despite the variable for integral should be other than $x$, we allow $x$ for indefinite integral.
]

#note[
  If the antiderivative is not continuous, we consider that the indefinite integral is defined on the interval which is valid.
]

#theorem("Net change theorem")[
  The integral of a rate of change is the net change:
  $ int^b_a F'(x) dx = F(b) - F(a) $
  Basically FTC...
]

#note[
  If $v(t) $ changes sign, then it gives the displacement. However, if $v(t)$ is always positive, i.e., if v is speed rather than velocity, the integral gives the distance traveled.
]

