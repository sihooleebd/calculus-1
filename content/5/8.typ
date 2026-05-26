#import "../../templates/templater.typ": *

= Indeterminate Forms

Suppose we have a limit of the from

$ limx(a) (f(x))/(g(x)) $

where $f(x) -> 0$ and $g(x) -> 0$ as $x->a$. This limit may not exist, and it is called an *indeterminate form of type $0/0$*.

For rational functions, we can sometimes cancel common factors. For example,
$ limx(1) (x sr - x)/(x sr - 1) = limx(1)  $

We have also used a geometric argument to show that

$ limx(0) (sin x)/x = 1 $.

However, these simple methods do not work for every $0/0$ form.

For rational functions, we can often divide the numerator and denominator by the highest power of $x$ in the denominator. For example,
$ limx(oo) (x sr - 1)/(2 x sr + 1) = limx(oo) (1-1/(x sr))/(2+1/(x sr)) = 1/2 $.

= L'Hospital's Rule

#theorem("L'Hospital's Rule")[
  Suppose $f$ and $g$ are differentiable and $g'(x) != 0$ on an open interval $I$ that contains $a$, except possibly at $a$. Suppose that
  $ limx(a) f(x) = 0 wide "and" wide limx(a) g(x) = 0 $
  or that
  $ limx(a) f(x) = plus.minus oo wide "and" wide limx(a) g(x) = plus.minus oo $
  In other words, we have an indterminate form of type $0/0$ or $oo/oo$. Then
  $ limx(a) (f(x))/(g(x)) = limx(a) ((f(x))'))/((g(x))') $
  if the limit on the right side exists (or it is $-oo$ or $oo$).
]
#note[
  L'Hospital's Rule is also valid for one-sided limits and for limits at infinity.

  In the special case where $f(a) = g(a) = 9$, $f'$ and $g'$ are continuous, and $g'(a) != 0$, L'Hospital's Rule is easy to justify.
]

#example()[
  Find the limit
  #set enum(numbering: "(a)")
  + $display(limx(1) (ln x)/(x-1))$
  + $display(limx(oo) (e^x)/(x sr))$
  + $display(limx(0) (tan x - x)/(x cb))$
  #solution[
    Since $ln x -> 0$ and $x-1 ->0$ as $x->1$, the limit has the indeterminate from of $0/0$. By L'Hospital's Rule,
    $ limx(1) (ln x )/(x-1) = limx(1) (1\/x)/1 = 1 $
  ]
  #solution[
    Since both are approaching $oo$,
    $ limx(oo) (e^x)/(x sr) = limx(oo) (e^x)/(2x) = limx(oo) (e^x)/(2) = oo $
    #note[
      This means exponential growth is much faster than square growth. It can be proven easily versus any polynomial as well.
    ]
  ]
]

= Indeterminate Products

#definition[
  Suppose $f(x) ->0 $ and $g(x) -> oo$ (or $-oo$) as $x->a$. Then the limit
  $ limx(a) f(x)g(x) $
  is called an *intdterminate form of type $0 dot oo$*.
]

This form represents a competition between a quantity decreasing and increasing boundlessly. The value represents the comparison of each increasing/decreasing speed.

To evaluate such a limit, we use the L'Hospital's Rule again. We can select either factors, and use its reciprocal to express it as a fraction.

= Indeterminate Differences
#definition[
  Suppose
  $ limx(a) f(x) = oo wide "and" wide limx(a) g(x) = oo $
  Then the limit

  $ limx(a) [f(x) - g(x)] $
  Is called an *indeterminate form of type $oo - oo$*.
]

There is no formulated methodology to compute this type of indeterminate. However, we can try to find common denominator or seperation to utilize L'Hospital's Rules.

#example[
  Find the limit.
  $ limx((pi\/2)^-) (sec x - tan x) wide limx(oo) (e^x - x) $
  #solution[
    $ sec x - tan x = 1/(cos x) - (sin x)/(cos x) = (1-sin x)/(cos x) $
    Now use L'Hospital.
  ]
  #solution[
    $ e^x - x = x(e^x/x - 1) $
    $ limx(oo) (e^x)/x = limx(oo) (e^x)/1 = oo $
  ]
]

= Indeterminate Powers
Several indeterminate forms arise from limits of the from
$ limx(a) [f(x)]^(g(x)), $
where $f(x)>0$

These cases can be handled by taking logarithms. Let $y = [f(x)]^(g(x))$, Then $ln y = g(x) ln (abs(f(x)))$.

#example()[

]
