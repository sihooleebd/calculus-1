#import "../../templates/templater.typ": *

= Optimizaiton problems
- Say we have velocity graph of a car moving. In a logical scenario, we might want to find *the maximum/minimum acceleration of the car*. How can we do this?

#definition("Local&Absolute Maxima&minima")[
  Let $c$ be a number in the domain $D$ of a function $f$. Then, $f(c)$ is the :
  - *Absolute maximum* if $f(c) gt.eq f(x)$ for all $x$ in $D$.
  - *Absolute minimum* if $f(c) lt.eq f(x)$ for all $x$ in $D$.
  - *Local maximum* if $f(c) gt.eq f(x)$ for $x$ near $c$.
  - *Local minimum* if $f(c) lt.eq f(x)$ for $x$ near $c$.
]

#example("Local Maximum of a Function")[
  Take the function $f(x) = 3x^4 - 16x^3 + 18x^2$ Near the point at $x=1$, what is the local maxima?
  #solution("")[
    We get the following graph when drawn :
    #canvas.cartesian-canvas(
      graph.graph(x => 3 * calc.pow(x, 4) - 16 * calc.pow(x, 3) + 18 * calc.pow(x, 2)),
      graph.point(1, 5),
    )
    Thus we can know that the local maxima near point $1$ is $5$.
  ]
]

You may notice that if a function is continuous and limited to a certain closed region, an absolute minima and maxima exists in the region. 
#theorem("Extreme Value Theorem")[
    Inside a closed region $[a,b]$, if the function is continuous within the region, the function has an absolute maxima and minima values $c$ and $d$. 
]

Now, let's consider the meaning of a "local maxima". At the local maxima, any point near the local maxima(for simplicity lets assume it is at $a$) is always smaller than $f(a)$. Thus, we can tell that the differentiated function changes signs at $x approx a $. From this, we can deduce a very cool and useful theorem;

#theorem("Fermat's Theorem")[
    If $f$ has a local maximum or minimum at $c$, and if $f'(c)$ exists, we can find that $f'(c)=0$.
    #proof("Intuition")[
        This can be proven easily using the logic above plus the intermediate vaule theorem. 
    ]
    #proof("Definition of Derivatives")[
        Let's suppose that $f(x)$ has a local maxima at $x=c$. This implies that if $h$ is sufficiently near $0$, we can find the following. 
        $ f(c) gt.eq f(c+h) $
        If we simplify the inequality, we get
        $ (f(c+h) - f(c))/h lt.eq 0 $
        Take the right hand limit of both sides, we get
        $ lim_(h->0+) (f(c+h)-f(c))/h lt.eq lim_(h->0+) 0 = 0 $
        Since $f'(c)$ exists, we can define LHS as $f'(c)$. 
        $ f'(c) lt.eq 0 $
        If we do the same for the left hand side, we get
        $ f'(c) gt.eq 0 $
        Therefore, $f'(c) = 0$.
    ]
]

From this, we can get a number of points that is of our interest in a certain area. 
#definition("Critical Numbers")[
    A critical number of a function $f$ is a number $c$ in the domain of $f$ that is either $f'(c) = 0$ $f'(c)$ does not exist.
]

#example("Critical Numbers Example")[
    For the function 
    $ f(x) = x-2 sin(x) "     " x lt.eq x lt.eq 2 pi $
    Use calculus to find the exact minimum and maximum values. 
    #solution("")[
        since $f(x)$ is continuous within the given interval, we can deduce the fact that critical values exist on the points where $f'(x) = 0$ or $f'(x)$ doesn't exist. Since $f'(x) = 1 - 2 cos(x)$, we have $f'(x) = 0$ when $cos(x) = 1/2$. This is at $x = pi/3$ or $x=(5 pi)/3$. Since the endpoints are discontinuous, $f(0)$ and $f(2 pi)$ are both critical values. 

        In the end, we can find that $x_c = 0, pi/3, (5 pi)/3, 2 pi$
    ]
]





