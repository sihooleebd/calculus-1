#import "../../templates/templater.typ": *

= Complements

#example()[
  Express the limit as a definite integral:
  $ lim_(n -> oo) 1/n sum^n_(i=1) 1/(1+(i/n)^2) $
  #solution()[
    $Delta x$ is probably $1/n$. $x_i$ is probably $i/n$.
    $ int^1_0 1/(1+x sr) dx $
  ]
]

#example()[
  $
    f(x) = cases(
      0 wide x in QQ,
      1 wide x in QQ comp
    )
  $
  Show that this function is not differentiable on $[0, 1]$.
  #solution()[
    Divide $[0,1]$ into n subintervals of equal width
    $ Delta x = 1/n wide x_i=i/n $
    Let's take sample point in the interval $[x_(i-1), x_i]$ as a rational number. Then, the Riemann sum will be 0.

    If we take sample point to be an irrational number, then Riemann sum will be 1.

    Two sum do not converge to a single value. Contradiction.
  ]
]

#example()[
  Divide $[1,2]$ into n subintervals with an equal width
  $ Delta x wide x_i = (n+i)/n $
  Choose
  $ x_i^* =  $
]

조대따 조대써
