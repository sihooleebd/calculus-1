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



= Special Trigonometric Limits
- There are two special trigonometric limits that are very useful in calculus.
#theorem("Special Trigonometric Limits")[
  1. $ lim_(x -> 0) (sin(x)/x) = 1 $
  2. $ lim_(x -> 0) ((1 - cos(x))/x) = 0 $
  #proof("1")[
    We will utilize the Squeeze Theorem to prove this.
    #let O = point(0, 0, label: "O")
    #let A = point(5, 0, label: "A")
    #let C = point(5, 5 / calc.sqrt(3), label: "C")

    #let B = point-at-angle(
      O,
      30deg,
      5,
      from: A,
      label: "B",
    )
    #let D = point(x(B), 0, label: "D")
    #blank-canvas(
      O,
      A,
      B,
      C,
      D,
      arc(O, A, B),
      segment(O, A),
      segment(O, C),
      segment(O, B, label: "r"),
      segment(B, C),
      segment(A, C),
      segment(B, D),
      right-angle(B, D, O),
      right-angle(C, A, O),
      angle(A, O, B, label: $theta$),
    )
    Here, we know that the inequality
    $ overline(B D) <= overparen(A B) <= overline(A C) $
    If we take the limit $theta -> 0$, we get
    $ lim_(theta -> 0) overline(B D) <= lim_(theta -> 0) overparen(A B) <= lim_(theta -> 0) overline(A C) $
    $
      lim_(theta -> 0) overline(O B) sin(theta) <= lim_(theta -> 0) r theta <= lim_(theta->0) overline(O A) tan(theta)
    $
    Divide both sides by $sin(theta)$.
    $
      = lim_(theta->0) cancel(r) <= lim_(theta->0) (cancel(r) theta) / sin(theta) <= lim_(theta->0) cancel(r)/ cos(theta)
    $

    Take the inverse of each fraction.

    $
      lim_(theta->0) cos(theta) <= lim_(theta->0) sin(theta)/theta <= lim_(theta->0) 1
    $

    Since $lim_(theta -> 0) cos(theta) = 1$, we get
    $ 1 <= lim_(theta->0) sin(theta)/theta <= 1 $

    By the Squeeze Theorem, we get
    $ lim_(theta->0) sin(theta)/theta = 1 $
  ]
  #proof("2")[
    Multiply the numerator and denominator by $cos(theta) + 1$ to turn the numerator into a nice form.
    $
      lim_(theta->0) (cos(theta) -1) / theta &= lim_(theta-> 0) (cancel(cos(theta)^2 - 1) -sin(theta)^2) / (theta(cos(theta)+1)) \ &= -lim_(theta->0) sin(theta)/theta dot lim_(theta->0) sin(theta)/(cos(theta)+1) \ & = -1 * 0 = 0
    $
  ]
]
