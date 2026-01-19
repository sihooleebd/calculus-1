
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

= More and More Problems
#example("Problem 1")[
  Prove the following using $epsilon"-"delta$ definition of a limit.
  + $limx(1) 2x + 3 = 5 $
  + $limx(0) x sr = 0 $
  + $limx(2) x sr = 4$
  + $limx(3) x cb = 27$
  + $limx(4) 1/x = 1/4$
  #solution()[
    $ limx(1) 2x + 3 = 5 $
    In order to prove this, we should show that
    $ forall epsilon > 0 thin [ thin exists delta > 0 thin [thin (0<abs(x-1)<delta ==> abs((2x+3) - 5) < epsilon) thin] thin ] $
    is true.
    
    Here, we can observe that
    $ abs((2x+3)-5)=abs(2x-2)=2 abs(x-1) < epsilon <==> abs(x-1) < epsilon/2 $
    Let's take $delta$ as a value that satisfies $delta <= epsilon/2$ for given $epsilon$.
    Then,
    $ 0 < abs(x-1) < delta <= epsilon/2 $
    $ ==> (0<abs(x-1)<delta) and (0<abs(x-1)<epsilon/2<=>0<abs((2x+3)-5)<epsilon) $
    $ ==> (0<abs(x-1)<delta => abs((2x+3) - 5) < epsilon) $
    Hence, for any given $epsilon$, If we take $delta$ as a value that satisfies $delta <= epsilon/2$ (e.g. $epsilon/2$), the statement holds.
    In other words, for all $epsilon$ there exists a $delta=epsilon/2$ #st $ 0<abs(x-1)<delta ==> abs((2x+3) - 5) < epsilon $
    #qed
  ]
  #solution()[
    $ limx(0) x sr = 0 $
    In order to prove this, we should show that
    $ forall epsilon > 0 thin [thin exists delta > 0 thin [thin (0<abs(x-0)<delta ==> abs(x sr - 0)<epsilon) thin] thin] $
    $ <==> forall epsilon > 0 thin [thin exists delta > 0 thin [thin (0<abs(x)<delta ==> x sr <epsilon) thin] thin] $
    $ <==> forall epsilon > 0 thin [thin exists delta > 0 thin [thin (0<abs(x)<delta ==> abs(x)dot abs(x) <epsilon) thin] thin] $
    is true.
    
    In order to bound the range of $abs(x)$, let's randomly assume that our chosen $delta$ for each $epsilon$ is less or equal than 1. \
    Then,
    $ 0 < abs(x) < delta <= 1 ==> 0 < abs(x) < 1 $
    $ abs(x) < 1 ==> abs(x) dot abs(x) < abs(x) ==> abs(x sr) < abs(x) $
    
    $ ==> 0 <= abs(x sr) < abs(x) < delta $
    
    To obtain relationship between $epsilon$, let's take $delta$ as a value that satisfies $delta <= epsilon$ for any given $epsilon$.
    Then,
    $ ==> 0 <= abs(x sr) < abs(x) < delta <= epsilon $
    
    $ ==> [(0<abs(x)<delta) and (abs(x sr)<epsilon)] ==> [(0<abs(x-0)<delta) => (abs(x sr-0)<epsilon)] $
    
    So, the initial statement is proven if there exist a $delta$ such that satisfies \ $[(delta<=1)and(delta<=epsilon)]$.
    
    #note("min trick")[
      for some constant number $j,k$, in order to show the existance of $delta$ that satisfies $[(delta<=j)and(delta<=k epsilon)]$, we can take $delta$ as:
      $ delta = min(j, k epsilon) $
      #proof()[
        If $epsilon <= j/k <==> k epsilon <= j $, then $delta = min(j, k epsilon) = k epsilon$.
        Since $delta=k epsilon$, $delta<=k epsilon$. Also, since $k epsilon <= j$, $delta<=j$.
        $ therefore [(delta<=j)and(delta<=k epsilon)] $
        We can prove simillarly for when $epsilon > j/k$ too.
      ]
    ]
    Just like on the above note, by taking $delta = min(1, epsilon)$, the existance of $delta$ that satisfies the condition for any $delta$ is proven.
    
    #qed
  ]
  
  #solution("", 3)[
    $ limx(2) x sr = 4 $
    In order to prove this, we should show that
    $ forall epsilon > 0 thin [thin exists delta > 0 thin [thin (0<abs(x-2)<delta ==> abs(x sr - 4)<epsilon) thin] thin] $
    $ <==> forall epsilon > 0 thin [thin exists delta > 0 thin [thin (0<abs(x-2)<delta ==> abs(x-2)dot abs(x+2) <epsilon) thin] thin] $
    is true.
    
    In order to bound the range of $abs(x+2)$, let's randomly assume that our chosen $delta$ for each $epsilon$ is less or equal than 1. \
    Then,
    $ 0 < abs(x-2) < delta <= 1 ==> -1 < x-2 < 1 ==> 1 < x < 3 $
    $ ==> 3 < x+2 < 5 ==> abs(x+2) < 5 $
    
    $ abs(x sr - 4) = abs(x-2) dot abs(x+2) < 5 abs(x-2) $
    
    To obtain relationship between $epsilon$, let's take $delta$ as a value that satisfies $delta <= epsilon/5$ for any given $epsilon$.
    Then,
    $ ==> abs(x sr - 4) < 5 abs(x-2) < 5 delta <= 5 (epsilon/5) = epsilon $
    
    So, the initial statement is proven if there exist a $delta$ such that satisfies \ $[(delta<=1)and(delta<=epsilon/5)]$.
    
    By using the min trick, by taking $delta = min(1, epsilon/5)$, the existance of $delta$ that satisfies the condition for any $epsilon$ is proven.
    
    #qed
  ]
  #solution("", 4)[
    $ limx(3) x cb = 27 $
    In order to prove this, we should show that
    $ forall epsilon > 0 thin [thin exists delta > 0 thin [thin (0<abs(x-3)<delta ==> abs(x cb - 27)<epsilon) thin] thin] $
    $ <==> forall epsilon > 0 thin [thin exists delta > 0 thin [thin (0<abs(x-3)<delta ==> abs(x-3)dot abs(x^2+3x+9) <epsilon) thin] thin] $
    is true.
    
    In order to bound the range of $abs(x^2+3x+9)$, let's randomly assume that our chosen $delta$ for each $epsilon$ is less or equal than 1. \
    Then,
    $ 0 < abs(x-3) < delta <= 1 ==> -1 < x-3 < 1 ==> 2 < x < 4 $
    $ ==> abs(x^2+3x+9) < abs(4^2+3(4)+9) = 16+12+9 = 37 $
    
    $ abs(x cb - 27) = abs(x-3) dot abs(x^2+3x+9) < 37 abs(x-3) $
    
    To obtain relationship between $epsilon$, let's take $delta$ as a value that satisfies $delta <= epsilon/37$ for any given $epsilon$.
    Then,
    $ ==> abs(x cb - 27) < 37 abs(x-3) < 37 delta <= 37 (epsilon/37) = epsilon $
    
    So, the initial statement is proven if there exist a $delta$ such that satisfies \ $[(delta<=1)and(delta<=epsilon/37)]$.
    
    By using the min trick, by taking $delta = min(1, epsilon/37)$, the existance of $delta$ that satisfies the condition for any $epsilon$ is proven.
    
    #qed
  ]
  #solution("", 5)[
    $ limx(4) 1/x = 1/4 $
    In order to prove this, we should show that
    $ forall epsilon > 0 thin [thin exists delta > 0 thin [thin (0<abs(x-4)<delta ==> abs(1/x - 1/4)<epsilon) thin] thin] $
    $ <==> forall epsilon > 0 thin [thin exists delta > 0 thin [thin (0<abs(x-4)<delta ==> abs((4-x)/(4x)) <epsilon) thin] thin] $
    $ <==> forall epsilon > 0 thin [thin exists delta > 0 thin [thin (0<abs(x-4)<delta ==> abs(x-4)/(4abs(x)) <epsilon) thin] thin] $
    is true.
    
    In order to bound the range of $1/(4abs(x))$, let's randomly assume that our chosen $delta$ for each $epsilon$ is less or equal than 1. \
    Then,
    $ 0 < abs(x-4) < delta <= 1 ==> -1 < x-4 < 1 ==> 3 < x < 5 $
    $ ==> abs(x) > 3 ==> 4abs(x) > 12 ==> 1/(4abs(x)) < 1/12 $
    
    $ abs(1/x - 1/4) = abs(x-4) dot 1/(4abs(x)) < 1/12 abs(x-4) $
    
    To obtain relationship between $epsilon$, let's take $delta$ as a value that satisfies $delta <= 12epsilon$ for any given $epsilon$.
    Then,
    $ ==> abs(1/x - 1/4) < 1/12 abs(x-4) < 1/12 delta <= 1/12 (12epsilon) = epsilon $
    
    So, the initial statement is proven if there exist a $delta$ such that satisfies \ $[(delta<=1)and(delta<=12epsilon)]$.
    
    By using the min trick, by taking $delta = min(1, 12epsilon)$, the existance of $delta$ that satisfies the condition for any $epsilon$ is proven.
    
    #qed
  ]
]

#example("Problem 2")[
  Justify the following by utilizing the $epsilon-delta$ definition of the limits.
  + $limx(1) x cb + x + 1 = 3$
  + While $f(x) = cases( #[$ (x cb - 1)/(x-1) & quad (x!=1) $] , #[$ 2 & quad (x=1) $] )$ $quad limx(1) f(x) = 3 $
  + $limx(0) (x^50+x^40+x+1)/(x^100+1)=1$
  + $limx(a) 1/x = 1/a$ while $a!=1$.
  + $limx(1) x/(4-3x)=1$
  + $limx(a) sq(x)=sq(a)$ while $a > 0$.
  + $limx(2) 1/(sq(x)+sq(2)) = 1/(2sq(2))$
  + $limx(3) (x sr + sq(x+1)) = 11$
    
  #solution("", 1)[
    $ limx(1) x cb + x + 1 = 3 $
    We need to find $delta > 0$ such that
    $ 0 < abs(x-1) < delta ==> abs(x cb + x + 1 - 3) < epsilon $

    Simplify the expression:
    $ abs(x cb + x - 2) = abs((x-1)(x^2 + x + 2)) = abs(x-1) abs(x^2 + x + 2) $

    Bound $abs(x^2 + x + 2)$ near $x=1$. Let's assume $delta <= 1$.
    Then \ $abs(x-1) < 1 ==> 0 < x < 2$.
    
    Using the *Triangle Inequality*, 
    
    $ abs(x^2 + x + 2) underbrace(<=, "TIQ") abs(x)^2 + abs(x) + 2 < 4 + 2 + 2 = 8 $

    So we have:
    $ abs(x cb + x + 1 - 3) = abs(x-1) abs(x^2 + x + 2) < 8 abs(x-1) $

    Choose $delta = min(1, epsilon/8)$.
    Then if $0 < abs(x-1) < delta$:
    $ abs(x cb + x + 1 - 3) < 8 delta <= 8(epsilon/8) = epsilon $

    #qed
  ]
  #solution("", 2)[
    $ limx(1) f(x) = 3 $
    Since $0 < abs(x-1)$, we consider $x != 1$, so $f(x) = (x cb - 1)/(x-1) = x^2 + x + 1$ in our context.
    We need to find $delta > 0$ such that
    $ 0 < abs(x-1) < delta ==> abs((x^2 + x + 1) - 3) < epsilon $

    Simplify the expression:
    $ abs(x^2 + x - 2) = abs((x-1)(x+2)) = abs(x-1) abs(x+2) $

    Bound $abs(x+2)$ near $x=1$. Let's assume $delta <= 1$.
    Then $abs(x-1) < 1 ==> 0 < x < 2$.
    $ abs(x+2) < 4 $.

    So we have:
    $ abs(f(x) - 3) = abs(x-1) abs(x+2) < 4 abs(x-1) $

    Choose $delta = min(1, epsilon/4)$.
    Then if $0 < abs(x-1) < delta$:
    $ abs(f(x) - 3) < 4 delta <= 4(epsilon/4) = epsilon $

    #qed
  ]
  #solution("", 3)[
    $ limx(0) (x^50+x^40+x+1)/(x^100+1)=1 $
    We need to find $delta > 0$ such that
    $ 0 < abs(x) < delta ==> abs((x^50+x^40+x+1)/(x^100+1) - 1) < epsilon $

    Simplify the expression:
    $ abs((x^50+x^40+x+1 - (x^100+1))/(x^100+1)) = abs((-x^100 + x^50 + x^40 + x)/(x^100+1)) $
    $ = abs(x) dot abs((-x^99 + x^49 + x^39 + 1)/(x^100+1)) $

    Since $x^100 >= 0$, $x^100 + 1 >= 1$, so $1/(x^100+1) <= 1$.
    Also, by triangle inequality:
    $ abs(-x^99 + x^49 + x^39 + 1) <= abs(x)^99 + abs(x)^49 + abs(x)^39 + 1 $

    Let's assume $delta <= 1$. Then $abs(x) < 1$.
    So $abs(x)^99 + abs(x)^49 + abs(x)^39 + 1 < 1 + 1 + 1 + 1 = 4$.

    Thus:
    $ abs(...) < abs(x) dot 4 $

    Choose $delta = min(1, epsilon/4)$.
    Then if $0 < abs(x) < delta$:
    $ abs((x^50+x^40+x+1)/(x^100+1) - 1) < 4 abs(x) < 4 delta <= epsilon $

    #qed
  ]
  #solution("", 4)[
    $ limx(a) 1/x = 1/a $
    We assume $a != 0$.
    We need to find $delta > 0$ such that
    $ 0 < abs(x-a) < delta ==> abs(1/x - 1/a) < epsilon $

    Simplify the expression:
    $ abs((a-x)/(a x)) = abs(x-a)/(abs(a)abs(x)) $
    #note([Bounding $delta$])[
      In this case, we can't simply restrict $delta$ to a constant value because it can't bound $1/x$ always.
      
      To show this, let's take $delta<j$. This infers $0<abs(x-a)<j$, which means on x-axis the range of possible $x$ and $a$ is smaller than $j$.
      
      #let a = 2.5
      #let j = 1
      #cartesian-canvas(
        size: (6,6),
        x-tick: 100,
        y-tick: 100,
        point(a,0, label:$a$, label-anchor: "south"),
        point(a - j,0, label:$a-j thick$, label-anchor: "south-east"),
        point(a + j,0, label:$ thick a+j$, label-anchor: "south-west"),
        line((a - j,1), (a - j,-1), style: (stroke: (dash: "dashed"))),
        line((a + j,1), (a + j,-1), style: (stroke: (dash: "dashed"))),
        func(x => 1 / calc.abs(x))
      )
      
      However, this constant bounding cause issue when $a<j$.
      
      #let a = 0.3
      #cartesian-canvas(
        size: (6,6),
        x-tick: 100,
        y-tick: 100,
        point(a,0, label:$a$, label-anchor: "south"),
        point(a - j,0, label:$a-j thick$, label-anchor: "south-east"),
        point(a + j,0, label:$ thick a+j$, label-anchor: "south-west"),
        line((a - j,1), (a - j,-1), style: (stroke: (dash: "dashed"))),
        line((a + j,1), (a + j,-1), style: (stroke: (dash: "dashed"))),
        func(x => 1 / calc.abs(x))
      )
      
      As you can see, in this case $1/x$ increases without bound in the range $(a-j,a+j)$.
      
      To avoid this, we choose a value relative to $a$ as a restriction for $delta$.
    ]

    Bound $1/abs(x)$. We want to keep $x$ away from 0.
    Let $delta <= abs(a)/2$. \
    This way, we can ensure that $1/abs(x)$ has a valid maximum.
    
    
    Then $abs(x-a) < abs(a)/2 ==> -abs(a)/2 < x-a < abs(a)/2$.
    $ ==> a - abs(a)/2 < x < a + abs(a)/2 $

    This implies $abs(x) > abs(a)/2$, so $1/abs(x) < 2/abs(a)$.

    So we have:
    $ abs(1/x - 1/a) = abs(x-a) dot 1/(abs(a)abs(x)) < abs(x-a) dot 1/abs(a) dot 2/abs(a) = (2/a^2) abs(x-a) $

    Choose $delta = min(abs(a)/2, (epsilon a^2)/2)$.
    Then if $0 < abs(x-a) < delta$:
    $ abs(1/x - 1/a) < (2/a^2) delta <= (2/a^2) ((epsilon a^2)/2) = epsilon $

    #qed
  ]
  #solution("", 5)[
    $ limx(1) x/(4-3x)=1 $
    To prove this, for every $epsilon$, we should find $delta$ such that
    $ (0<abs(x-1)<delta) ==> (abs(x/(4-3x) - 1)<epsilon) $
    Simplifying the expression,
    $ abs(x/(4-3x) - 1)=abs((x-(4-3x))/(4-3x))=abs((4x-4)/(4-3x))=abs(x-1)dot abs(4/(4x-3)) $
    To bound $abs(4/(4x-3))$, let's restrict $delta$. \
    #note("Bounding Function")[
      #grid(
        columns: (auto, auto),
        column-gutter: 5pt,
        {
          cartesian-canvas(
            size: (4,4),
            x-domain: (-1.5, 3.5),
            y-domain: (-2.5, 2.5),
            graph(x => calc.abs(x / (4 - 3 * x))),
            point(4/3, 0, label: $4/3$, label-anchor: "north-west"),
            line((4/3, 1), (4/3, -1), style: (stroke: (dash: "dashed")))
          )
        },
        align(horizon)[
          We are restricting $delta$ to bound $abs(4/(4-3x))$. Thus, we should find _appropriate_ restriction to not make _problems_ like ascending to infinity or undefined.
          
          Here, when the range of $x$ determined by the restriction of $delta$ contains $4/3$, we can't bound $abs(4/(4-3x))$.
        ]
      )
    ]
    As written on the note, we should keep $x$ away from $4/3$.
    Thus, restriction must be smaller than $4/3 - 1$.
    
    Let's take $delta <= 1/4$.
    $ 0<abs(x-1)<delta<=1/4 ==> 3/4<x<5/4 $
    $ ==> abs(4/(4-3x)) < 4 ==> abs(4/(4-3x))dot abs(x-1) = abs(x/(4-3x) - 1)< 4 dot abs(x-1) $
    Let's take $delta <= epsilon/4$
    $ ==> 0 <= abs(x/(4-3x) - 1) < 4 dot abs(x-1) < 4delta <= 4(epsilon/4) = epsilon $
    $delta = min(1/4, epsilon/4)$ satisfies the condition. \
    #qed
  ]
  #solution("", 6)[
    $ limx(a) sq(x) = sq(a) "while" a>0 $
    To prove this, for every $epsilon$, we should find $delta$ such that
    $ (0<abs(x-a)<delta) ==> (abs(sq(x)-sq(a)) < epsilon) $
    Simplifying the expression,
    $
      abs(sq(x) - sq(a))=abs(((sq(x)-sq(a))(sq(x)+sq(a)))/(sq(x)+sq(a)))
      = abs((x-a)/(sq(x)+sq(a)))
      = abs(x-a) dot abs(1/(sq(x)+sq(a)))
    $
    To bound $abs(1/(sq(x)+sq(a)))$, let's restrict $delta$.
    
    Simillar to _Problem 2-4_, we want to make sure that $x>0$.
    
    #grid(
      columns: (auto, auto, auto),
      column-gutter: 10pt,
      {
        cartesian-canvas(
          size: (4,4),
          x-domain: (-2.5, 5),
          y-domain: (-1.5, 2),
          x-tick: 10,
          y-tick: 10,
          graph(x => calc.abs(1 / (calc.sqrt(x) + calc.sqrt(1))), domain: (0, 5)),
          point(3, 0, label: $a$, label-anchor: "south"),
          line((1.5, 1), (1.5, -1), style: (stroke: (dash: "dashed"))),
          line((4.5, 1), (4.5, -1), style: (stroke: (dash: "dashed")))
        )
      },
      {
        cartesian-canvas(
          size: (4,4),
          x-domain: (-2.5, 5),
          y-domain: (-1.5, 2),
          x-tick: 10,
          y-tick: 10,
          graph(x => calc.abs(1/ (calc.sqrt(x) + calc.sqrt(1))), domain: (0, 5)),
          point(1, 0, label: $a$, label-anchor: "south"),
          line((0.5, 1), (0.5, -1), style: (stroke: (dash: "dashed"))),
          line((1.5, 1), (1.5, -1), style: (stroke: (dash: "dashed")))
        )
      },
      align(horizon)[
        Restricting $delta$ by $a/2$ looks fine here too.
        
        Also we have $a>0$, so absolute value isn't necessary. 
        \ 
        $ delta <= a/2 $
      ]
    )
    $ delta <= a/2 ==> 0 < abs(x-a) < delta <= a/2 ==> a/2 < x < 3/2a $
    $
      ==> x > 1/2a ==> abs(1/(sq(x)+sq(a))) < abs(1/(sq(a)dot (1+sq(1/2))))
      = abs((1-sq(1/2))/(sq(a) dot 1/2)) = abs((2-sq(2))/(sq(a)))
    $
    $ ==> abs(1/(sq(x)+sq(a))) < abs((2-sq(2))/sq(a)) ==> abs(1/(sq(x)+sq(a)))dot abs(x-a) = abs(sq(x)-sq(a))<abs((2-sq(2))/sq(a))dot abs(x-a) $
    Let's take $display(delta <= epsilon/(abs((2-sq(2))/sq(a))))$
    $ 0 <= abs(sq(x)-sq(a))<abs((2-sq(2))/sq(a))dot abs(x-a) < abs((2-sq(2))/sq(a))dot delta <= epsilon $
    $display(min(1/2, epsilon/(abs((2-sq(2))/sq(a)))))$ satisfies the condition. \
    #qed
  ]
  #solution("", 7)[
    $ limx(2) 1/(sq(x) + sq(2)) = 1/(2sq(2)) $
    To prove this, for every $epsilon$, we should find $delta$ such that
    $ (0<abs(x-2)<delta) ==> (abs(1/(sq(x) + sq(2))-1/(2sq(2)))<epsilon) $
    Simplifying the expression:
    $
      abs(1/(sq(x) + sq(2))-1/(2sq(2)))
      = abs((1-sq(2)/4(sq(x)+sq(2)))/(sq(x)+sq(2)))
      = abs((4-sq(2)(sq(x)+sq(2)))/(4 dot (sq(x)+sq(2)))) \
      = abs((2-sq(2x))/(4 dot (sq(x)+sq(2))))
      = abs(sq(2)/4dot (sq(x)-sq(2))/(sq(x) + sq(2)))
      = abs(sq(2)/4dot (x-2)/(x+2sq(2x)+2)) \
      = abs(sq(2)/(4x+8sq(2x)+8))dot abs(x-2)
    $
    #let gx = $display(abs(sq(2)/(4x+8sq(2x)+8)))$
    To set the bound of #gx, let's restrict $delta$.
    
    Assume $delta <= 1$.
    $ 0<abs(x-2)<delta<=1 ==> 1<x<3 ==> #gx <sq(2)/(12+8sq(2))=1/(8+6sq(2)) $
    $ ==> #gx dot abs(x-2) = abs(1/(sq(x)+sq(2))-1/(2sq(2))) < 1/(8+6sq(2))dot abs(x-2) $
    Let's take $delta <= (8+6sq(2))epsilon$
    $ 0<= abs(1/(sq(x)+sq(2))-1/(2sq(2))) <  1/(8+6sq(2))dot abs(x-2) < 1/(8+6sq(2))thin delta <= epsilon $
    $delta = min(1,(8+6sq(2))epsilon)$ satisfies the condition. \
    #qed
  ]
  #solution("", 8)[
    $ limx(3) (x sr + sq(x+1)) = 11 $
    To prove this, for all $epsilon$, we should find $delta$ such that:
    $ 0<abs(x-3)<delta ==> abs(x sr + sq(x+1) - 11) $
    Simplifying the expression:
    $
      abs(x sr + sq(x+1) - 11)
      = abs((x sr - 9) + (sq(x+1) - 2))
      = abs((x+3)(x-3)+(x-3)/(sq(x+1)+2)) \
      = abs(x+3+(1)/(sq(x+1)+2)) dot abs(x-3)
    $
    #let gx = $display(abs(x+3+1/(sq(x+1)+2)))$
    To set the bound of #gx, let's restrict $delta$. \
    Let's take $delta <= 1$.
    $ 0<abs(x-3)<delta<=1 ==> 2<x<4 $
    $ ==> #gx < abs(x+3)+abs(1/(sq(x+1)+2)) < abs(4+3)+abs(1/(sq(3)+2))=8-sq(3)/2<8 $
    $ ==>  abs(x+3+(1)/(sq(x)+2)) dot abs(x-3) = abs(x sr + sq(x+1) - 11)<8dot abs(x-3) $
    (just set 8 for convenience)\
    Let's take $delta<=epsilon/8$. 
    $ 0<=abs(x sr + sq(x+1) - 11)<8dot abs(x-3)<8delta<=epsilon $
    $delta=min(1,epsilon/8)$ satisfies the condition. \
    #qed
  ]
]

#note("Interesting Findings")[
  This strategy might not be practical for most cases but I found some potentially useful technique.
  
  Let's think of a general $epsilon-delta$ problem:
  $ limx(a) f(x) = L $
  Then we should prove:
  $ forall epsilon thin [thin exists delta thin [thin (0<abs(x-a)<delta)==>(abs(f(x)-L)<epsilon) thin] thin] $
  Let $g(x)$ be $abs(f(x)-L)$ \
  Then our first objective is to factor $g(x)$ to something like $abs(x-a)h(x)$. 
  
  Then, by restricting $delta$ if necessary, we will set the upper bound of $h(x)$.
  
  However, despite it is obvious that $g(x)$ is almost guaranteed to be dividable with $abs(x-a)$, (this is the point why I think this might be completely useless), it is sometimes hard to factor out from $g(x)$ directly.
  
  This case, we can define a new appropriate function $j(x)$ #st \ $g(x)<=j(x)abs(x-a)$.
  
  Then, you can do everything you are used to do with $h(x)$ with $j(x)$.
  #proof("Sketch of Proof")[
    Let's say that we found an upper bound for $j(x)<M$ for $delta<m and delta<epsilon/M$.
    $ ==> 0 <= g(x) <= j(x)abs(x-a) < M abs(x-a) < M delta <= epsilon $
    $ ==> (0<abs(x-a)<delta)and(g(x)<epsilon <==> abs(f(x)-L)<epsilon) $
    $ ==> (0<abs(x-a)<delta) ==> (abs(f(x)-L)<epsilon) $
    $delta=min(m, epsilon/M)$ satisfies the condition. \
    #qed
  ]
]

