#import "../../templates/templater.typ": *

The term work is used in everyday language to mean the total amount of effort required
to perform a task. In physics it has a technical meaning that depends on the idea of a
_force_. Intuitively, you can think of a force as describing a push or pull on an object—for
example, a horizontal push of a book across a table or the downward pull of the earth’s
gravity on a ball. In general, if an object moves along a straight line with position func-
tion $s(t)$, then the force F on the object (in the same direction) is given by Newton’s
Second Law of Motion as the product of its mass m and its acceleration a:

$ F = m a = m (d sr s)/(dt sr) $

#definition()[
  When the case of the force is constant, *work* is defined by the product of displacement in the direction of the force and the force $F$ itself.
  $ W = F d $
]

Note that force is measured in Newtons, so the unit of work $W$, is  the newton-meter, which is a Joule. In the U>S> customary system, force is measured in pounds, so the unit of work is foot-pound which is about $1. 35 space"J"$.

Now consider the case where the force is not constnat. Suppose an object moves along the x-axis from $x=a$ to $x=b$, and a continuous force $f(x)$ acts on the object.

#theorem()[
  Divide $[a,b]$ into $n$ subintervals of width $Delta x$, and choose a sample point $x_i^*$ in $[x_(i-1), x_i]$, Over a small interval, the force is approximately constant, so the fork done on $[x_(i-1), x_i]$ is $f(x_i^*) Delta x$

  Therefore, the total must be approximately the sum of the average of each subintervals.
  $ sum^n_(i=1) f(x_i^*) Delta x $
  Which, again, resembles the Riemann sum,
  $ lim_(n-> oo) sum^n_(i=1) f(x_i^*) Delta x = int^b_a f(x)dx $
  $ therefore W = int&b_a f(x) dx $
]

#theorem("Hooke's Law")[
  The force required to maintain a spring stretched $x$ units beyond its natural length is proportional to $x$:
  $ F(x) = k x $
  where $k$ is a positive constant called the *spring constant*. Hooke's Law holds provided that $x$ is not too large.
]

#example()[
  A force of $40 "N"$ is required to hold a spring that has been stretched from its natural length of $10 "cm"$ to a length of $15 "cm" $. How much work is done in stretching spring from $15 "cm" $to $18 "cm" $?
  #solution()[
    Let $k$ be the spring constant. By Hooke's Law,
    $ 40 = k(0.15 - 0.1) = 0.05k $
    Thus, $k=800$
    Therefore, the work done in stretching the spring from $15 "cm" $ to $18 "cm" $ is
    $ k(0.18 - 0.15) = 800 dot 0.03 = 24 ("J") $
  ]
]

//TODO: Cable example (textbook example 4 p.397(434))

#example()[
  A tank has the shape of an inverted circular cone with height 10 m and base radius 4 m. It is filled with water to a height of 8 m. Find the work required to empty the tank by pumping all of the water to the top of the tank. (The density of water is 1000 kg/m$cb$)
  #solution()[
    Measure depth from the top of the tank, and let $x$ be the _depth below the top_. Divide the interval $[2, 10]$ into n subintervals of width $Delta x$. Choose a representative point $x_i^*$ in the ith subinterval. This divides the water into thin layers.

    The layer at depth $x_i^*$ is approximated by a circular cylinder of height $Delta x$ and radius $r_i$. By similar triangles,
    $ r_i/(10-x_i^*) = 4/10 wide r_i = 2/5(10-x_i^*) $
    Thus the volume of the ith layer is approximately
    $ V_i approx pi r_i^2 Delta x = (4 pi)/25 (10 - x_i^*) sr Delta x $
    The mass is $1000 dot V_i = 160 pi (10 - x_i^*) sr Delta x$, and this layer must be lifted a distance $x_i^*$ to reach the top, so the work to pump it up is approximately
    $ 9.8 dot 1000 dot V_i dot x_i^* = 1568 pi x_i^* (10 - x_i^*) sr Delta x. $
    To find the total work,
    $
      W &= lim_(n-> oo) sum^n_(i=1) 1568 pi x_i^* (10 - x_i^*) sr Delta x = int^10_2 1568 pi x (10 - x) sr dx \
      &= 1568 pi int^10_2 (100 x - 20 x sr + x cb) dx \
      &= (1568 pi dot 2048)/3 = (3211264 pi)/3 upright("J").
    $
  ]
]

#theorem("Work-Energy Theorem")[
  Suppose an object of mass $m$ moves along a line under a net force $f(x)$ directed along the line. If $v(t)$ denotes its speed at time $t$, then the work done in moving the object from position $x_1$ at time $t_1$ to position $x_2$ at time $t_2$ equals the change in its kinetic energy:
  $ W = (m v(t_2) sr)/2 - (m v(t_1) sr)/2. $
]
#proof[
  Let $x = s(t)$ be the position of the object at time $t$, and suppose $s(t_1) = x_1$, $s(t_2) = x_2$. Since $v(t) = s'(t)$, the substitution rule gives
  $ W = int^(x_2)_(x_1) f(x) dx = int^(t_2)_(t_1) f(s(t)) s'(t) dt = int^(t_2)_(t_1) f(s(t)) v(t) dt. $
  By Newton's Second Law (with force measured in the direction of motion), $f(s(t)) = m v'(t)$. Thus
  $ W = int^(t_2)_(t_1) m v'(t) v(t) dt. $
  Since $d/(d t)((v(t) sr)/2) = v(t) v'(t)$, it follows that
  $ W = m/2 int^(t_2)_(t_1) d/(d t)(v(t) sr) d t = m/2 (v(t_2) sr - v(t_1) sr), $
  by the Fundamental Theorem of Calculus.
]

