#import "../../templates/templater.typ": *

= Rolle's Theorem
Let us define a simple theorem before we go into the mean value theorem. 
#theorem("Rolle's Theorem")[
    Let $f$ be a function that suffices the following : 
    + $f(x)$ is continuous on the closed interval $[a,b]$.
    + $f(x)$ is differentiable on the open interval $(a,b)$.
    + $f(a) = f(b)$
    Then there is a number $c$ in $(a,b)$ such that $f'(c) = 0$.
    #image("../images/Screenshot 2026-01-17 at 23.02.38.png")
    #proof("Case I")[
        $f'(x) = 0$ for all $x in (a,b)$.
    ]
    #proof("Case II")[
        $f(x) > f(a)$ for some point $x in (a,b)$.
        
        By the Extreme Value Theroem, $f(x)$ has a maximum somewhere inside $(a,b)$. Thus $f(x)$ has a local maximum at $c$, and therefore $f'(c) = 0$ by Fermat's Theorem. 
    ]
    #proof("Case III")[
        $f(x) < f(a)$ for some point $x in (a,b)$.
        
        By the Extreme Value Theroem, $f(x)$ has a minimum somewhere inside $(a,b)$. Thus $f(x)$ has a local minimum at $c$, and therefore $f'(c) = 0$ by Fermat's Theorem.     
    ]
]

From this, we can derive the *Mean Value Theorem*. 

#theorem("Mean Value Theorem")[
    If $f$ is a function that satisfies the following hypotheses : 
    1. $f$ is continuous on $[a,b]$
    2. $f$ is differentiable on $(a,b)$
    Then, there is a number $c$ that suffices
    $ f'(c) = (f(b)-f(a))/(b-a) $
    or
    $ f(b) - f(a) = f'(c)(b-a) $
    
    Of course, there could be multiple $c$ s. 
]

By intuition, we can know that this works for all cases, where the function is concave, convex, or a mixed form. However, what if the function is a perfect line? We can't talk concavity on that. 

#theorem("Lines and Constant functions")[
    If $f'(x) = 0$ for all $x$ in $(a,b)$, $f$ is constant on $(a,b)$.

    Also, if $f'(x) = g'(x)$ for all $x$ in interval $(a,b)$, then $f(x) = g(x)+c$. 
]



