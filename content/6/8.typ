#import "../../templates/templater.typ": *

= Indeterminate forms and l'Hospital's Rule
When direct substitution gives something like $0/0$ or $infinity/infinity$, the graph is telling us that numerator and denominator are racing each other. l'Hospital's Rule compares their rates instead.

#definition("Indeterminate Forms")[
  The two most common indeterminate quotient forms are
  $ 0/0 $
  and
  $ infinity/infinity $
]

#theorem("l'Hospital's Rule")[
  Suppose $f$ and $g$ are differentiable near $a$, with $g'(x) != 0$ nearby. If
  $ lim_(x->a) f(x) = 0 $
  and
  $ lim_(x->a) g(x) = 0 $
  or if both limits are $plus.minus infinity$, then
  $ lim_(x->a) f(x)/g(x) = lim_(x->a) f'(x)/g'(x) $
  provided the limit on the right exists.
  #proof("Sketch using the Mean Value Theorem")[
    The visual idea is that if both functions are heading to the same dangerous place, then the quotient should be controlled by their slopes.

    In the $0/0$ case, for $x != a$, Cauchy's Mean Value Theorem gives a point $c$ between $x$ and $a$ such that
    $ (f(x)-f(a))/(g(x)-g(a)) = f'(c)/g'(c) $
    Since $f(a) = g(a) = 0$, this becomes
    $ f(x)/g(x) = f'(c)/g'(c) $

    As $x -> a$, the point $c -> a$ as well. So if
    $ lim_(x->a) f'(x)/g'(x) = L $
    then
    $ lim_(x->a) f(x)/g(x) = L $

    The $infinity/infinity$ case is handled in the same spirit by applying the argument on a tail interval where both functions are defined and large.
  ]
]

#example("A " + $0/0$ + " Form that Needs Two Differentiations")[
  Evaluate
  $ lim_(x->0) (ln(1+x) - sin(x))/x^2 $
  #solution("")[
    Direct substitution gives $0/0$, so apply l'Hospital's Rule :
    $ lim_(x->0) (ln(1+x) - sin(x))/x^2 = lim_(x->0) (1/(1+x) - cos(x))/(2x) $

    This is still $0/0$, so apply l'Hospital's Rule again :
    $ = lim_(x->0) (-1/(1+x)^2 + sin(x))/2 $
    $ = (-1 + 0)/2 = -1/2 $
  ]
]

#example("An " + $infinity/infinity$ + " Form")[
  Evaluate
  $ lim_(x->infinity) (x^2 + 3x)/e^x $
  #solution("")[
    Direct substitution gives $infinity/infinity$, so apply l'Hospital's Rule :
    $ lim_(x->infinity) (x^2 + 3x)/e^x = lim_(x->infinity) (2x + 3)/e^x $

    This is still $infinity/infinity$, so apply it again :
    $ = lim_(x->infinity) 2/e^x = 0 $
  ]
]
