#import "../../templates/templater.typ": *

#definition()[
  A function $f$ is called *one-to-one* if it never takes the same value twice. That is,
  $ x_1 != x_2 ==> f(x_1) != f(x_2) $
  Equivalently, in contrapositive form,
  $ f(x_1) = f(x_2) ==> x_1 = x_2 $
]

#theorem("Horizontal Line Test")[
  A function is one-to-one iff no horizontal line intersects its graph more than once. (quite obviously)
]

#example()[
  + Is the function $f(x) = x cb$ one-to-one?
  + Is the function $f(x) = x sr$ one-to-one?
  #solution()[
    There are no domain explicit, but let's assume that it is $RR$
    For any $x_1, x_2 in RR$ with $x_1 != x_2$
    $ f(x_2) - f(x_1) = x_2 cb - x_1 cb = (x_2 - x_1) (x_2 sr + x_1 x_2 x_1 sr) != 0 $
    since $x_2 - x+1 != 0$ and $x_2 sr + x_1 x_2 x_1 sr >= 0$, one-to-one.
  ]
]

#definition()[
  let f be a one-to-one fnction with domain $A$ and range $B$. then its inverse function $f^(-1)$ has domain B and range A and
  $ f invs (y) = x <==> f(x) = y $
]

#theorem("Cancellation equations")[
  Let f be a one-to-one function with domain A and range B. Then
  $ f invs (f(x)) = x, wide "for every" x in A $
  $ f(f invs (x)) = x, wide "for every" x in B $
]

#note()[
  Since
  $ f(a) = b <==> f invs (b) = a $ The graph of inverse function and original function is symmetric with respect to the line $y=x$.
]

#theorem()[
  If $f$ is a one-to-one continuous function defined on an inverval, then its inverse function $f invs$ is also continuous.
  #proof[
    someday.... Intuition wise, since inverse function is symmetrical to the original, there is no reason to have a discontinuoity.
  ]
]

We now consider the differentiability of an inverse function. If $f(b)=a$, then $f invs (a) = b$ and $(f invs)' (a)$ is the slope of the tangent line $L$ to the graph of $f invs$ at $(a,b)$, which is
$ (Delta y)/(Delta x) $
Thus the slope of of L is the reciprocal of the slope of the reflected line. That is,
$ (f invs) ' (a) = (Delta y)/(Delta x) = 1/(Delta x \/ Delta y) = 1/(f'(b)) $
#note()[
  notice that the target point is different. $a$ on inverse function corresponds to $b$ on original function.
]

#theorem("Derivative of an Inverse Function")[
  Let $f$ be an one-to-one differentiable funciton, and let $f invs$ be its inverse function. If
  $ f(a) = b wide "and" wide f'(a) != 0 $
  then $f invs$ is differentiable at $b$, and
  $ (f invs)'(b) = 1/(f'(a)) $
  Equivalently, since $a=f invs (b)$, we can write
  $ (f invs)'(b) = 1/(f'(f invs(b)))' $
  #proof()[
    Since $f(a) = b$, we ahve $f invs (b) = a. $ Consider
    $ lim_(x=>b) (f invs(x) - f invs (b))/(x-b) $
    Let $y = f invs (x)$, so $x = f(y)$. for $x !- b$, we have $y != a$, since f is one-to-one. Also, since f is differentiable, it is continuous, and hence $f invs$ is also continuous as well. thus $ x -> b$ implies $y -> a$.

    Therefore,
    $
      lim_(x-.b) (f invs)' (x) =lim_(x-.b) (f invs (x) - f invs (b))/(x-b) &= lim_(y->a)
    $
  ]
]

#note[
  In Leibniz notation, the formula for the derivative of an inverse function is
  $ dy/dx = 1/(dx \/dy) $

  If we know that the inverse is differentiable, we can use chain rule to prove above easily.
]

#example[
  If $f(x) = 2x + cos x$, find $(f invs) ' (1)$
  #solution()[
    Since
    $ f'(x) = 2 - sin x > 0 $
    The function $f$ is (strictly) increasing and hence one-to-one on $RR$. Also, since $f(0)=1$, we have $f invs (1) = 0$. Therefore,
    $ (f invs)'(1) = 1/(f'(0))' = 1/2 $
  ]
]

#example()[
  Find $(f invs)'(a)$.
  + $f(x)  = 3 x cb + 4 x sr + 6x + 5, wide a=5$
  + $g(x) = x cb + 3 sin x + 2 cos x, wide a=2$
  + $display(h(x) = int^x_3 sq(1+t cb) dt\, wide a=0)$

  #solution[
    Let $x_1, x_2 in RR$ be real numbers #st $x_1 != x_2$.
    $
      f(x_1) - f(x_2) &= (3 x_1 cb + 4 x_1 sr + 6x_1 + 5) - (3 x_2 cb + 4 x_2 sr + 6x_2 + 5) \
      &= 3(x_1 cb - x_2 cb) + 4(x_1 sr - x_2 sr) +  6(x_1 - x_2) \
      &= (x_1 - x_2) [3(x_1 sr + x_1 x_2 + x_2 sr) + 4 (x_1+x_2) + 6]
    $
    $x_1 - x_2 != 0$, and .... shit

    $f'(x) = 9x sr + 4x + 6$. $D\/4 = 16 - 54 < 0$. Therefore, $f'(x) > 0.$ Hence, $f$ is strictly increasing thus one-to-one.

    Since it is one-to-one function, we know that there is exactly one $b$ #st $f(b) = a$.
    $ f(b) = 3 b cb + 4 b sr + 6b + 5 = a = 5 ==> b = 0 $
  ]
  #solution()[
    First, we show that g is one-to-one funtion on $RR$
    $ g'(x) = 3 x sr + 3 cos x - 2 sin x $
    we estimate the first two terms. Let
    $ phi(x) = 3 x sr + 3 cos x $
    Then
    $ phi'(x) = 6 x -3sin x $
    and
    $ phi''(x) = 6 - 3 sin x >= 3 > 0 $
    Therefore $phi'(x)$ is always strictly increasing.

    Since $ phi'(0) = 6x - 3 sin x = 0$, we have $phi'(x) < 0$ for $x<0$ and $phi'(x) >0$ for $x>0$. Therefore, the absolute minimum of $phi$ belongs at $x=0$.

    $phi(0) = 3 0 sr + 3 cos 0 = 3$.
  ]
]

#example()[
  If $f$ is an one-to-one twice differentiable function with inverse funtion $g$, show that
  $ g''(x) = -(f''(g(x)))/([f'(g(x))]cb) $
]
