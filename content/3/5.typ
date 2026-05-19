#import "../../templates/templater.typ": *


#theorem("Substitution Rule")[
    If $u=g(x)$ is a differentiable function whose range is an interval $I$ and $f$ is continuous on $I$, then
    $ int f(g(x))g'(x)dx = int f(u)dif u $
]

#example()[
  Find $display(int x^5 sq(1+x sr) dx)$
  #solution()[
    Let $u = 1 + x sr$. Then $dif u = 2x dx => x dx = 1/2 dif u$
    $
      int x^5 sq(1 + x sr) &= 1/2 int (u^(5 \/ 2))
    $
  ]
]

#theorem("The Substitution Rule for Definite Integrals")[
  If $g'$ is continuous funciton on $[a,b]$ and $f$ is continuous on the range of $u=g(x)$, then
  $ int^b_a f(g(x))g'(x) = int^(g(b))_(g(a)) f(u) d u $
  #proof[
    $ F(x) = int^x_(g(a)) f(t) dt $
    Then $F'(x) = f(x)$ by FTC1. Hence, by the Chain Rule,
    $ d/dx F(g(x)) = F'(g(x))g'(x) = f(g(x))g'(x) $
    Therefore, by FTC2
     $ int^b_a f(g(x))f'(x)dx = [F(g(x))]^b_a = F(g(b))-F(g(a)). $
     Since
     $ F(g(b)) = int^(g(b))_(g(b)) f(g(x)) =  $
  ]
]

#example()[
  Evaluate $display(int^2_1 dx/((3-5x)^2))$
  #solution()[
    Let $u=3-5x$. Then $du = -5dx$, so $dx = -du/5$.

    When $x=1, u=-2$ and when $x=2, u=-7$. Thus
    $ int^2_1 dx/((3-5x)^2) = int $
  ]
]

#note("SMG")[
  Try not to manipulate the $du = -5dx$, but just try to find the $-5dx$ form from the equation.
]

#theorem("Integrals of Symmetric Functions")[
  Suppose $f$ is continuous on $[-a, a]$.
  #set enum(numbering: "(a)")
  + If $f$ is even, then \ \ $display(int^a_(-a) f(x) dx = 2int^a_0f(x)dx).$ \ \
  + If f is odd, then \ \ $display(int^a_(-a) f(x) dx = 0 )$ \ \
  #proof[
    $ int^a_(-a) f(x)dx = int^0_(-a) f(x)dx + int^a_0f(x)dx $
    Let $u=-x$, Then $du = -dx$
    $ int^0_(-a) f(x)dx = -int^0_a f(-u)du = int^a_0 f(-u)du = int^a_0f(-x)dx $
    If $f$ is an even function, $f(-x) = f(x)$, thus
    $ int^a_(-a) f(x) dx = 2int^a_0f(x)dx $
    If $f$ is an odd function, $f(-x) = -f(x)$, thus
    $ int^a_(-a) f(x) dx = 0 $
    #qed
  ]
]

#example("")[
  If $f$ is continuous on $RR$, prove that
  $ int^b_a f(-x)dx = int^(-a)_(-b) f(x) dx $
  For the case where $f(x)>= 0$ and $a<b$, draw a diagram to interpret this equation geometrically as an equality of areas.

  #cartesian-canvas(
    x-domain: (-2, 2),
    y-domain: (0, 3),
    size: (4, 4),
    func(x => x*x*x*x - 2*x*x+1)
  )
]

#example()[
  If f is continuous on $[0, pi]$, then use substitution law $u=pi-x$ to show that
  $ int^pi_0 f(sin x) = pi/2 int^pi_0 x f(sin x) $
]
