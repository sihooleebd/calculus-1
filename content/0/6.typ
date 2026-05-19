#import "../../templates/templater.typ": *

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
]

#theorem()[
  $ limx(a) c = c $
  $ limx(a) x = a $
  We just take it and accept it.

  Constant Multiple Law should be derived from here fundamentally.
]

#example()[
  #align(center)[
    #image("../images/1_7_ex1", width: 50%)
  ]

  $ limx(-2)f(x)+g(x) wide limx(1)f(x)g(x) wide limx(2)(f(x))/(g(x)) $
  #solution()[

  ]
]

#note[
  Even when $limx(a) f(x)$ and $limx(a) g(x)$ do not exist, $limx(a) f(x)+g(x)$ may exist.
  #proof()[
    $ f(t) = cases(0"  if "t<0, 1"  if "t>=0) $
    $ g(t) = cases(1"  if "t<0, 0"  if "t>=0) $
  ]
  Try finding more complex antiexample! (Exercise)
]


#theorem("The Power Law of Limits")[
  Suppose that $limx(a) f(x) = L$ and $n$ is a positive integer. Then,
  $limx(a) [f(x)]^n = [limx(a) f(x)]^n = L^n$
]

#theorem("The Root Law of Limits")[
  Suppose that $limx(a) f(x) = L$ and $n$ is a positive integer. Then,
  $limx(a) [f(x)]^(1/n) = [limx(a) f(x)]^(1/n) = L^(1/n)$, provided that if $n$ is even, then $L ≥ 0$
]

#example()[
  $ (a)space limx(-2) (2x sr - 3x + 4) wide (b) space limx(-2)(x cb+2x sr -1)/(2x sr - 3x + 4) $
  #solution()[
    $ limx(-2) (2x sr - 3x + 4) = limx(-2)2x sr - limx(-2)3x + limx(-2)4 $
    $ = 2(limx(-2)x) sr - 3limx(-2)x + 4 = 2dot (-2)sr - 3 dot (-2) + 4 = 18 $
    Simillar for the rest.
  ]
]

#theorem("Direct Substitution Property")[
  If $f$ is a polynomial or a rational function and $a$ is in the domain, then
  $ limx(a) f(x) = f(a) $
  Proof on practice problems.
]

#example("Former NGD Slope")[
  $ limx(1) (x sr - 1)/(x-1) $
  #solution()[
    Direct substitution is not acceptable because the denominator becomes 0. Since $x$ is not technically 1,
    $ limx(1) (x sr - 1)/(x-1) = limx(1) ((x+1)cancel((x-1)))/cancel(x-1) = limx(1) x+1 = 2 $

    #note[
      Technically $(x sr - 1)/(x-1)$ is not same as $x+1$ because of hole
    ]
  ]
]

#example("Conjugates")[
  $ lim_(t->0) (sq(t sr + 9) - 3)/(t sr) $
  #solution[
    Multiply conjugate then root rule + direct substitution rule.
  ]
  #note("Warning")[
    Do not take the limit of only one part.
    $ lim_(t->0) (sq(t sr + 9) - 3)/(t sr) = lim_(t->0)(lim_(t->0) (sq(t sr + 9) - 3))/(t sr) = lim_(t->0) 0/(t sr) = 0 $
    bruh
  ]
]

#example("Not by Contradiction")[
  $ limx(1) (f(x) - 8)/(x-1) = 10 $ Find $limx(1) f(x)$
  #solution()[
    $ limx(1) f(x) = limx(1) [(f(x)-8)/(x-1)](x-1) + 8 = 8 $
  ]
]

#example("Gauss Function")[
  For each real number $x$ there exiss a unique integer $n$ and a number $alpha$ with $0<=alpha<1$ #st
  $ x = n + alpha $
  The *Greatest integer function (Floor function)* is defined by
  $ [[x]]=n $
  Show that $limx(3)$ does not exist
  #solution()[

  ]
]

#theorem("The Squeeze Theorem")[
  #theorem()[
    If $f(x)<=g(x)$ when $x$ is near $a$ (not necessary on $a$) and the limits exist, then
    $ limx(a) f(x) <= limx(a) g(x) $

    This stands on one-sided limits.
    Not proven here.
  ]

  If $f(x) <= g(x) <=h(x)$ when $x$ is near $a$ (except possibly at $a$) and
  $ limx(a) f(x) = limx(a) h(x) = L ==> limx(a) g(x) = L $
  
]

#example("The Squeeze Theorem..?")[
  If $f(x)<g(x)$ when $x$ is near $a$ (not necessary on $a$) and the limits exist, then
  $ limx(a) f(x) < limx(a) g(x) $

  Will this be true?

  #solution()[
    $ f(x) = 0 wide g(x) = x sr $
    Duh. always put equal for limits.
  ]
]

#example("Squeeze Theorem Example")[
  Show that $limx(0) x cb sin(1/x) = 0$
  #solution()[
    $ abs(x cb sin(1/x)) = abs(x) cb abs(sin(1/x)) <= abs(x) cb, wide x!=0 $
  ]
]
