
#import "../../templates/templater.typ": *

= The "Precise" Definition of a Limit
- Till now, we have been using _intuitive_ methods to define the limits of functions. However, in order to be more _precise_, we need a more rigorous definition of limits.

#example("A Weird Function")[
  Consider the following function :
  $cases(2x - 1 &"    if " x eq.not 3, 6 &"    if " x = 3)$.
  What is $f(3)$? What is $lim_(x -> 3) f(x)$?
  #solution("")[
    $f(3) = 6$, since when $x = 3$, the function outputs $6$. However, to find $lim_(x -> 3) f(x)$, we need to see what value $f(x)$ approaches as $x$ gets closer and closer to $3$. As $x$ approaches $3$, $f(x)$ approaches $2(3) - 1 = 5$. Therefore, $lim_(x -> 3) f(x) = 5$.
  ]
]

- Consider the example above. How can we more "accurately" define the limit of a function at a point, without relying on intuition or graphs?
- In te problem above, consider the following question.
  - "How close to $3$ does $x$ need to be, so that $f(x)$ is within $0.1$ of $5$?"
  - In other words, we want to find some value $delta$ s.t.
  $ norm(f(x)-5) < 0.1 "    if    " norm(x-3)<delta "  but" x eq.not 3 $
  If $norm(x-3)>0$, then $x eq.not 3$, so we can simplify the problem into the following :
  - "How close to $3$ does $x$ need to be, so that $f(x)$ is within $0.1$ of $5$, given that $x eq.not 3$
  $ norm(f(x)-5) < 0.1 "    if    " 0<norm(x-3)<delta $
  
  *Here, we call $0.1$ the "Error Tolerance"*. Since we are going to send this to 0, let us replace this with $epsilon$ for the time being. So the question becomes :
  $ norm(f(x)-5) < epsilon "    if    " 0<norm(x-3)<delta $
  
  Now, we finally have the tools to define the limit of a function more "precisely".

#definition("Precise Definition of a Limit")[
  Let $f$ be a function defined on an open interval containing $a$, except possibly at $a$ itself. We say that $lim_(x -> a) f(x) = L$ if for every $epsilon > 0$, there exists a $delta > 0$ such that
  $ norm(f(x)-L) < epsilon "    if    " 0<norm(x-a)<delta $
  
  To simplify even more, we can write like this(in style):
  $ forall epsilon > 0, exists delta > 0, "s.t." 0<norm(x-a)<delta arrow.r.long.double norm(f(x)-L) < epsilon $
]

Since we have to divide them later anyway, we can do it now :
#definition("Precise definition of a left-hand limit")[
  Let $f$ be a function defined on an open interval containing $a$, except possibly at $a$ itself. We say that $lim_(x -> a^-) f(x) = L$ if for every $epsilon > 0$, there exists a $delta > 0$ such that
  $ norm(f(x)-L) < epsilon "    if    " a - delta < x < a $
  
  To simplify even more, we can write like this:
  $ forall epsilon > 0, exists delta > 0, "s.t." a - delta < x < a arrow.r.long.double norm(f(x)-L) < epsilon $
]
#definition("Precise definition of a right-hand limit")[
  Let $f$ be a function defined on an open interval containing $a$, except possibly at $a$ itself. We say that $lim_(x -> a^+) f(x) = L$ if for every $epsilon > 0$, there exists a $delta > 0$ such that
  $ norm(f(x)-L) < epsilon "    if    " a < x < a + delta $
  
  To simplify even more, we can write like this:
  $ forall epsilon > 0, exists delta > 0, "s.t." a < x < a + delta arrow.r.long.double norm(f(x)-L) < epsilon $
]

One good way to understand the epsilon-delta method is by assuming we chose a "wrong" limit value "L'". In this case, we must be able to find a $delta$ for any arbitrary $epsilon$ given. Since we chose a wrong limit value, there will always be some $x$ values within the $delta$-neighborhood of $a$ that make $f(x)$ be outside the $epsilon$-neighborhood of "L'". This means that no matter how small we choose $delta$, there will always be some $x$ values that break the condition. Thus, we can conclude that "L'" is not the correct limit value.
#note("Usage of the epsilon-delta method")[
  The epsilon-delta method can only be used to *"prove"* that a certain limit value is correct. It cannot be used to *"find"* the limit value itself.
]

Now lets utilize this to solve some problems.

#example("Epsilon-Delta Basics")[
  Prove that $lim_(x -> 3) (4x - 5) = 7$ using the epsilon-delta definition of a limit.
  #solution("")[
    Let $epsilon > 0$ be given. We need to find a $delta > 0$ such that
    $ norm((4x - 5) - 7) < epsilon "    if    " 0<norm(x-3)<delta $
    
    1. Preliminary Analysis :
    Simplifying the left side, we have :
    $ norm(4x - 12) = 4 * norm(x - 3) $
    
    So we want to ensure that
    $ 4 * norm(x - 3) < epsilon "    if    " 0<norm(x-3)<delta $
    
    To achieve this, we can choose $delta = epsilon / 4$. Then, if $0 < norm(x - 3) < delta$, we have
    $ norm((4x - 5) - 7) = 4 * norm(x - 3) < 4 * delta = epsilon $
    
    2. Formal Proof :
    Let $epsilon > 0$ be given. Choose $delta = epsilon / 4$. Then, if $0 < norm(x - 3) < delta$, we have
    $ norm((4x - 5) - 7) = 4 * norm(x - 3) < 4 * delta = epsilon $
    
    Thus, by the epsilon-delta definition of a limit, we conclude that $lim_(x -> 3) (4x - 5) = 7$.
    #align(center)[
      #image("../images/epsilon-delta-ex.png", width: 50%)
    ]
  ]
]

#example("Epsilon-Delta Basics 2")[
  Describe $lim_(x -> a) x^2 = a^2$ using the epsilon-delta definition of a limit.
  #solution("")[
    Let $epsilon > 0$ be given. We need to find a $delta > 0$ such that
    $ norm(x^2 - a^2) < epsilon "    if    " 0<norm(x-a)<delta $
    1. Preliminary Analysis :
    Simplifying the left side, we have :
    $ norm(x^2 - a^2) = norm((x - a)(x + a)) = norm(x - a) * norm(x + a) $
    To control $norm(x + a)$, we can restrict $delta$ to be less than $1$(an arbitrary number). This means that if $0 < norm(x - a) < delta < 1$, then
    $ norm(x - a) < 1 arrow.r.long.double norm(x) < norm(a) + 1 $
    Thus, we have
    $ norm(x + a) ≤ norm(x) + norm(a) < (norm(a) + 1) + norm(a) = 2 * norm(a) + 1 $
    Therefore, we want to ensure that
    $ norm(x - a) * (2 * norm(a) + 1) < epsilon "    if    " 0<norm(x-a)<delta < 1 $
    To achieve this, we can choose $delta = min(1, epsilon / (2 * norm(a) + 1))$. Then, if $0 < norm(x - a) < delta$, we have
    $
      norm(x^2 - a^2) = norm(x - a) * norm(x + a) < delta * (2 * norm(a) + 1) ≤ (epsilon / (2 * norm(a) + 1)) * (2 * norm(a) + 1) = epsilon
    $
    2. Formal Proof :
    Let $epsilon > 0$ be given. Choose $delta = min(1, epsilon / (2 * norm(a) + 1))$. Then, if $0 < norm (x - a) < delta$, we have
    $
      norm(x^2 - a^2) = norm(x - a) * norm(x + a) < delta * (2 * norm(a) + 1) ≤ (epsilon / (2 * norm(a) + 1)) * (2 * norm(a) + 1) = epsilon
    $
    Thus, by the epsilon-delta definition of a limit, we conclude that $lim_(x -> a) x^2 = a^2$.
    #note("Why can we assign an arbitrary number to delta?")[
      In the preliminary analysis, we restricted $delta$ to be less than $1$ to control the value of $norm(x + a)$. This is a common technique in epsilon-delta proofs to ensure that certain expressions remain bounded. By choosing $delta$ to be the minimum of $1$ and another expression, we can effectively manage the behavior of the function within the desired neighborhood around the point $a$. To say intuitively, we are "bounding" the function in the neighborhood of $a$ once more outside of delta.
    ]
  ]
]

#example("Epsilon-Delta Basics 3")[
  Describe $lim_(x->1)(x^2-1)/(x-1) = 2$ using the epsilon-delta definition of a limit.
  #solution("")[
    Let $epsilon > 0$ be given. We need to find a $delta > 0$ such that
    $ norm((x^2 - 1)/(x - 1) - 2) < epsilon "    if    " 0<norm(x-1)<delta $
    1. Preliminary Analysis :
    Simplifying the left side, we have :
    $ norm((x^2 - 1)/(x - 1) - 2) = norm((x - 1)(x + 1)/(x - 1) - 2) = norm(x + 1 - 2) = norm(x - 1) $
    Therefore, we want to ensure that
    $ norm(x - 1) < epsilon "    if    " 0<norm(x-1)<delta $
    To achieve this, we can choose $delta = epsilon$. Then, if $0 < norm(x - 1) < delta$, we have
    $ norm((x^2 - 1)/(x - 1) - 2) = norm(x - 1) < delta = epsilon $
    2. Formal Proof :
    Let $epsilon > 0$ be given. Choose $delta = epsilon$. Then, if $0 < norm(x - 1) < delta$, we have
    $ norm((x^2 - 1)/(x - 1) - 2) = norm(x - 1) < delta = epsilon $
    Thus, by the epsilon-delta definition of a limit, we conclude that $lim_(x->1)(x^2-1)/(x-1) = 2$.
  ]
]


#example("Epsilon-Delta Basics 4")[
  Describe $lim_(x->0+) sqrt(x) = 0$ using the epsilon-delta definition of a limit.
  #solution("")[
    Let $epsilon > 0$ be given. We need to find a $delta > 0$ such that
    $ norm(sqrt(x) - 0) < epsilon "    if    " 0<x<delta $
    1. Preliminary Analysis :
    Simplifying the left side, we have :
    $ norm(sqrt(x) - 0) = sqrt(x) $
    Therefore, we want to ensure that
    $ sqrt(x) < epsilon "    if    " 0<x<delta $
    To achieve this, we can choose $delta = epsilon^2$. Then, if $0 < x < delta$, we have
    $ norm(sqrt(x) - 0) = sqrt(x) < sqrt(delta) = sqrt(epsilon^2) = epsilon $
    2. Formal Proof :
    Let $epsilon > 0$ be given. Choose $delta = epsilon^2$. Then, if $0 < x < delta$, we have
    $ norm(sqrt(x) - 0) = sqrt(x) < sqrt(delta) = sqrt(epsilon^2) = epsilon $
    Thus, by the epsilon-delta definition of a limit, we conclude that $lim_(x->0+) sqrt(x) = 0$.
  ]
]