
#import "../../templates/templater.typ": *

= The Tangent Problem
- What does tangent mean in calculus?
#definition("Tangency")[
  A tangent line to a curve at a given point is a straight line that just "touches" the curve at that point. In calculus, the tangent line represents the instantaneous rate of change of the function at that point, which is given by the derivative of the function.
]

#example("Tangency Basics")[
  Say we have the function $f(x) = x^2$. Let us deifne the base point of our tangent slope calculation as $x=1$. Here, our slope calculation equation would become :
  $ m_"pq" = (p_x^2 - q_x^2)/(p_x - q_x) $ where $q_x = 1$. If we plot in values from $p_x = 2$ to $p_x approx 1$, we get the following table:
  #table-plot(
    headers: ("p_x", "m_pq"),
    data: (
      (2, 3),
      (1.5, 2.5),
      (1.1, 2.1),
      (1.01, 2.01),
      (1.001, 2.001),
    ),
  )
  As we can see from the table, as $p_x$ approaches $1$, the slope $m_"pq"$ approaches $2$. Therefore, the slope of the tangent line to the curve at the point where $x=1$ is $2$.
  Thus, after a bit of calculation, we can find that the equation of the tangent line at the point $(1, f(1)) = (1, 1)$ is:
  $ y - 1 = 2(x - 1) $ or simplified, $ y = 2x - 1 $.
]
#note("Approach from L/R")[
  Note from the example above that there are two directions a line can approach a curve: from the left side (as $p_x$ approaches $1$ from values less than $1$) and from the right side (as $p_x$ approaches $1$ from values greater than $1$).
  - Normally, this doesnt pose that much of a problem, but if the function is *severed* at a point, the left-hand limit and right-hand limit may not be equal, leading to different tangent slopes from each side.

]

= The Velocity Problem
- Take a car. How do we define its *speed*?
- We know from middle school knowledge that speed is defined by the following equation : $ v = "total distance travelled"/"total time spent" $
- Note here that this is the *exact same form* as the slope equation we used in the tangent problem!

#definition("Average Velocity")[
  Average velocity over a time interval is defined as the total displacement divided by the total time taken. Mathematically, if a car moves from position $s(a)$ at time $a$ to position $s(b)$ at time $b$, the average velocity $v_"avg"$ over the interval $[a, b]$ is given by:
  $ v_"avg" = (s(b) - s(a)) / (b - a) $
]

#definition("Instantaneous Velocity")[
  A bit off course, but we can define instantaneous velocity using the later-defined idea of the limit.
  
  Instantaneous velocity at a specific time is the limit of the average velocity as the time interval approaches zero. It represents the velocity of the car at a precise moment in time. Mathematically, the instantaneous velocity $v(t)$ at time $t$ is given by:
  $ v(t) = lim_"Δt"→0 (s(t + "Δt") - s(t)) / "Δt" $
]
