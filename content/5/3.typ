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
  This definition gives value *for all* real numbers. Equivalently,
  $ e^x = y <==> ln y = x $
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
  + $e^(x+y) = e^x e^y$
  + $display(e^(x-y) = e^x/e^y)$
  + $display((e^x)^r = e^(x r))$
  #proof("(a)")[

  ]
]

= Differentiation and Integration

Let's use the differentiation of inverse funciton.

Let $y = e^x$. Then $ln y = x$. Using Leibniz notation,
$ dy/dx = 1/(dx\/dy) = 1/(d(ln y)\/dy) = 1/(1\/y) = y = e^x $
#theorem("Differentiation and Integration of Exponential Function")[
  Therefore,
  $ d/dx e^x = e^x $
  Also,
  $ int e^x dx = e^x + C $
]

#example()[

]

= Graphing

The graph of $y=e^x$ is obtained by reflecting the graph of $y=ln x$ with respect to $y=x$, since it is an inverse funciton of $ln x.$

The exponnetial funciton $f(x) = e^x$ is an increasing continuous function with domain $RR$ and has a horizontal asymptote of $y=0$.
$ limx(oo) e^x = oo wide limx(-oo) e^x = 0 $
#cartesian-canvas(
  graph(x=>calc.exp(x))
)

#example()[

]
