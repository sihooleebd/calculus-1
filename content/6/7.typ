#import "../../templates/templater.typ": *

Sometimes we can't find the exact value of a definite integral. This can happen when an elementary antiderivative is not available, or when the function is known only through data or measurements rather than by a formula. In such cases, we use approximation methods to estimate the value of the integral.

Divide $[a,b]$ into $n$ subintervals of equal length
$ Delta x (b-a)/n, wide x_i = a + i Delta x $

#theorem("Left Endpoint Approximation")[]
#theorem("Right Endpoint Approximation")[]
#theorem("Midpoint Rule")[]
#theorem("Trapezoidal Rule")[
  The Trapezoidal(사다리꼴) Rule approximates the area
]

#notation()[
  $L_n$: Left Endpoint Approximation \
  $R_n$: Right Endpoint Approximation \
  $M_n$: Midpoint Rule \
  $T_n$: Trapezoid Rule
]

#theorem[
  The Midpoint Rule is usually more accurate than the Trapezoidal Rule. Geometrically, a midpoint rectangle has the same area as a trapezoid whose upper side is tangent line on the midpoint,
]

#definition[
  The *error* is the amount that must be added to an approximation to obtain the exact value. Thus
  $ E_T = int^b_a f(x) dx = T_n, wide E_M = int^b_a f(x) dx = M_n $
]

#theorem()[
  Suppose $abs(f''(x))<= K$ for $a <= x <= b$. If $E_T$ and $E_M$ are the errors of trapezoidal and midpoint rule, respectively.
  $ abs(E_T) <= (K(b-a)^3)/(12 n sr), wide abs(E_M) <= (K(b-a)^3)/(24 n sr) $
]

#theorem("Simpson's Method")[
  Assumes that $n$ is _even_. Divide $[a,b]$ into $n$ subintervals of equal length
  $ Delta x = (b-a)/n, wide x_i = a + i Delta x quad quad  $

  Basically approximates a curve by pieces of *parabolas*. To derive the formula, consider one typical piece with three equal spaced points. WLOG,
  $ P_0(-h, y_0), wide P_1(0, y_1), wide P_2(h, y_2) $
  This simplified setup is enough for demo.
  Let $ y = A x sr + B x + C$ be the parabola through these three points. area is
  $ int^h_(-h) (A x sr + B x + C) dx = 2 int^h_0 (A x sr + C ) dx + 2 [1/3 A x cb + C x]^h_0 $

  Error bound: $ abs(E_s) <= (K(b-a)^5)/(180n^4) "for" K>=abs(f^((4))(x)) $
]

#example()[
  The figure below shows data traffic on the link from the United States to SWITCH, the Swiss academic and research network, during one full day. $D(t)$ is the data thoughput, measured in megabits per seconds ($M b\/s$). Use Simpson's Law to approximately evaluate the total amount of data transmitted on the link from midnight to noon on that day.
  #image("../images/7_7", width: 50%)
  #solution()[

  ]
]

#note[

]

#example()[
  Estimate the error in the Midpoint Rule approximation for each integral with the given value of $n$. Use a reasonable hand estimate for an upper bound of second derivative.
  $ int^2_(-1) e^(x + cos x) $
  $ int^1_0  $
  #note[
    You should actuall differentiate thrice, because in order to find the upper bound of second derivative, you should know its derivative to figure out how does the graph look like.

    Some functions are not able to find upper bound analytically. In this case, you can either use computer to find the boundary, or use a function that is certainly bigger than the target function. You can also suggest a reasonable upper bound, that is not the absolute theoretical minimum but small enough to argue that your statement is still.
  ]
]

#note[
  Exact error bound of Simpson's Rule is proportional to the fourth derivative of the function. What if the function is polynomial and has a degree lower than 4? Every polynomial that has degree below or equal to cubic function, Simpson's Method is *exact* regardless of $n$.
]
