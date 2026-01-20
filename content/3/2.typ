#import "../../templates/templater.typ": *

= Rolle's Theorem
Let us define a simple theorem before we go into the mean value theorem. 
#theorem("Rolle's Theorem")[
    Let $f$ be a function that suffices the following : 
    + $f(x)$ is continous on the closed interval $[a,b]$.
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







