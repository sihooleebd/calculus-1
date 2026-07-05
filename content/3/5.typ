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
    + Intercepts
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

#example("A Complete Portrait of a Cubic")[
    Let $f : RR -> RR$ be the function defined by
    $ f(x) = x^3 - 3x^2 + 4 $
    + Find the intervals of increase or decrease of $f(x)$.
    + Find the local maximum and minimum values of $f(x)$.
    + Find the intervals of concavity and the points of inflection.
    + Sketch the graph of $f(x)$ using the information from (1) to (3).
    #solution("")[
        *(1) Increase and decrease.* Differentiate and factor :
        $ f'(x) = 3x^2 - 6x = 3x(x-2) $
        The critical numbers are $x = 0$ and $x = 2$. Testing the sign of $f'$ :
        - on $(-infinity, 0)$ : $f' > 0$, increasing
        - on $(0, 2)$ : $f' < 0$, decreasing
        - on $(2, infinity)$ : $f' > 0$, increasing

        *(2) Local extrema.* By the First Derivative Test, $f$ has a local maximum at $x = 0$ with
        $ f(0) = 4 $
        and a local minimum at $x = 2$ with
        $ f(2) = 8 - 12 + 4 = 0 $

        *(3) Concavity.* The second derivative is
        $ f''(x) = 6x - 6 $
        so $f$ is concave downward on $(-infinity, 1)$ and concave upward on $(1, infinity)$, with an inflection point at
        $ (1, f(1)) = (1, 2) $
        This point is exactly halfway between the two extrema, as always happens for a cubic.

        *(4) The sketch.* One more free gift before drawing : the polynomial factors as
        $ f(x) = (x+1)(x-2)^2 $
        so the graph crosses the $x$-axis at $x = -1$ and *touches* it at $x = 2$, which is consistent with the local minimum value $0$ found above.

        #canvas.cartesian-canvas(
            size: (8, 5),
            x-domain: (-2.5, 4),
            y-domain: (-3, 6),
            show-grid: true,
            graph.graph(x => x * x * x - 3 * x * x + 4, domain: (-1.25, 3.17), label: $f(x) = x^3 - 3x^2 + 4$),
            graph.point(0, 4, label: ""),
            graph.point(2, 0, label: ""),
            graph.point(1, 2, label: ""),
        )
        The three marked points (local maximum, inflection, local minimum) are the entire skeleton of the curve. Everything else is just connecting them with the right bends.
    ]
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
    The line $y = m x + b$ is a slant asymptote of $f$ if
    $ lim_(x->infinity) [f(x) - (m x + b)] = 0 $
    (or the same with $x -> -infinity$).
]