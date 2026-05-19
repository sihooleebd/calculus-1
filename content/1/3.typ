#import "../../templates/templater.typ": *

= Constant Functions and Power Functions
+ If $f(x) = c$, then $f'(x) = 0$
+ If $f(x) = x^n$ $(n in NN)$, then $f'(x) = n x^(n-1)$

#proof[
  $ f'(x) &= lim_(h->0) (f(x+h)-f(x))/h \ &= lim_(h->0) (c-c)/h = 0 $
]

#proof[
  $ f'(x) &= lim_(t->x) (f(x)-f(t))/(x-t) \
          &= lim_(t->x) (x^n - t^n)/(x-t) \
          &= lim_(t->x) ((x-t)(x^(n-1) + x^(n-2)t + dots + x t^(n-2) + t^(n-1)))/(x-t) \
          &= lim_(t->x) (x^(n-1) + x^(n-2)t + dots + x t^(n-2) + t^(n-1)) \
          &= x^(n-1) + x^(n-1) + dots + x^(n-1) quad ("n terms") \
          &= n x^(n-1) $
]

= Derivative Rules

#definition()[
  + $(f plus.minus g)'(x) = f'(x) + g'(x)$
  + $(f g)'(x) = f'(x)g(x) + f(x)g'(x)$
  + $(c f)'(x) = c f'(x)$
  + $ ((f(x))/(g(x)))'(x) = (f'(x)g(x)-f(x)g'(x))/((g(x))^2) $

  #proof[
    Let $F(x) = f(x) + g(x)$
    $
      F'(x) &= lim_(h->0)(F(x+h)-F(x))/h \
      &= lim_(h->0) ([f(x+h)+g(x+h)]-[f(x)+g(x)])/h \
      &= lim_(h->0) [(f(x+h)-f(x))/h + (g(x+h)-g(x))/h] \
      &= lim_(h->0) (f(x+h)-f(x))/h + (g(x+h)-g(x))/h \
      &= f'(x) + g'(x)
    $
  ]

  #proof[
    Let $F(x) = f(x)g(x)$. Add and subtract $f(x)g(x+h)$ in the numerator:

    Since $g(x)$ is differentiable, $g(x)$ is continuous.
    $
      F'(x) &= lim_(h->0)(F(x+h)-F(x))/h \
      &= lim_(h->0) (f(x+h)g(x+h)-f(x)g(x))/h \
      &= lim_(h->0) (f(x+h)g(x+h) - f(x)g(x+h) + f(x)g(x+h) - f(x)g(x))/h \
      &= lim_(h->0) [ ((f(x+h)-f(x))/h) g(x+h) + f(x) ((g(x+h)-g(x))/h) ] \
      &= lim_(h->0) (f(x+h)-f(x))/h dot lim_(h->0) g(x+h) + f(x) lim_(h->0) (g(x+h)-g(x))/h \
      &= f'(x)g(x) + f(x)g'(x)
    $
  ]

  #proof[
    Let $F(x) = f(x)/g(x)$.
    $
      F'(x) &= lim_(h->0)(F(x+h)-F(x))/h \
      &= lim_(h->0) 1/h ( f(x+h)/g(x+h) - f(x)/g(x) ) \
      &= lim_(h->0) ( f(x+h)g(x) - f(x)g(x+h) ) / ( h g(x+h)g(x) ) \
      &= lim_(h->0) ( f(x+h)g(x) - f(x)g(x) + f(x)g(x) - f(x)g(x+h) ) / ( h g(x+h)g(x) ) \
      &= lim_(h->0) ( ((f(x+h)-f(x))/h) g(x) - f(x) ((g(x+h)-g(x))/h) ) / ( g(x+h)g(x) ) \
      &= ( f'(x)g(x) - f(x)g'(x) ) / ( g(x)^2 )
    $
  ]
]

#example()[
  + $x cb + 7x^2 - 3x + 12$
  + $(1+2x sr)(x-x sr)$
  + $(x^2 + 1)/(x - 1)$

  #solution[
    $ y' = (x cb + 7x^2 - 3x + 12)' = (x cb)' + (7x^2)' - (3x)' + (12)' \ = 3x sr + 14x - 3 $
  ]
  #solution()[
    $ y' &= (1+2x sr)'(x - x sr) + (1+2x sr)(x-x sr)' \ &= 4x(x-x sr) + (1+2x sr)(1-2x) \ &= -4x cb + 4 x sr - 4 x cb + 2 x sr - 2x + 1 \ &= -8 x cb + 6 x sr - 2 x + 1 $
    Or expand and do it like sol 1
  ]
  #solution()[
    Using the quotient rule:
    $ y' &= (((x^2+1))'(x-1) - (x^2+1)((x-1))') / ((x-1)^2) \
         &= (2x(x-1) - (x^2+1)(1)) / ((x-1)^2) \
         &= (2x^2 - 2x - x^2 - 1) / ((x-1)^2) \
         &= (x^2 - 2x - 1) / ((x-1)^2) $
  ]
]

= General Power Functions

#theorem[
  If $f(x) = x^(-n) quad ( n in NN )$, then $f'(x) = -n x^(-n-1)$

  #proof[
    Rewrite the function as a fraction: $f(x) = 1 / x^n$.

    Now, apply the quotient rule:
    $
      f'(x) &= ( (1)'(x^n) - (1)(x^n)' ) / ( (x^n)^2 ) \
      &= ( 0 dot x^n - n x^(n-1) ) / ( x^(2n) ) \
      &= ( -n x^(n-1) ) / ( x^(2n) ) \
      &= -n x^(n - 1 - 2n) \
      &= -n x^(-n-1)
    $
  ]
]

We will later prove the general power rule for real exponents. For now we state it and will use it in examples and exercises.
#theorem()[
  If $f(x) = x^r quad (x in RR)$, then $f'(x) = r x^(r-1)$
]

#example()[
  *Reciprocal Rule*
]

#example("Tangent lines")[
  Find the equations of the tangent line and normal line to the curve $y=sq(x)/(1+x sr)$ at the point $(1, 1/2)$.
  #solution()[
    $ y' = ((sq(x))'(1 + x sr) - sq(x)(1 + x sr)')/(1 + x sr)^2 = (1/(2sq(x))(1+ x sr) - sq(x)(2x))/(1+x sr)^2 $
    Thus the slope at the point is $-1/4$
    $ therefore y = -1/4x+3/4 wide y = 4x-7/2 $
  ]
]
