#import "../../templates/templater.typ": *

= Indeterminate forms and l'Hospital's Rule
When direct substitution gives something like $0/0$ or $infinity/infinity$, the graph is telling us that numerator and denominator are racing each other. l'Hospital's Rule compares their rates instead.

#definition("Indeterminate Forms")[
  The two indeterminate *quotient* forms are
  $ 0/0 quad "and" quad infinity/infinity $
  Five more indeterminate forms reduce to these :
  $ 0 dot infinity, quad infinity - infinity, quad 0^0, quad infinity^0, quad 1^infinity $
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

#note("Two warnings before we compute anything")[
  1. Check the form *every single time*. Applying the rule to a limit that is not $0/0$ or $infinity/infinity$ produces confident nonsense.
  2. The rule differentiates the top and the bottom *separately*. It is not the quotient rule.
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

= Indeterminate products and differences
#note("The conversion trick")[
  For a $0 dot infinity$ product, push one factor into the denominator :
  $ f g = f/(1\/g) $
  For an $infinity - infinity$ difference, combine into a single fraction first (common denominators are usually enough).
]

#example("A " + $0 dot infinity$ + " Product")[
  Evaluate
  $ lim_(x->0^+) sin(3x) ln(sin(3x)) $
  #solution("")[
    As $x -> 0^+$, the factor $sin(3x) -> 0^+$ while $ln(sin(3x)) -> -infinity$ : a $0 dot infinity$ tug-of-war.

    Substituting $t = sin(3x)$, which slides to $0^+$, the limit becomes
    $ lim_(t->0^+) t ln(t) = lim_(t->0^+) ln(t)/(1/t) $
    which is $(-infinity)/infinity$. l'Hospital's Rule gives
    $ lim_(t->0^+) (1/t)/(-1/t^2) = lim_(t->0^+) (-t) = 0 $

    The polynomial-ish factor wins : $0 dot infinity = 0$ here, but only because we *proved* it.
  ]
]

#example("An " + $infinity - infinity$ + " Difference")[
  Evaluate
  $ lim_(x->0) lr([ 1/ln(1+2x) - 1/(2x) ]) $
  #solution("")[
    Both terms blow up near $0$, with the same sign on each side. Combine them :
    $ 1/ln(1+2x) - 1/(2x) = (2x - ln(1+2x))/(2x ln(1+2x)) $

    Write $u = 2x$ to reduce clutter ; as $x -> 0$, $u -> 0$ and the limit is
    $ lim_(u->0) (u - ln(1+u))/(u ln(1+u)) $
    which is $0/0$. Apply l'Hospital :
    $ lim_(u->0) (1 - 1/(1+u))/(ln(1+u) + u/(1+u)) = lim_(u->0) (u\/(1+u))/(ln(1+u) + u/(1+u)) $
    Multiply top and bottom by $(1+u)$ :
    $ = lim_(u->0) u/((1+u)ln(1+u) + u) $
    Still $0/0$ ; one more round :
    $ = lim_(u->0) 1/(ln(1+u) + 1 + 1) = 1/2 $
  ]
]

= Indeterminate powers
For $0^0$, $infinity^0$ and $1^infinity$, take logarithms : the exponent comes down, the power becomes a product, and we are back on familiar ground. At the very end, exponentiate.

#example("A " + $1^infinity$ + " Power")[
  Evaluate
  $ lim_(x->0) (cos(2x))^(1/x^2) $
  #solution("")[
    The base tends to $1$ and the exponent to $infinity$ : a $1^infinity$ form. Let $L$ be the limit and take logarithms :
    $ ln(L) = lim_(x->0) ln(cos(2x))/x^2 $
    which is $0/0$. l'Hospital's Rule :
    $ ln(L) = lim_(x->0) (-2 tan(2x))/(2x) = - lim_(x->0) tan(2x)/x $
    This is $0/0$ once more, and a second application gives
    $ ln(L) = - lim_(x->0) (2 sec^2(2x))/1 = -2 $

    Therefore
    $ L = e^(-2) $
    The graph of $(cos 2x)^(1/x^2)$ looks like it should collapse to $1$, yet instead it hovers near $0.135$. Powers of nearly-$1$ numbers are dangerous.
  ]
]

#example("An " + $infinity^0$ + " Power")[
  Evaluate
  $ lim_(x->infinity) x^(1/x) $
  #solution("")[
    The base runs to $infinity$ and the exponent to $0$. Take logarithms :
    $ ln(L) = lim_(x->infinity) ln(x)/x $
    which is $infinity/infinity$. l'Hospital's Rule gives
    $ ln(L) = lim_(x->infinity) (1/x)/1 = 0 $
    so
    $ L = e^0 = 1 $
    Huge numbers raised to dying exponents settle at $1$ : logarithmic growth is simply too slow to fight the $1/x$.
  ]
]

= A capstone : every chapter at once
#example("A Limit of an Accumulated Exponential")[
  Let
  $ f(x) = exp(integral_2^x tan^(-1)(sinh(2-t)) d t) $
  Find
  $ lim_(x->2) (f'(x))/(x^2 - 4) $
  #solution("")[
    First differentiate $f$ with the chain rule and the Fundamental Theorem Part I :
    $ f'(x) = f(x) dot tan^(-1)(sinh(2-x)) $

    At $x = 2$ the integral is empty, so $f(2) = e^0 = 1$, while $tan^(-1)(sinh(0)) = 0$. The requested limit is therefore $0/0$ in disguise :
    $ lim_(x->2) (f'(x))/(x^2-4) = lim_(x->2) f(x) dot (tan^(-1)(sinh(2-x)))/(x^2-4) $

    The first factor tends to $1$. For the second, apply l'Hospital's Rule :
    $ lim_(x->2) (tan^(-1)(sinh(2-x)))/(x^2-4) = lim_(x->2) (-cosh(2-x)\/(1+sinh^2(2-x)))/(2x) $

    Since $1 + sinh^2(u) = cosh^2(u)$, the numerator simplifies to $-1/cosh(2-x)$, which tends to $-1$. The denominator tends to $4$.

    Therefore
    $ lim_(x->2) (f'(x))/(x^2-4) = 1 dot (-1/4) = -1/4 $
    One limit, and it quietly used the FTC, hyperbolic identities, inverse trig, and l'Hospital : the whole chapter in one line.
  ]
]
