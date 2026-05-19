#import "../../templates/templater.typ": *


In this section, we consider what happens to y as x becomes arbitarily large, either positively or negatively. This so-called *end behavior* is very useful when sketching graphs.

#definition()[
  $ limx(oo) f(x) = L (" resp. " limx(oo) f(x) = ) $
]

#theorem()[
  If $r>0$ is a rational number, then
  $ limx(oo) 1/(x^r) = 0 $
  If $r>0$ is that
]

#example()[
  $ limx(oo) (3x sr - x - 2)/(5x sr + 4x + 1) $
  #solution()[
    $
      limx(oo) (3x sr - x - 2)/(5x sr + 4x) = limx(oo)
    $
  ]
]

= Precise Definition of a Limit at Infinity

#definition()[
  Let f be a function defined on some interval $(a, oo)$. Then
  $ limx(oo) f(x) = L $
  means that from every $epsilon > 0$, there is a corresponding nuber N such that
  $ x > N ==> abs(f(x)-L) < epsilon $
]

#theorem()[
  $ limx(oo) f(x) = oo wide limx(oo) g(x) = L $
  + $limx(oo) [f(x)+g(x)] = oo$
]

#example()[
  Show that $limx(oo) sin x$ does not exist
  #solution()[
    Suppose that $limx(oo) sin x = L$ for some
  ]
]

#example()[
  Modify the above argument to show that the Dirichlet function
  $
    f(x) = cases(
      1 wide "if" x in QQ,
      0 wide "if" x in.not QQ,
    )
  $
  So that it is not continuous on 0.
  #solution()[
    Suppose f is continuous on $a in Q $
    $ abs(x-a) < delta_1 --> abs(f(x) - f(a) ) < 1/2 $
    $ 1/2 < f(x) < 3/2 $
    It must all be rational number in range $(a-delta_1, a+delta_1)$. Contradiction.
  ]
]

#example()[
  Find the limit or show that it does not exist.
  $ limx(oo) sq(x) sin 1/x $
  #solution()[
    $ limx(oo)$ immplies $t->0^+$ when $t = 1/x$.
  ]
]

#note[
  Always check *Periodicity*, *Symmetry*, *Domain* of the function.
]
