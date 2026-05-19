#import "../../templates/templater.typ": *

Sometimes rate of the variable is related to other variable's rate.

#example()[
  Car A is traveling west at 50 mi/h and car B is traveling north at 60 mi/h.
  Both are headed for the intersection of the two roads. At what rate are the cars approach-
  ing each other when car A is 0.3 mi and car B is 0.4 mi from the intersection?
  #solution()[
    At given time t, let x be the distance from car A to intersection, let y be the distance from car B to intersection. Then, by the Pythagorean theorem, distance d is
    $ d sr = x sr + y sr $
    Implicit diffferentiation both side
    $ 2z (dif z)/dt = 2x dx/dt + 2y dy/dt $
    At $x=0.3, space y = 0.4$, then $z=0.5$ and
    $ (dif z)/dt = 1/0.5 [0.3(-50) + 0.4(-60)] = -78 $
    The cars are approaching each other at a rate of $-78$ mi/h
  ]
]

#example()[

]
