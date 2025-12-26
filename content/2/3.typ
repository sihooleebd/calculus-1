#import "../../templates/templater.typ": *

= Differentiation Formulas

- Let's start with the simplest
#definition("Derivative of a Constant Function")[
  If $f(x) = c$, where $c$ is a constant, then $f'(x) = 0$.
]

- Now, lets look at functions with powers of a certain number. Thus, this form : $f(x) = x^n$. What is the derivative of this function?
#definition("Derivate of Power Functions")[
  If $f(x) = x^n$, where $n$ is a real number, then $f'(x) = n * x^(n-1)$.
  #proof("")[
    We can prove this using the definition of the derivative.
    $ f'(x) = lim_(h->0) (f(x + h) - f(x)) / h $
    Substituting $f(x) = x^n$, we get:
    $ f'(x) = lim_(h->0) ((x + h)^n - x^n) / h $
    Using the Binomial Theorem to expand $(x + h)^n$, we have:
    $ (x + h)^n = sum_(k=0)^n (binom(n,k)) * x^(n-k) * h^k $
    Therefore,
    $ f'(x) = lim_(h->0) (sum_(k=0)^n (binom(n,k)) * x^(n-k) * h^k - x^n) / h $
    Simplifying, we get:
    $ f'(x) = lim_(h->0) (sum_(k=1)^n (binom(n,k)) * x^(n-k) * h^k) / h $
    $ = lim_(h->0) (sum_(k=1)^n (binom(n,k)) * x^(n-k) * h^(k-1)) $
    As $h$ approaches $0$, all terms with $k > 1$ vanish, leaving us with:
    $ f'(x) = n * x^(n-1) $
  ]
]