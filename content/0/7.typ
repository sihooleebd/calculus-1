#import "../../templates/templater.typ": *

= Historical Motivation

In the previous section,
$ limx(1) (x sr - 1)/(x-1) = limx(1) ((x+1)cancel((x-1)))/cancel(x-1) = limx(1) (x+1) = 2 $

We informally say $x$ _approaches_ 1. What is this exactly?

Phillosopher George Berkeley:

"Havent't you said $x-1$ is 0? Why is it sometimes treated as 0 and sometimes not?"
(The ghost number problem)

In 19th century, Cauchy introduced limits as the central concept of calculus, and later Weierstrass formulated modern $epsilon "-" delta$ definition.

Then we say that $f(x)$ approaches $L$ as $x$ approaches $a$, we think of *error* decreasing, i.e., $abs(f(x) - L)$ decreases.

= The Precise Definition

#definition($epsilon"-"delta$)[
  Let $f$ be a function defined on some open interval that contains the number $a$, except possibly at $a$ itself. Then we say that $x$ approaches $a$
  $ forall epsilon > 0 space [exists delta > 0 space [0<abs(x-a)<delta ==> abs(f(x) - L) < epsilon]] $
]

Intuitively, we can think of sort of a _aggressive_ algorithm,

+ Critic suggests an acceptable error $epsilon$
+ Actor provides an appropriate range $delta$ to suffice the suggested error.
+ ....
+ If we can prove that suggesting appropriate range is possible for any given error, we accept the limit value.

#definition($epsilon"-"M$)[

  $ forall M > 0 space [ exists delta > 0 space [0 < abs(x-a) < delta ==> f(x) > M] ] $
]

= LImit Laws Revisited

#theorem("The Laws of Limits")[
  Suppose that $c$ is a constant and the limits $limits(lim)_(x -> a) f(x)$ and $limx(a) g(x)$ exist. Then, the following properties hold:
  #grid(
    columns: (1fr, 12em),
    [
      1. $limx(a) [f(x) + g(x)] = limx(a) f(x) + limx(a) g(x)$

      2. $limx(a) [f(x) - g(x)] = limx(a) f(x) - limx(a) g(x)$

      3. $limx(a) [c dot f(x)] = c dot limx(a) f(x)$

      4. $limx(a) [f(x) dot g(x)]
        = limx(a) f(x) dot limx(a) g(x)$

      5. $limx(a) [f(x) / g(x)]
        = (limx(a) f(x)) / (limx(a) g(x))$, provided that $limx(a) g(x) ≠ 0$
    ],
    [
      #align(right)[Sum Law]
      #align(right)[Difference Law]
      #align(right)[Constant Multiple Law]
      #align(right)[Product Law]
      #align(right)[Quotient Law]
    ]
  )
  #proof()[
    $ limx(a) f(x) = L, wide limx(a) g(x) = M $
    Then we know that there exists delta
    $ 0<abs(x-a) < delta ==> abs(f(x) - L) <  $
  ]
]

= Negation of a limit

We know the rigorous definition of the limit of a function:
$ f : D -> R,wide a in D $
$ limx(a) f(x) = L <==> forall epsilon >0 space exists delta>0 space 0<abs(x-a)<delta ->abs(f(x)-L)<epsilon $

Thus the negation is

$ not[limx(a) f(x) = L <==> forall epsilon >0 space exists delta>0 space 0<abs(x-a)<delta ->abs(f(x)-L)<epsilon] $
$ <==> exists epsilon > 0, forall delta > 0, exists x (0 < |x - a| < delta and |f(x) - L| >= epsilon) $

#example()[
  Using epsilon delta argument, show that $limx(2) x cb != 1$
  #solution()[
    Let $epsilon = 1$, For any $delta > 0$, choose $n in NN$ such that $1/n < delta$, and elt $x=2+1/n$, Then $0<abs(x-2)<delta$, and

    $ abs(x cb - 1) =  $
  ]
]

#example("Dirichlet Function")[
  If the function f is defined by

  $ f(x) = cases(0 wide &"if " x in QQ, 1 wide &"if " x in RR \\ QQ) $

  Show that $limx(0)f(x)$ does not exist.
  #solution("Focusing on negation")[
    Suppose that it exists.

    First we show that $L=0$. Let $epsilon = abs(L)/2$ For andy delta, we can choose $x!=0$ #st it is 0. (Density argument)

    Same applies to $L=1$. The limit value is unique. contradiction.
  ]
]

#definition("Sequential Characterization")[
  A sequence ${a_n}$ has has the limit L and we write
  $ lim_(n -> oo) a_n = L wide n -> oo ==> a_n -> L $
  We have simillar epsilon delta like statement here too.
  Also, we can think of it as
]

Todo: fill it based on the ppt.
