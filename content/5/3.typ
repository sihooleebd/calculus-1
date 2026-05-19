#import "../../templates/templater.typ": *

Since $ln x$ is increasing on $(0,oo)$, it is one-to-one and has an inverse function. We denote its inverse by $exp$. Thus
$ exp(x) = y <==> ln y = x $

In particular,
$ exp(0) = 1 "since" ln 1 = 0, $
$ exp(1) = e "since" ln e = 1. $

If $r$ is rational, then
$ ln(e^r) = r ln e = r $
Thus, by the definition of $exp$,
$ exp(r) = e^r $
#definition()[
  This motivates the definition
  $ e^x := exp(x) $
  *for all* real numbers.
]
#note[
  This way, we can completely avoid using limits while defining exponential function.
]

#theorem("Cancelation Equation")[
  $
    e^(ln x) = x&, wide x>0 \
    ln (e^x) = x&, wide x in RR
  $
]

#theorem("The Laws of Exponents")[
  #set enum(numbering: "(a)")
  + $$
  #proof[

  ]
]

= Differentiation and Integration

Let $y = e^x$. Then $ln y = x$. Using Leibniz notation,
$ dy/dx = 1/(dx\/dy) = 1/(d(ln y)\/dy) = 1/(1\/y) = y = e^x $
Therefore,
$ d/dx e^x = e^x $
Also,
$ int e^x dx = e^x + C $
