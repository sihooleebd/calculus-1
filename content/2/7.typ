#import "../../templates/templater.typ": *

= Rate of Change in Science

== Physics
- We already briefly discussed this before.
- $s' = v, v' = a$
- Average rate of change : $(Delta y)/(Delta x)$
- Instantaneous rate of change : $lim_(Delta x->0) (Delta y)/(Delta x)$
- Average linear density : $(Delta m)/(Delta x)$
- Linear Density : $rho = lim_(Delta x->0) (Delta m)/(Delta x)$
- Average current = $(Delta Q)/(Delta t)$
- Instantaneous current = $I = lim_(Delta t->0) (Delta Q)/(Delta t$
== Chemistry
- Say we have the following reaction :
$ A + B arrow.long C $
- Average rate of reaction : $(Delta [C])/(Delta t)$
- Instantaneous rate of reaction : $r = lim_(Delta t->0) (Delta [C])/(Delta t)$
- Or, if we write in terms of reactants, $r = -(d [B])/(Delta t) = -(d [A])/(Delta t)$
- Compressibility : $-beta = -1/V (Delta V)/(Delta P)$

== Biology
- Average rate of growth : $(Delta N)/(Delta t)$
- Instantaneous rate of growth : $lim_(Delta t->0) (Delta N)/(Delta t) = (d n)/(d t)$
#note("population growth")[
  Since populations grow in integers, it cannot be smooth. However, using the function above, we can approximate like such :
  #align(center)[
    #image("../images/Screenshot 2025-12-30 at 01.14.30.png", width: 60%)
  ]
]
- Inside blood vessels, the flow of blood is described by the law of laminar flow. The law states that :
$ v = P/(4 eta l)(R^2 - r^2) $
Thus, finding $(Delta v)/(Delta r)$ gives us the velocity gradient of blood flow. Using limits, we get :
$ (d v)/(d r) = P/(4 eta l) dot 2r = Pr/(2 eta l) $

= Economics
- Marginal cost is the change of cost relative to the number of items produced.
- thus, $ C_m = lim_(Delta x->0) (Delta C)/(Delta x) = (d C)/(d x) $

