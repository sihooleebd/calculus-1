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

  However, if $b(x)$ is a constant function, or for sake has a place where the denominator is $0$, it directly leads to a divide by zero error. Thus, people found a better method for that :
  #proof("Foolproof")[
    We must know a small theorem before we continue :
    #theorem("")[
      If a function is differentiable, the actual change is equal to the linear approximation at the point plus a small error.

      $ Delta y = underbrace(f'(a)Delta x, "Linear Projection") + underbrace(epsilon Delta x, "Error Term") $
    ]
    Let's utilize this. Let $b = g(a)$. If we have $u=g(x)$ and $y=f(u)$, we can derive the two equations :
    $ Delta u = g'(a) Delta x + epsilon_1 Delta x = [g'(a) + epsilon_1] Delta x $
    $ Delta y = f'(b) Delta u + epsilon_2 Delta u = [f'(b) + epsilon_2] Delta u $
    Plug in $Delta u$ to the lower equation, we get
    $ (Delta y)/(Delta x) = [f'(b) + epsilon_2][g'(a) + epsilon_1] cancel(Delta x) $
    Now if we take the limit of both sides, we get :
    $ lim_(Delta x -> 0) (Delta y)/(Delta x) = lim_(Delta x->0) [f'(b) + epsilon_2][g'(a) + epsilon_1] $
    Since the error will near zero once $lim_(Delta x -> 0)$, we get $f'(b)g'(a) = f'(g(a))g'(a)$.

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
    Using the power rule with chain rule, we get $ y' = 100(x^3 - 1)^99 dot 3x^2 = 300x^2(x^3 - 1)^99 $
  ]
]

