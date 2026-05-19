#import "../../templates/templater.typ": *

#theorem("Rolle's Theorem")[
  Let f be a function that satisfies the following three hypothesis:
  + f is continuous on the closed interval $[a,b]$
  + f is differentiable on the open interval $(a,b)$
  + $ f(a) = f(b) $

  Then there exists a number $c in (a,b)$ #st $f'(c) = 0$
  #image("../images/MVT")
  #proof[
    + Case: $f(x) = k$, a constant function
    + Case: $f(x) > f(a)$for some $x in (a,b)$
    + Case: $f(x) < f(a)$for some $x in (a,b)$

  ]
]

#example()[
  Prove that the equation $x cb + x - 1 = 0$ has exactly one real solution.
  #cartesian-canvas(size: (4, 4), x-domain: (-2, 2), y-domain: (-3, 3), func(x => x*x*x + x - 1))
  #solution()[
    First we use IVT to show that a solution exists. Let $f(x) = x cb + x - 1$.
    $ (f(0) < 0) and (f(1) > 0) ==> exists c in (0, 1) st  f(c) = 0 $

    By Rolle's Theorem, we can show uniqueness. (TODO)
  ]
]

#theorem()[
  Let f be a function that satisfies the followings
  + f is continuous on the closed interval $[a,b]$
  + f is differentiable on the open interval $(a,b)$
  Then there is a number $c in (a,b)$ #st
  $ f'(c) = (f(b)-f(a))/(b-a) $
  #image("../images/MVTMVT", width: 200pt)
  #proof[
    $ h(x) = f(x) = [(f(b)-f(a))/(b-a) (x-a) + f(a)] $
    Then h is continuous and differentiable.
    $ h(a) = f(a) - f(a) = 0 $
    $ h(b) = f(b) - f(b) = 0 $
    Using Rolle's Theorem, proven!
  ]
]

#example()[
  $ f(x) = x cb - x $
  Find $c in (0,2)$ satisfying the MVT.
  #let f = x => x*x*x - x
  #cartesian-canvas(size: (4, 4), x-domain:(-0.5, 2.5), y-domain: (-1, 4), func(x => x*x*x - x), line-point-slope(point(calc.sqrt(4/3), f(calc.sqrt(4/3))), 3), point(calc.sqrt(4/3), f(calc.sqrt(4/3))))
  #solution[
    $ f'(c) = (f(2)-f(0))/(2-0) = 3 $
    $ f'(x) = 3x sr - 1 $
    $ c = sq(4/3) $
  ]
]

#example()[
  Suppose that $f(0) = -3$ and $f'(x) <= 5$ for all values of x. How large can $f(2)$ possible be?
  #solution()[
    By MVT
    $ exists c in (0,2) wide f(2) -f(0)=f'(c)(2-0) $
    $ f(2) - f(0) <= 10 $
    $ f(2) <= 7 $
    Sharpness: Let $f(x) = 5x - 3$. Then $f(2) = 7$
  ]
]

#example()[
  Show that
  $ sin x < x "if" 0 < x < 2pi $
]

#theorem()[
  If $f'(x) = 0$ for all x in an interval $(a,b)$, then f is constant of $(a,b)$
  #proof[
    Let $x_1, x_2 in (a,b)$ with $f(x_1) != f(x_2) and x_1 < x_2$. Since f is differentiable on $(a,b)$. By MVT
    $ exists c in (x_1, x_2) wide f(x_2) - f(x_1) = (x_2-x_1) f'(c) $
    Contradiction.
  ]
]

#theorem()[
  If $f'(x) = g'(x)$, there exists c #st $f(x) = g(x) + c$
  #proof[
    Let $F(x) = f(x) - g(x)$
    $ F'(x) = f'(x) - g'(x) $
  ]
]
