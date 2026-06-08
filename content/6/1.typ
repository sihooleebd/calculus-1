#import "../../templates/templater.typ": *

The Product Rule states that
$ d/dx[f(x)g(x)] = f(x)g'(x) + g(x) f'(x) $
Integrated both sides, we get
$ int[f(x)g'(x) + g(x)f'(x)]dx = f(x)g(x) $
Thus,

#theorem("Integration by Parts")[
  $ int f(x)g'(x) dx = f(x)g(x) - int g(x)f'(x)dx $
  This is the formula for *integration by parts*
]

#theorem("")[
  For definite integrals,
]

#notation()[
  It is usually written in the following form. Let $u=f(x)$ and $v=g(x)$. Then $du = f'(x) dx$ and $dif v = g'(x)dx.$ Therefore,
  $ int u dif v = u v - int v du $
]

#example()[
  Find $display(int x sin x dx)$
  #solution()[
    Let
    $
      u = x, wide dif v = sin x dx, \
      du = dx, wide v = -cos x
    $
    $ int x sin x dx = x dot (-cos x) - int (-cos x) dot dx $
  ]
]

#example()[
  $ int ln x dx $
  #solution[
    $ int ln x dx = int 1 dot ln x dx = x ln x - int x dot 1/x dx = x ln x - x + C $
  ]
]

#example()[
  Prove the reduction formula
]

= Tabluar Method

The tabular method is a shortcut for repeated integratino by parts. Choose the factor to differentiate and the factor to integrate. Then make a table with three columns:
$ "signs," wide "differentiate," wide "integrate" $

#example()[
  Evaluate $display(int e^(-x) sin x dx)$
  #solution()[
//    #table-plot(
//      horizontal: true,
//      headers: ("S", "D", "I"),
//      data: (("(+)", $e^(-x)$, $sin x$))
//    )
  ]
]
