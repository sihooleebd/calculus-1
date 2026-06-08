#import "../../templates/templater.typ": *

#theorem("Guidlines for Integration")[
  When evaluating an integral, first try the simplest ideas.
  #set enum(numbering: "Step 1.")
  + Simplify the integrand if possible. \ Use algebraic manipulation or trigonometric identities that makes integral more obvious.
  + Look for an obvious substitution.
  + Classify the integrand according to its form.
]

#theorem("Teacher's strategy")[
  #set enum(numbering: "Step 1.")
  + Check wether the integral is already familiar. \ standard froms, rational functions, and formulas from integration table. \ If the integral belongs to one, use that method directly.
  + Try substitution or integration by parts. \
  + If neither works, try to rewrite the integrand. \ Use algebraic manipulation, trig identities, perfect squares. Then, return to Step 1.
]

#example()[
  + $display(int (sin x cos x)/(sin^4 x + cos^4 x) dx) \ wide$
  + $display(int ln(x + 1)/(x sr) dx)$

  #solution()[
    Let $u = sin sr x$. Then $du = 2 sin x cos x dx$, and $cos sr x = 1 - u$. Thus
    $
      int (sin x cos x)/(sin^4 + cos^4 x) dx &= int 1/2 du/(u sr + (1 - u) sr) \
      &=
    $
  ]
]

Our strategies for integration do not allow us to find elementary formulas for all continuous functions.

#definition("Elementary Functions")[
  The functions we usually use in Calculus are called *elementary functions*. They include polynomials, rationals, power functions, exponential functions, logarithmic functions, trigs, inverse trigs, hyperbolic, inverse hyperbolics and the result of their basic algebraic operations are called an *elementary functions*
]

If f is an elementary functions, then $f'$ is also an elementary function. Howver, an antiderivative of $f$ need not be an emetary function.

#example[
  For example, $f(x) = e^(x sr)$ is elementary and continuous on $RR$. Hence
$ F(x) = int^x_0 e^( x sr ) dx $
is an antiderivative of $f$ by FTC1. However, it is not known that $F$ is not possible to express in terms of elementary functions.

]

The same phenomenon occurs for many other elementary functions, such as

$ int e^x / x dx wide "and" wide int 1/ln(x) dx wide $

#note[
  We know that $F(x) = int^x_0 e^e^t dt $
]
