#import "../../templates/templater.typ": *

= The Chain Rule

Say we want to differentiate $f(x) = sqrt(sin(x))$. How do we do this?
The chain rule is a powerful tool to solve the derivative of composite functions.

#definition("Chain Rule")[
  If $f(x) = a(b(x))$, then $f'(x) = a'(b(x)) b'(x)$.
  #proof("")[
    $
      f'(x) & = lim_(h->0) (f(x+h)-f(x))/h = lim_(h->0) (a(b(x+h))-a(b(x)))/h \
            & = lim_(h->0) (a(b(x+h)) - a(b(x)))/(b(x+h) - b(x)) dot (b(x+h) - b(x))/h \
            & = a'(b(x)) dot b'(x)
    $
  ]
  #note("Leibniz Notation")[
    If you prefer the leibniz notation, you can write $ (d y)/(d x) = (d y)/(d u) dot (d u)/(d x) $.
  ]
]


#example("Chain Rule Basics")[
  Find $F'(x)$ if $F = sqrt(x^2 + 1)$.
  #solution("")[
    Using the chain rule, we get $F'(x) = (1/2)(x^2 + 1)^(-1/2) dot 2x = x/(sqrt(x^2 + 1))$
  ]
]

#example("Chain Rule with Trigonometric Functions")[
  Find $F'(x)$ if $F = sin(sqrt(x))$.
  #solution("")[
    Using the chain rule, we get $F'(x) = cos(sqrt(x)) dot (1/2)(x^2 + 1)^(-1/2) dot 2x = cos(sqrt(x)) / (2 dot sqrt(x^2 + 1))$.
  ]
]

One useful form to note is the Power Rule combined with the Chain Rule :
#definition("Power Rule with Chain Rule")[
  If $f(x) = (g(x))^n$, then $f'(x) = n(g(x))^(n-1) g'(x)$.
]

#example("Power Rule with Chain Rule")[
  Differentiate $y = (x^3 - 1)^100$
  #solution("")[
    Using the power rule with chain rule, we get $y' = 100(x^3 - 1)^99 dot 3x^2 = 300x^2(x^3 - 1)^99$
  ]
]
