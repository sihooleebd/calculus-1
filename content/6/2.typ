#import "../../templates/templater.typ": *

= Strategy of Evaluating $display(int sin^m x cos^n x dx) $


#theorem("Case 1")[
  If $n=2k+1$, save one cosine factor and use Pythagorian identity to express the remaining factors in terms of sine:
  $
    int sin^m x cos^(2k + 1) x dx &= int sin^m x (cos^2 x)^k cos x dx \
    &= int sin^m x (1- sin^2 x)^k cos x dx
  $
  Then substitute $u=sin x$.
]

#theorem("Case 2")[
  If $m = 2k + 1$, save one sine factor and use Pythagorian identity to express the remaining factors in terms of cosine:
  $
    int sin^(2k+1) x cos^n x dx &= int (sin^2 x)^k cos^n x sin x dx \
    &= int(1-cos sr x)^k cos^n x sin x dx
  $
  Then substitute $u=cos x$.
]

#theorem("Case 3")[
  If the powers of both sine and cosine are even, use the half angle identities to reduce powers:
  $ sin sr x = 1/2 (1-cos 2x) wide cos sr x = 1/2 (1 + cos 2x) $
  It is sometimes helpful to use the identity:
  $ sin x cos x = 1/2 sin 2x $
]

#pagebreak()

= Strategy for Evaluating $display(int tan^m x sec^n x dx)$

#theorem("Case 1")[
  If $n = 2k$ and $k >= 2$, save a factor of $sec sr x$ and use $ sec sr x = 1 + tan sr x$ to express the remaining factors in terms of $tan x$:
  $
    int tan^m sec^(2k) dx &= int tan^m x (sec sr x)^(k-1) sec sr x dx \
    &= int tan^m x (1 + tan sr x)^(k-1) dx
  $
  Then substitute $u=tan x$.
]

#theorem("Case 1")[
  If $m = 2k + 1$, save a factor of $sec x tan x$ and use $tan sr x = sec sr x - 1$ to express the remaining factors in terms of $sec x$:
  $
    int tan^(2k + 1) sec^n dx &= int (tan sr x)^k sec^( n - 1 ) x sec x tan x dx \
    &= int (sec sr x - 1)^k sec^(n-1) x sec x tan x dx
  $
  Then substitute $u=sec x$.
]

For other cases, the guidlines are not generalized. You may have to utilize identities, integration by parts, and occasionally a little ingenuity.

= Strategy for Evaluating $display(int sin m x cos n x dx)$
we use the product-to-sum identities:

= Practical Strategy for Trigonometric Integrals

When evaluating a trigonometric integral, first look for a natural substitution.

#set enum(numbering: "Step 1.")

+ Try choosing one function as the new variable, such as $u= sin x$, $u= cos x$. After the substitution, check wether all remaining factors can be written in terms of $u$, and wether integral can be evaluated
+ If no substitution works directly, try to utilize some known identities to transform the equation, eventually to substitution to work.
