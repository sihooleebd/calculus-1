#import "../../templates/templater.typ": *

= Trigonometric Functions...
We dealed with normal polynomials in the last section, so now we need to deal with trigonometric functions.
#definition("Derivative of Sine Function")[
  If $f(x) = sin(x)$, then $f'(x) = cos(x)$.
  #proof("")[
    $
      f'(x) & = lim_(h->0) (f(x+h)-f(x))/h \
            & = lim_(h->0) (sin(x+h)-sin(x))/h \
            & = lim_(h->0) (sin(x)cos(h)+cos(x)sin(h)-sin(x))/h \
            & = lim_(h->0) lr([ (sin(x)cos(h) - sin(x))/h + (cos(x)sin(h))/h ]) \
            & = lim_(h->0) lr([ sin(x)((cos(h)-1)/h) + cos(x)(sin(h)/h) ]) \
            & = lim_(h->0) sin(x) dot lim_(h->0) (cos(h)-1)/h + lim_(h->0) cos(x) dot lim_(h->0) sin(h)/h
    $
    Since we treat $x$ as a constant during limits with $h$,
  ]
]
