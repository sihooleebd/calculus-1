#import "../../templates/templater.typ": *

= Overview
We have a lot of optimization problems in our daily lives. 
- Minimize cost $dot.c$ time $dot.c$ labor etc... 
- Maximize gain $dot.c$ area $dot.c$ distance etc...
These problems have been discussed in calculus, but we can examine them more in detail in this chapter. 

#note("The basic steps to solving optimization problems")[
    1. Understand the constraints
    2. Draw a diagram
    3. Introduce notation (Let $Q$ be the objective function and $a_1 ...a_n$ be notations for unknown quantities)
    4. Express $Q$ in $a_1...a_n$
    5. Find the absolute maximum/minimum of the graph $Q=f(a_1,...a_n)$. 

]

#example("Optimization problem example")[
    A farmer is trying to build a ranch near a river. One side of the river is taken care by the river. The farmer has a total of $1200m$ worth of fence. What is the maximum area the farmer can claim?
    #solution("")[
        Let the rectangular side covered by the river be length $x "    " (0 lt x lt 1200)$. 
        Then, our objective function $Q$ becomes

        $ Q &= x * (1200-x)/2 \ &=x *(600 - x/2) \ &= -1/2 x^2 + 600x $

        If we take the derivative of this function, 
        $ Q' = -x + 600 $
        Investigating the point of $Q'=0$(Since the original function is a second-order quadratic function, we only have one critical point), we get $x = 600(m)$.
        $ therefore x = 600m, y = 300m " with total area of " 180000 m^2 $

    ]
]

Is there any simple way to find an absolute maximum/minimum, even if it is not a simple function like above? Of course there is. 
#theorem("First Derivative Test for Absolute Extreme Values")[
    $ f'(x) > 0 " " forall x < c " " and  f'(x) < 0 " " forall x > c ==> f(c) = "absolute maximum" $
    $ f'(x) < 0 " " forall x < c " " and  f'(x) > 0 " " forall x > c ==> f(c) = "absolute minimum" $
]

