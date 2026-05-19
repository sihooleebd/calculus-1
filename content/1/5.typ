#import "../../templates/templater.typ": *

#definition()[
  If g is differentiable at x and f is differentiable at g(x), then the composite function $F = f comp g$ defined by $F(x)=f(g(x))$ is differentiable at x and
  $ F'(x) &= f'(g(x)) dot g'(x) $
  $ &= d/(d g) dot (d g)/dx $
]
#proof()[
  $ limx(a) &= (f(g(x))-f(g(a)))/(x-a) $
  $ &= limx(a) (f(g(x))-f(g(a)))/(f(x)-g(x)) dot (f(x)-g(x))/(x-a) $
  $ &= limx(a) f'(g(a)) dot g'(a) $
  Is it substitutable? what if f(x)-g(x) approach 0?
]
#proof()[
  Define function $epsilon(x)$ which denotes error, that is continuous, avoiding fraction notation.
]

#example()[
  Using the Chain Rule prove followings:
  - Derivatives of odd functions are even and vice versa.
]
