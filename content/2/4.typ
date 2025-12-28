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
    Since we treat $x$ as a constant during limits with $h$, we can take $sin(x)$ and $cos(x)$ out of the limits.
    $ = sin(x) dot lim_(h->0)(cos(h)-1)/h + cos(x) dot lim_(h->0) sin(h)/h $
    We'll later prove that $lim_(h->0)sin(h)/h = 1$, and $lim_(h->0)(cos(h)-1)/h = 1$. 

    Thus, we get $cos(x)$.
  ]

] 

Using the exact same method, we can prove the derivative of cosine.
#definition("Derivative of Cosine Function")[
  If $f(x) = cos(x)$, then $f'(x) = -sin(x)$.
  #proof("")[
    $
      f'(x) & = lim_(h->0) (f(x+h)-f(x))/h \
            & = lim_(h->0) (cos(x+h)-cos(x))/h \
            & = lim_(h->0) (cos(x)cos(h)-sin(x)sin(h)-cos(x))/h \
            & = lim_(h->0) lr([ (cos(x)cos(h) - cos(x))/h - (sin(x)sin(h))/h ]) \
            & = lim_(h->0) lr([ cos(x)((cos(h)-1)/h) - sin(x)(sin(h)/h) ]) \
            & = lim_(h->0) cos(x) dot lim_(h->0) (cos(h)-1)/h - lim_(h->0) sin(x) dot lim_(h->0) sin(h)/h
    $
    Since we treat $x$ as a constant during limits with $h$, we can take $sin(x)$ and $cos(x)$ out of the limits.
    $ = cos(x) dot lim_(h->0)(cos(h)-1)/h - sin(x) dot lim_(h->0) sin(h)/h $
    We'll later prove that $lim_(h->0)sin(h)/h = 1$, and $lim_(h->0)(cos(h)-1)/h = 1$.

    Thus, we get $-sin(x)$.
  ] 
]

Since we know the derivatives of sine and cosine, we can easily think of the derivative of the tangent function, since $tan(x) = sin(x)/cos(x)$.
#definition("Derivative of Tangent Function")[
  If $f(x) = tan(x)$, then $f'(x) = sec^2(x)$.
  #proof("")[
    Using the Quotient Rule :
    $
      f'(x) & = (cos(x) dot d/(d x)[sin(x)] - sin(x) dot d/(d x)[cos(x)]) / (cos(x))^2 \
            & = (cos(x) dot cos(x) - sin(x) dot (-sin(x))) / (cos(x))^2 \
            & = (cos^2(x) + sin^2(x)) / (cos(x))^2 \
            & = 1 / (cos(x))^2 \
            & = sec^2(x)
    $
  ]
] 

The derivatives of $csc(x), sec(x), cot(x)$ can be derived using a similar method. 
In the end, we have the following results :
$ d/(d x) (sin(x)) = cos(x) $
$ d/(d x) (cos(x)) = -sin(x) $
$ d/(d x) (tan(x)) = sec^2(x) $
$ d/(d x) (csc(x)) = -csc(x) cot(x) $
$ d/(d x) (sec(x)) = sec(x) tan(x) $
$ d/(d x) (cot(x)) = -csc^2(x) $ 

#example("Trigonometric Derivative Example")[
  An object fastened to the end of a vertical string stretched 4cm from rest is releasted at time $t=0$. Its position at time $t$ is $ s = f(t) = 4cos(t) $
  Find the velocity and acceleration of the object at time $t$.
  #solution("")[
    The velocity is the derivative of the position function:
    $ v(t) = f'(t) = d/(d t)[4cos(t)] = -4sin(t) $
    The acceleration is the derivative of the velocity function:
    $ a(t) = v'(t) = d/(d t)[-4sin(t)] = -4cos(t) $
  ]
]
 