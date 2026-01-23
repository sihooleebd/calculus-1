#import "../../templates/templater.typ": *
= Some Tests we can do
Recall that a derivative($f'(x)$) displays the literal "slope" at a certain part of the graph. Using this, we can infer a few basic tests : 
#note("Increasing/Decreasing Test (abb. I/D Test)")[
    + If $f'(x)>0$ on an interval, then $f$ increases. 
    + If $f'(x)<0$ on an interval, then $f$ decreases. 
    + Since the points of interest are when $f'(x) = 0$, we can easily divide and estimate the shape of the function via splitting the function on it's critical points. 
]

From (3) at the note above, we can estimate the "type" of critical point we are dealing with. 

#theorem("The First Derivative Test")[
    Suppose $c$ is a critical number for a continuous function $f$. 
    + If $f'$ goes from $+$ to $-$ at $c$, $c$ is a local maxima of $f$. 
    + If $f'$ goes from $-$ to $+$ at $c$, $c$ is a local minimum of $f$. 
    + If $f'$'s sign does not change, $c$ is not a local maxima/minima. 

    #note("Second Derivatives")[
        We can define this using second derivatives too. 
        + If $f''(c) lt 0$, $c$ is a local maxima. 
        + If $f''(c) gt 0$, $c$ is a local minima.
        + If $f''(c) = 0$, $c$ is neither. We call it _inconclusive_. 
    ]
]

If not at a critical point, the second derivative can also describe the concavity of a function. 

#definition("Concave")[
    A function is *concave upward* on an interval if all tangents of $f$ in that region lies below $f$. 
    A function is *concave downward* on an interval if all tangents of $f$ in that region lies above $f$. 

    We can test this easily by looking at the sign of the second derivative of $f$($f''$). If $f''(x)>0$ in the interval $II$, then the graph of $f$ is concave upward and vise versa. 
]

But consider functions like the following. 
#canvas.cartesian-canvas(
    x-domain: (-5,5),
    y-domain: (0,6),
    graph.graph(x => -3 / 16 * x * x * x + 9 / 8 * x * x, domain: (-5,5)),
    shape.point(0,0),
    shape.point(2,3, label: $(2,3)$, label-anchor: "north-east"),
    shape.point(4,6)
)

Note that the concavity inverses at the point $(2,3)$. We call such a point an *inflection point*. 
#definition("Inflection Point")[
    An *inflection point* is a point where the curve changes from concave upward to concave downward. 
]

= Curve Sketching
Using the info we gathered in the tests above, we can sketch the basic shape of an arbitrary function using basic calculus. 

#note("The Steps to Sketching a Function")[
    + Find Intervals
    + Inside those intervals, find increase/decrease
    + Inside those intervals, find concavity
    + Draw
]



