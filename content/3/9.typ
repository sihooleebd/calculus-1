#import "../../templates/templater.typ": *

Consider this. 
$ f arrow.long.l.r^("derivative")_("???") f' $

What do we call that action of finding $f$ from $f'$?
#definition("Antiderivative")[
    A function $F$ is called an *antiderivative* of $f$ on an interval $I$ if $F'(x) = f(x) forall x in I$. 
    The most general form of an antiderivative in this case is $F(x) + C$ where $C$ is the antiderivative constant. 
]

= Antidifferentiation Formulae
Basically the opposite of differentiation formulae. 

#example("Antidifferentiation Basics")[
    Find all functions $g$ s.t. $g'(x) = 4 sin(x) + (2x^5 - sqrt(x))/x$. 
    #solution("")[
        $ g'(x) = 4sin(x) + 2x^4 - 1/sqrt(x) $
        $ therefore g = -4cos(x) + 2/5 x^5 - 2 sqrt(x) + C $
    ]
]

