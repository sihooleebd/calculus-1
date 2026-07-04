#import "../../templates/templater.typ": *

= Strategy for integration
There is no universal button for integration. The real skill is learning what the integrand is trying to become after one good rewrite.

#definition("A rough checklist")[
  1. Simplify the integrand first if possible
  2. Look for a composition that suggests substitution
  3. Look for a product that suggests integration by parts
  4. For trigonometric powers, use identities
  5. For rational functions, try partial fractions
]

#note("The reader should ask one question")[
  What change makes this look *more familiar*? That is usually the right first move.
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
