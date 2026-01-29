#import "../../templates/templater.typ": *

Say we have an equation, and we have to find the equation. For normal functions, this is relatively easy. However, what about functions like
$ 48x(1+x)^60 - (1+x)^60 + 1 = 0 $
?

Take a random point. Find it's intersection with the x-axis. Find the point on the function with that x coordinate. Repeat this process. If we continue this indefinetly, we can reach a solution of the function. 

#theorem("The Newton-Raphson Method")[
    #canvas.cartesian-canvas(
        x-domain: (-10,10),
        y-domain: (-10,10),
        graph.graph(x=>x*x),
        shape.line(shape.point(2,4), shape.point(1, 0)),
        shape.line(shape.point(1,1), shape.point(0.5, 0)),
        shape.line(shape.point(0.5,0.25), shape.point(0.25, 0)),
    )
    Let the x-intercept of the function $f$ by the $i$th line from the starting point $P$ be $Q_i$. 
    We can define one "action" as the following : 
    $ Q_0 = x(P) $
    $ g_i (x) = f'(Q_(i-1))(x-Q_(i-1)) + f(Q_(i-1)) " where " i gt.eq 1 $
    $ "define" Q_i "s.t. " g_i (Q_i) = 0 $

    Or, to write it in a one-liner fashion, 
    $ x_(n+1) = x_n - f(x_n) / f'(x_n) $
    
    This is an iterative process. Computers use this method to find fairly accurate solutions of a equation. 
]

#example("Newton-Rhapson Method Basics")[
    Starting with $x_1 = 2$, find the third approximation $x_3$ to the solution of the equation $x^3 - 2x - 5 = 0$. 
    #solution("")[
        We apply the Newton-Rhapson Method. 
        $ x_(n+1) = x_n - (x_n^3 - 2 x_n - 5) / (3x_n^2 - 2) $
        $ x_2 = 2.1 $
        $ x_3 = 2.0946 $
    ]
]

