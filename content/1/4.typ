#import "../../templates/templater.typ": *

= Three Special Trigonometric Limits
#theorem("Three Special Trigonometric Limits")[
  + $limx(0) (sin x)/(x) = 1$
  + $limx(0) (1-cos x)/x^2 = 1/2$
  + $limx(0) (tan x)/x = 1$
  #proof[
    #image("../images/trigproof", width: 30%)
    $ abs(B C) = sin theta < accent(A B, paren.t) = theta < abs( A E ) + abs(B E) <abs(A E) + abs(D E) = tan theta $
    $ ==> sin theta < theta < tan theta <==> cos theta < (sin theta)/theta < 1 $
    Since $0<sin theta < theta$

    Using the squeeze theorem,
    $ lim_(theta -> 0^+) sin theta = 0 $
    To evaluate the limit as $theta -> 0^-$ let $theta = -t$. Then $theta -> 0^+$ and sin is odd function.
    Hence
    // TODO: Fill here by ppt
  ]
  #proof[
    $
      lim_(x->0) (1-cos x)/x^2 =
    $
  ]
]

#example()[
  Find $ limx(0)(sin 7 x)/(4x) $
  #solution()[
    $ limx(0)(sin 7 x)/(4x) = limx(0)(sin 7x)/(7x) dot 7/4 = 7/4 $
    Can we just substitute it??
  ]
]

#example()[
  $ limx(0) csc x sin( sin x ) $
  #solution()[
    $ = limx(0) (sin(sin x))/(sin x) $
    Let
    $ f(x) = cases((sin x)/x space \, &x != 0, 1 \, &x != 0) $
    f is continuous.
    $ = limx(0) (sin(sin x))/(sin x) = limx(0) f(sin x) = f(limx(0) sin x) = f(1) = 1 $
  ]
]

= Derivatives of Trig Functions

#theorem()[
  + $d/dx sin x = cos x$
  + $dif/dx cos x = - sin x$
  + $dif/dx tan x = sec sr x$
  + $dif/dx csc x = - csc x cot x$
  + $dif/dx sec x = tan x sec x$
  + $dif/dx cot x = - csc sr x$
]
#proof()[
  #lorem(100)
]

#note("Remark")[
  The derivatives of $sin x$ and $cos x$ repeat in a cycle of length 4.
  $ sin x -> cos x -> -sin x -> -cos x -> sin x $
  $ cos x -> -sin x -> -cos x -> sin x -> cos x $
]

#example("no mod")[
  Derivatives of $cos x$ repeat in a cycle of length 4. Since $27 = 4 dot 6 + 3$,
  $ cos^(27) x = cos^(3) x = sin x $
  Do not use modulo here
]
