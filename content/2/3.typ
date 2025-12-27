#import "../../templates/templater.typ": *

= Differentiation Formulas

- Let's start with the simplest
#definition("Derivative of a Constant Function")[
  If $f(x) = c$, where $c$ is a constant, then $d/(d x) (c) = 0$.
]

- Now, lets look at functions with powers of a certain number. Thus, this form : $f(x) = x^n$. What is the derivative of this function?
#definition("Derivate of Power Functions")[
  If $f(x) = x^n$, where $n$ is a real number, then $d/(d x) (x^n) = n * x^(n-1)$.
  #proof("")[
    We can prove this using the definition of the derivative.
    $ f'(x) = lim_(h->0) (f(x + h) - f(x)) / h $
    Substituting $f(x) = x^n$, we get:
    $ f'(x) = lim_(h->0) ((x + h)^n - x^n) / h $
    Using the Binomial Theorem to expand $(x + h)^n$, we have:
    $ (x + h)^n = sum_(k=0)^n (binom(n, k)) * x^(n-k) * h^k $
    Therefore,
    $ f'(x) = lim_(h->0) (sum_(k=0)^n (binom(n, k)) * x^(n-k) * h^k - x^n) / h $
    Simplifying, we get:
    $ f'(x) = lim_(h->0) (sum_(k=1)^n (binom(n, k)) * x^(n-k) * h^k) / h $
    $ = lim_(h->0) (sum_(k=1)^n (binom(n, k)) * x^(n-k) * h^(k-1)) $
    As $h$ approaches $0$, all terms with $k > 1$ vanish, leaving us with:
    $ f'(x) = n * x^(n-1) $
  ]
]

From this, we can derive the power rule,
#theorem("Power Rule")[
  If $f(x) = x^n$, where $n$ is a real number, then $d/(d x) (x^n) = n * x^(n-1)$.
  #proof("Method 1")[
    The Formula
    $ x^n - a^n = (x - a) * (x^(n-1) + x^(n-2) * a + ... + x * a^(n-2) + a^(n-1)) $
    can be used to find the derivative of $f(x) = x^n$.

    $
      f'(a) & = lim_(x->a) (f(x)-f(a))/(x-a) \
            & = lim_(x->a) ((x^n-a^n)/(x-a)) \
            & = lim_(x->a) ((x-a) * (x^(n-1) + x^(n-2) * a + ... + x * a^(n-2) + a^(n-1)))/(x-a) \
            & = lim_(x->a) (x^(n-1) + x^(n-2) * a + ... + x * a^(n-2) + a^(n-1)) \
            & = a^(n-1) + a^(n-2) * a + ... + a * a^(n-2) + a^(n-1) = n * a^(n-1)
    $
  ]
  #proof("Method 2")[
    We can use the binomial theorem to prove this.
    $ (x + h)^n = sum_(k=0)^n (binom(n, k)) * x^(n-k) * h^k $
    Substituting $f(x) = x^n$, we get:
    $ f'(x) = lim_(h->0) ((x + h)^n - x^n) / h $
    Using the Binomial Theorem to expand $(x + h)^n$, we have:
    $ (x + h)^n = sum_(k=0)^n (binom(n, k)) * x^(n-k) * h^k $
    Therefore,
    $ f'(x) = lim_(h->0) (sum_(k=0)^n (binom(n, k)) * x^(n-k) * h^k - x^n) / h $
    Simplifying, we get:
    $ f'(x) = lim_(h->0) (sum_(k=1)^n (binom(n, k)) * x^(n-k) * h^k) / h $
    $ = lim_(h->0) (sum_(k=1)^n (binom(n, k)) * x^(n-k) * h^(k-1)) $
    As $h$ approaches $0$, all terms with $k > 1$ vanish, leaving us with:
    $ f'(x) = n * x^(n-1) $
  ]
  #note("What if " + $n < 0$ + " ?")[
    We can extend the power rule to work for negative powers.
    #proof("")[
      $
        d/(d x) (x^(-n)) & = d/(d x) (1/x^n) \
                         & = (x^n d/(d x) (1) - 1 d/(d x) (x^n))/x^(2n) \
                         & = (-n x^(n-1)/x^(2n)) = -n x^(-n-1)
      $
    ]
  ]
]

Then how to we take care of coefficients? For that, we have the constant multiple rule :
#theorem("Constant Multiple Rule")[
  If $f(x) = c * g(x)$, where $c$ is a constant and $g(x)$ is a differentiable function, then $f'(x) = c * g'(x)$.
  #proof("")[
    $ f'(x) = lim_(h->0) (f(x+h)-f(x))/h $
    Substituting $f(x) = c * g(x)$, we get:
    $ f'(x) = lim_(h->0) (c * g(x+h) - c * g(x))/h $
    Factoring out $c$, we get:
    $ f'(x) = c * lim_(h->0) (g(x+h) - g(x))/h $
    Since $g(x)$ is differentiable, we can use the definition of the derivative to write:
    $ f'(x) = c * g'(x) $
  ]
]

As we talked about during limit laws and continuity, we need to deal with the arithemetic of function derivatives.
#theorem("The Sum and Difference Rules")[
  If $f$ and $g$ are both differentiable, then
  $ (f(x) plus.minus g(x))' = f'(x) plus.minus g'(x) $
  #proof("")[
    Let $l(x) = f(x) plus.minus g(x)$.
    Then,
    $
      l'(x) & =lim_(h->0) (l(x+h)-l(x))/h \
            & =lim_(h->0) (f(x+h) plus.minus g(x+h) - f(x) minus.plus g(x))/h \
            & =lim_(h->0) (f(x+h) - f(x))/h plus.minus lim_(h->0) (g(x+h) - g(x))/h \
            & =f'(x) plus.minus g'(x)
    $
  ]
]
#theorem("The Product Rule")[
  If $f$ and $g$ are both differentiable, then
  $ (f(x) * g(x))' = f'(x) * g(x) + f(x) * g'(x) $
  #proof("")[
    Let $h(x) = f(x) * g(x)$.
    Then,
    $ h'(x) = lim_(h->0) (h(x+h) - h(x))/h $
    Substituting $h(x) = f(x) * g(x)$, we get:
    $ h'(x) = lim_(h->0) (f(x+h) * g(x+h) - f(x) * g(x))/h $
    We can add and subtract the same value, so lets add and subtract $f(x+h)g(x)$.
    $ h'(x) = lim_(h->0) (f(x+h) * g(x+h) - f(x+h) * g(x) + f(x+h) * g(x) - f(x) * g(x))/h $
    Factoring out $g(x)$, we get:
    $ h'(x) = lim_(h->0) (g(x) * (f(x+h) - f(x))/h + f(x) * (g(x+h) - g(x))/h) $
    Since $f(x)$ and $g(x)$ have no relation with $h$, we can pull it out of the limit using the constant multiple rule.
    $ h'(x) = g(x) * lim_(h->0) (f(x+h) - f(x))/h + f(x) * lim_(h->0) (g(x+h) - g(x))/h $
    Using the definition of the derivative, we get:
    $ h'(x) = g(x) * f'(x) + f(x) * g'(x) $
  ]
]
#theorem("The Quotient Rule")[
  If $f$ and $g$ are both differentiable, then
  $ (f(x) / g(x))' = (f'(x) * g(x) - f(x) * g'(x)) / g(x)^2 $
  #proof("")[
    Let $h(x) = f(x) / g(x)$.
    Then,
    $ h'(x) = lim_(h->0) (h(x+h) - h(x))/h $
    Substituting $h(x) = f(x) / g(x)$, we get:
    $ h'(x) = lim_(h->0) (f(x+h) / g(x+h) - f(x) / g(x))/h $
    $ = lim_(h->0) (f(x+h)g(x) - f(x)g(x+h))/(h g(x)g(x+h)) $

    Now lets add and subtract $f(x)g(x)$ to the numerator.
    $ h'(x) = lim_(h->0) (f(x+h)g(x) - f(x)g(x+h) + f(x)g(x) - f(x)g(x))/(h g(x)g(x+h)) $
    Group into useful groups,
    $ h'(x) = lim_(h->0) (f(x+h)g(x) - f(x)g(x+h) + f(x)g(x) - f(x)g(x))/(h g(x)g(x+h)) $
    $ = lim_(h->0) (g(x)(f(x+h)-g(x))/h + (f(x)g(x)-g(x+h))/h)/(g(x)g(x+h)) ) $
    $ = (g(x)f'(x) - f(x)g'(x)) / g(x)^2 $

  ]
]

in the end, the full list of differntial formulas is:
$ d/(d x) (c) = 0 $,
$ d/(d x) (x^n) = n x^(n-1) $,
$ (c * f(x))' = c * f'(x) $,
$ (f(x) plus.minus g(x))' = f'(x) plus.minus g'(x) $,
$ (f(x) * g(x))' = f'(x) * g(x) + f(x) * g'(x) $,
$ (f(x) / g(x))' = (f'(x) * g(x) - f(x) * g'(x)) / g(x)^2 $
