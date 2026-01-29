#import "../../templates/templater.typ": *

We consider a bunch of elements when sketching a function. 
- critical points
- domain
- intersects
- the derivative
- the second derivative
- ...

We can define sort of a "always working" formula for sketching curves. 
#note("Curve Sketching")[
    + Domain
    + Intercpets
    + Symmetry
      + Periodic functions
    + Asymptotes
    + Intervals of increase/decrease
    + Local maximum & minimum (Critical points)
    + Concavity

    With these things considered, we can much easily draw a curve. 
]

#example("Curve Sketching Basics (1)")[
    Sketch the curve
    $ y = (2 x ^ 2)/(x^2-1) $
    #solution("")[
        + The domain is $x eq.not plus.minus 1$. In different form, $(-infinity, -1) union (-1,1) union (1, infinity)$.
        + Plug in $x=0$ and $y=0$. The function passes $(0,0)$. 
        + Consider its limits to its ends of the domains($-infinity$, $-1$, $1$, $infinity$). We can see that it approaches $2$ at $x=plus.minus infinity$ and $plus.minus infinity$ at $-1^+, -1^-, 1^+, 1^-$. These are the asymptotes. 
        + Use the I/D test.
        + We can know that the critical numbers for this function lie at $-infinity$, $-1$, $0$, $1$, $infinity$. 
        + Concavity can be determined by examining the second derivative. 
    ]
    We end up with a graph like this :
    #canvas.cartesian-canvas(
        graph.graph(x => (2 *x *x)/(x * x - 1), domain: (-5, -0.0001)),
        graph.graph(x => (2 *x *x)/(x * x - 1), domain: (0.0001, 5), style: (color: black))
    )
]

= Slant Asymptotes
Till now we have only considered asymptotes in the form of $x=alpha$ and $y=alpha$. But why can't it be in the form of $y = alpha x + beta$? Slant asymptotes is exactly that. 

Consider the function $y = x + sin(x)/x$. If we draw the function, we get the following : 
#canvas.cartesian-canvas(
    x-domain: (-20,20),
    y-domain: (-20,20),
    graph.graph(x => x + calc.sin(x) / x, domain: (-20,20))

)

This follows a "slanted asymptote". 

#definition("Slanted Asymptotes")[
    Slanted asymptotes follow the rule : 
    $ lim_(x->infinity) [f(x) = (m x + b)] = 0 $
]