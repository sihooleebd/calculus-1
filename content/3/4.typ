#import "../../templates/templater.typ": *

= Limits to Infinity
Lets consider a limit to infinity. we would probably note it like this : 
$ lim_(x -> infinity) $
Which is quite intuitive on it's own. But what happens if we add this to a function? 

#example("Limits at Infinity")[
    Consider the behavior of the function $f(x) = (x^2 - 1)/(x ^ 2 + 1)$ when $lim_(x->infinity)$.
    #solution("")[
        If we graph the function, we get the following : 
        #canvas.cartesian-canvas(
            y-domain: (-3,3),
            graph.graph(x => (x * x - 1)/(x * x + 1), label: $f(x) = (x ^ 2 - 1)/(x ^ 2 + 1)$),
            graph.graph(y => 1, label: $y=1$)
        )
        from the graph, we can intuitively tell that the function will approach $y=1$ indefinetly when $x -> infinity$. 
    ]
]

As we did with normal limits, let us look at the intuitive definition of a limit first. 
#definition("Intuitive Definition of a Limit at Infinity")[
    If a function $f$ is defined on an arbitrary interval $(-infinity, alpha)$, then 
    $ lim_(x->-infinity) f(x) = L $
    means that the value of $f(x)$ can be made arbitrarily close to $L$ by making $x$ a sufficiently large negative. 
]

From this, we can define what we call a *horizontal asymptote*. 

#definition("Horizontal Asymptotes")[
    We can define a horizontal asymptote if 
    $ lim_(x->-infinity) f(x) = L $
        or
    $ lim_(x->infinity) f(x) = L $
.
]

#example("Infinite limits")[
    Find
    $ lim_(x->infinity) 1/x $
    #solution("")[
        #canvas.cartesian-canvas(
            graph.graph(x => 1/x)
        )
        From the graph, we can tell that the function will approach 0 when going near $x->infinity$. 
    ]
]

In general, we can derive the following : 
#theorem("Limits to Infiniy")[
    If $r > 0$, functions in the form $f(x) = 1/x^r$ limit to 0 when pushed to $plus.minus infinity$. 
]

= Infinite Limits at infinity
Consider a very basic function(eg. $y=x$). What happens when $lim_(x->infinity)$? $y$ also goes to infinity. we call this *Infinite Limits at Infinity*. 
#definition("Infinite Limits at Infinity")[
    we can write a limit as 
    $ lim_(x->infinity) f(x) = infinity $
    Since infinity itself is not a number, we cannot apply limit laws to this limit. 
    Most questions ask for the sign of the infinite limit at infinity. 
]

How do we write this in the $epsilon-delta$ method? Since there is no "number" larger than $infinity$, we only have to look at one side of the equation. 

#definition("Precise Definition of a Limit at Infinity")[
    Let $f$ be a function defined on some interval $(~, infinity)$. For any $epsilon gt 0$, there is a corresponding number $N$ s.t. 
    $ "if    " x gt N "    then    " |f(x)-L| lt epsilon $
    As a graph, we can draw it like this : 
    #canvas.cartesian-canvas(
        x-domain: (0,5),
        graph.graph( x=> 1/x, label: $ y = 1/x $),
        shape.point(3, 1/3),
        shape.segment(shape.point(3, 0), shape.point(3, 1/3)),
        shape.point(3, 0, label: $N$, label-anchor: "south-east"),
        shape.line(shape.point(0, 1/3), shape.point(3, 1/3)),
        shape.line(shape.point(0, 0), shape.point(3, 0), label: $y = L - epsilon$, label-anchor: "south-west"),
        shape.line(shape.point(0, 2/3), shape.point(3, 2/3), label: $y = L + epsilon$, label-anchor: "north-west"),
        shape.segment(shape.point(3, 0), shape.point(3, 2/3)),
    )
]

#definition("Precise Definition of an Inifinite Limit at Infinity")[
    Let $f$ be a function defined on some interval $(~, infinity)$. For any $M$, there is a corresponding number $N$ s.t. 
    $ "if    " x gt N "    then    " f(x) > M $
        
]

