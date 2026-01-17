#import "../../templates/templater.typ": *

= Optimizaiton problems
- Say we have velocity graph of a car moving. In a logical scenario, we might want to find *the maximum/minimum acceleration of the car*. How can we do this?

#definition("Local&Absolute Maxima&minima")[
  Let $c$ be a number in the domain $D$ of a function $f$. Then, $f(c)$ is the :
  - *Absolute maximum* if $f(c) gt.eq f(x)$ for all $x$ in $D$.
  - *Absolute minimum* if $f(c) lt.eq f(x)$ for all $x$ in $D$.
  - *Local maximum* if $f(c) gt.eq f(x)$ for $x$ near $c$.
  - *Local minimum* if $f(c) lt.eq f(x)$ for $x$ near $c$.
]

#example("Local Maximum of a Function")[
  Take the function $f(x) = 3x^4 - 16x^3 + 18x^2$ Near the point at $x=1$, what is the local maxima?
  #solution("")[
    We get the following graph when drawn :
    #canvas.cartesian-canvas(
      graph.graph(x => 3 * calc.pow(x, 4) - 16 * calc.pow(x, 3) + 18 * calc.pow(x, 2)),
      graph.point(1, 5),
    )
    Thus we can know that the local maxima near point $1$ is $5$.
  ]
]

