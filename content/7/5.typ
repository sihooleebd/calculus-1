#import "../../templates/templater.typ": *

= Strategy for integration
There is no universal button for integration. The real skill is learning what the integrand is trying to become after one good rewrite.

#definition("A rough checklist")[
  1. Simplify the integrand first if possible (algebra, identities, splitting fractions)
  2. Look for a composition whose inner derivative is present : substitution
  3. Look for a product of unrelated species : integration by parts
  4. For trigonometric powers, use identities and the save-one-factor patterns
  5. For rational functions, try partial fractions (divide first if improper)
  6. For roots of quadratics, complete the square and use trigonometric substitution
  7. For roots of other things, try *rationalizing* : make the whole root the new variable
]

#note("The reader should ask one question")[
  What change makes this look *more familiar*? That is usually the right first move. And if the first attempt stalls, do not push. Return to the list and pick a different door.
]

#example("Choosing Simplification and Substitution Together")[
  Evaluate
  $ integral x^3 sqrt(x^2 + 1) d x $
  #solution("")[
    The square root suggests substitution, but first notice that
    $ x^3 d x = x^2 dot x d x $
    so if
    $ u = x^2 + 1 $
    then
    $ x^2 = u - 1 $
    and
    $ d u = 2x d x $

    Thus
    $ integral x^3 sqrt(x^2 + 1) d x = 1/2 integral (u-1)u^(1/2) d u $
    $ = 1/2 integral (u^(3/2) - u^(1/2)) d u $
    $ = 1/2 lr([ 2/5 u^(5/2) - 2/3 u^(3/2) ]) + C $
    $ = 1/5 u^(5/2) - 1/3 u^(3/2) + C $

    Substitute back :
    $ integral x^3 sqrt(x^2 + 1) d x = 1/5 (x^2 + 1)^(5/2) - 1/3 (x^2 + 1)^(3/2) + C $
  ]
]

#example("An Identity Opens the Door")[
  Evaluate
  $ integral tan^3(x) d x $
  #solution("")[
    Rule 1 : simplify with an identity before reaching for machinery.
    $ tan^3(x) = tan(x)(sec^2(x) - 1) = tan(x)sec^2(x) - tan(x) $

    The first piece is $u = tan(x)$ on sight ; the second is a known integral :
    $ integral tan^3(x) d x = (tan^2(x))/2 - ln|sec(x)| + C $
  ]
]

#example("Rationalizing a Stubborn Root")[
  Evaluate
  $ integral 1/(x sqrt(x+1)) d x $
  #solution("")[
    The root is glued to the variable, so make the *whole root* the new variable :
    $ u = sqrt(x+1) $
    Then
    $ x = u^2 - 1 $
    and
    $ d x = 2u d u $

    Therefore
    $ integral 1/(x sqrt(x+1)) d x = integral (2u)/( (u^2-1) u) d u = 2 integral 1/(u^2-1) d u $

    A tiny partial fraction finishes it :
    $ 2 integral 1/(u^2-1) d u = integral lr([ 1/(u-1) - 1/(u+1) ]) d u = ln lr(|(u-1)/(u+1)|) + C $

    Substituting back :
    $ integral 1/(x sqrt(x+1)) d x = ln lr(|(sqrt(x+1)-1)/(sqrt(x+1)+1)|) + C $

    One integral, three doors from the checklist : rationalize, then substitute, then partial fractions. Chains like this are the norm, not the exception.
  ]
]
