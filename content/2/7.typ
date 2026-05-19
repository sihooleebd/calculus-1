#import "../../templates/templater.typ": *

The methods we have learned in this chapter for finding extreme values have practical
applications in many areas of life: A businessperson wants to minimize costs and maximize
profits. A traveler wants to minimize transportation time. Fermat’s Principle in optics states
that light follows the path that takes the least time. In this section we solve such problems
as maximizing areas, volumes, and profits and minimizing distances, times, and costs.
In solving such practical problems the greatest challenge is often to convert the word
problem into a mathematical optimization problem by setting up the function that is to
be maximized or minimized. Let’s recall the problem-solving principles discussed in the
Principles of Problem Solving following Chapter 1 and adapt them to this situation:

#example()[
  A cylindrical can is to be made to hold 1 L of oil. Find the dimensions
that will minimize the cost of the metal to manufacture the can.
  #solution()[
    We minimize the total surface area of th cylinder.
    $ A = 2 pi r sr + 2 pi r h wide pi r sr h = 1000 $
    $ h = 1000/(pi r sr) $
    $ A = 2 pi r sr + 2000/r, wide r>0 $
    We should find the minimum value of A.
    $ A'(r) = 4 pi r -2000/(r sr) $
    Setting $A'(r)=0$ gives
    $ 4 pi r = 2000/(r sr) ==> r cb = 500/pi $
    The only critical point is $r= root(3, 500/pi)$
    Checking the signs, we can prove that it is the minimum value.

  ]
]

#definition()[
  + The *cost function* $C(x)$ is the cost of producing $x$ units.
  + The *marginal cost* $C'(x)$ is the rate of change of cost with respect to $x$.
  + The *demand function* (or *price function*) $p(x)$ is the price per unit when $x$ units are sold. (많이 팔면 더 싸짐)
  + The *revenue function* is defined by $F(x) x p(x)$
  + TODO: Fill using the ppt...
]

#example()[
  A store has been selling 200 TV monitors a week at #sym.dollar 350 each. A market
  survey indicates that for each #sym.dollar 10 rebate offered to buyers, the number of monitors sold
  will increase by 20 a week. Find the demand function and the revenue function. How
  large a rebate should the store offer to maximize revenue?
  #solution()[
    Let x be the number of monitors sold per week, and let $p(x)$ denote the demand function.
    $ p(x) = 350 - 1/2 (x - 200) = -1/2 x + 450, wide x >= 450 $
    The revenue function si
    $ R(x) = x p(x) = x(-1/2x+450) $
    Thus $x=450$ maximizes the revenue. Caluculating the rebate:
    $ 1/2(450-200)-125 (dollar) $
  ]
]
