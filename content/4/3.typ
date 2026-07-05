#import "../../templates/templater.typ": *

= The Fundamental Theorem of Calculus
This is the moment where the picture clears up. The process of *accumulating* area and the process of *measuring* instantaneous change undo one another.

#definition("Accumulation Function")[
  If $f$ is continuous on $[a,b]$, the function
  $ F(x) = integral_a^x f(t) d t $
  is called an *accumulation function* : it records the signed area collected from $a$ up to the moving position $x$.
]

- Before any theorem, look at a concrete pair. Below, the accumulation of $f(t) = sin(t)$ starting at $0$ is $F(x) = 1 - cos(x)$. Where $sin$ is positive, $F$ climbs ; where $sin$ is negative, $F$ drains back down.

#canvas.cartesian-canvas(
  size: (8, 4.5),
  x-domain: (-0.4, 6.6),
  y-domain: (-1.5, 2.5),
  show-grid: true,
  graph.graph(x => calc.sin(x), domain: (0, 6.4), label: $f(t) = sin(t)$),
  graph.graph(x => 1 - calc.cos(x), domain: (0, 6.4), label: $F(x)$),
)

#theorem("Fundamental Theorem of Calculus Part I")[
  If $f$ is continuous on $[a,b]$, and if
  $ F(x) = integral_a^x f(t) d t $
  then
  $ F'(x) = f(x) $
  #proof("Think of a thin strip")[
    Compare $F(x+h)$ and $F(x)$ :
    $ F(x+h) - F(x) = integral_x^(x+h) f(t) d t $

    Geometrically, this is the area of a very thin strip of width $h$. Because $f$ is continuous, the height across that strip is almost constant and looks like $f(x)$.

    More precisely,
    $ (F(x+h)-F(x))/h = 1/h integral_x^(x+h) f(t) d t $
    and as $h -> 0$, the average height on that tiny interval approaches $f(x)$.

    Therefore
    $ F'(x) = lim_(h->0) (F(x+h)-F(x))/h = f(x) $
  ]
]

#example("Differentiating an Accumulation Function")[
  Let
  $ F(x) = integral_1^(x^3) ln(1+t^2) d t $
  Find $F'(x)$.
  #solution("")[
    First picture the inside quantity $x^3$ as the moving upper bound. By Part I,
    the derivative of the area function is the integrand evaluated at that moving bound, and then we multiply by the derivative of the bound.

    So
    $ F'(x) = ln(1+(x^3)^2) dot d/(d x)(x^3) $
    $ = 3x^2 ln(1+x^6) $
  ]
]

#example("Differentiate First, Integrate Second")[
  Evaluate
  $ integral_0^1 d/(d x) lr([ integral_3^(x^2) 1/(t^2+1) d t ]) d x $
  #solution("")[
    Work from the inside out. By Part I with the moving bound $x^2$,
    $ d/(d x) integral_3^(x^2) 1/(t^2+1) d t = 1/((x^2)^2+1) dot 2x = (2x)/(x^4+1) $
    Notice that the lower bound $3$ has completely vanished : a constant starting line never affects the *rate* of accumulation.

    Now integrate this from $0$ to $1$. Substituting $u = x^2$ (so $d u = 2x d x$),
    $ integral_0^1 (2x)/(x^4+1) d x = integral_0^1 1/(u^2+1) d u = lr([ tan^(-1)(u) ])_0^1 = pi/4 $
  ]
]

#example("A Nested Accumulation Function")[
  Let
  $ f(x) = integral_0^(g(x)) 1/sqrt(1+t^3) d t $
  where
  $ g(x) = integral_0^(cos(x)) lr([ 1 + sin(t^2) ]) d t $
  Find $f'(pi/2)$.
  #solution("")[
    Differentiate the outer layer with Part I and the chain rule :
    $ f'(x) = 1/sqrt(1+g(x)^3) dot g'(x) $

    The inner layer has moving bound $cos(x)$, so
    $ g'(x) = lr([ 1 + sin(cos^2(x)) ]) dot (-sin(x)) $

    Now evaluate at $x = pi/2$. Since $cos(pi/2) = 0$,
    $ g(pi/2) = integral_0^0 lr([ 1 + sin(t^2) ]) d t = 0 $
    and
    $ g'(pi/2) = lr([ 1 + sin(0) ]) dot (-1) = -1 $

    Therefore
    $ f'(pi/2) = 1/sqrt(1+0) dot (-1) = -1 $
  ]
]

#example("A Function Born from Riemann Sums")[
  For $x > 0$, define
  $ f(x) = lim_(n->infinity) sum_(k=1)^n x/n sqrt(1 + ((k x)/n)^2) $
  Find $f'(2)$.
  #solution("")[
    Read the sum backwards, exactly as in the previous section. With
    $ Delta t = x/n $
    and sample points
    $ t_k = (k x)/n $
    on $[0, x]$, the sum is a Riemann sum for $sqrt(1+t^2)$. Hence
    $ f(x) = integral_0^x sqrt(1+t^2) d t $

    We have no idea (yet) how to compute this integral in closed form, and we do not need to : Part I gives
    $ f'(x) = sqrt(1+x^2) $
    so
    $ f'(2) = sqrt(5) $
  ]
]

#theorem("Fundamental Theorem of Calculus Part II")[
  If $f$ is continuous on $[a,b]$ and $F$ is any antiderivative of $f$, then
  $ integral_a^b f(x) d x = F(b) - F(a) $
  #proof("Area and antiderivatives differ only by a constant")[
    Define
    $ G(x) = integral_a^x f(t) d t $
    Then Part I tells us
    $ G'(x) = f(x) $

    But $F'(x) = f(x)$ as well, so
    $ G'(x) = F'(x) $
    This means $G(x) - F(x)$ has derivative $0$, so it must be a constant.

    Evaluate at $x = a$ :
    $ G(a) = integral_a^a f(t) d t = 0 $
    Hence
    $ G(x) = F(x) - F(a) $
    Putting $x = b$ gives
    $ integral_a^b f(x) d x = G(b) = F(b) - F(a) $
  ]
]

#example("Evaluating a Definite Integral with a Logarithmic Antiderivative")[
  Evaluate
  $ integral_1^e (2 ln(x))/x d x $
  #solution("")[
    We look for an antiderivative. Since
    $ d/(d x) (ln(x))^2 = 2 ln(x)/x $
    we can take
    $ F(x) = (ln(x))^2 $

    Therefore
    $ integral_1^e (2 ln(x))/x d x = [ (ln(x))^2 ]_1^e $
    $ = (ln(e))^2 - (ln(1))^2 = 1 - 0 = 1 $
  ]
]

#note("The two parts in one sentence")[
  Part I says differentiation undoes accumulation. Part II says accumulation can be computed by reversing differentiation. Together : the tangent problem and the area problem from chapter 0 were secretly the same problem.
]
