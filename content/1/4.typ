#import "../../templates/templater.typ": *

= The Tangent Problem
- The word _tangent_ is derived from the Latin _tangens_ which means "touching".
- What does tangent mean in calculus?


#definition("Tangency")[
  A *tangent line* to a curve at a given point is a straight line that just _"touches"_ the curve at that point. In calculus, the tangent line represents the instantaneous rate of change of the function at that point, which is given by the derivative of the function.
]

How can we precisely define this concept?

#let thet = 30deg
#let leng = 1

#example("Circle vs Function")[
  #blank-canvas(
    size: (4,4),
    circle((0,0), 1),
    segment((calc.cos(thet) + calc.tan(90deg - thet) * leng, calc.sin(thet) + calc.tan(thet - 90deg) * leng), (calc.cos(thet) - calc.tan(90deg - thet) * leng, calc.sin(thet) - calc.tan(thet - 90deg) * leng)),
    point(calc.sin(thet), calc.cos(thet), label: $P$, label-padding: 0.12, label-anchor: "north-east")
  )
  On circles, the tangent line can be easily defined following _Euclid_. The tangent line here at point $P$ is a line that only meets the circle *once* on $P$.
  
  However, this convenient definition cannot be generalized to all functions.
  
  #let lag-f =  lagrangian-interpolation((-4,1),(-3,-1), (-1, 3), (1, -1), (3, -2))
  #let tan-line = tangent(lag-f.f, -1, length: 8)
  #cartesian-canvas(
    size: (6,4),
    x-tick: 2,
    y-tick: 2,
    lag-f,
    tan-line,
    point(-1, (lag-f.f)(-1), label: $P$, label-anchor: "north-east", label-padding: 0.5),
    intersect-function-line(lag-f.f, tan-line, x0: -4, label: $Q$, label-anchor: "north-east", label-padding: 0.5)
  )
  
  As you can see, The tangent line on P also meets with the function at $Q$ too. We cannot simply use Euclidean definition here. How should we define this?
]

To be specific, let's look at the problem of trying to find a tangent line $l$ to the parabola $y-x sr$ in the following example.

#example("Tangency Basics")[
  Say we have the function $f(x) = x^2$. Let us deifne the base point of our tangent slope calculation as $x=1$. Here, our slope calculation equation would become :
  $ m_"pq" = (p_x^2 - q_x^2)/(p_x - q_x) $ where $q_x = 1$. If we plot in values from $p_x = 2$ to $p_x approx 1$, we get the following table:
  #let val1 = (2,1.5,1.1,1.01,1.001)
  #let val2 = (0.999, 0.99, 0.9, 0.5, 0)
  #value-table(
    variable: $P_x$,
    func: $m_(P Q)$,
    horizontal: true,
    values: val1,
    results: val1.map(x => calc.round((x*x - 1)/(x - 1), digits: 5))
  )
  #value-table(
    variable: $P_x$,
    func: $m_(P Q)$,
    horizontal: true,
    values: val2,
    results: val2.map(x => calc.round((x*x - 1)/(x - 1), digits: 5))
  )

  As we can see from the table, as $p_x$ approaches $1$, the slope $m_"pq"$ approaches $2$. Therefore, the slope of the tangent line to the curve at the point where $x=1$ is $2$.
  Thus, after a bit of calculation, we can find that the equation of the tangent line at the point $(1, f(1)) = (1, 1)$ is:
  $ y - 1 = 2(x - 1) $ or simplified, $ y = 2x - 1 $
  If we visualize this,
  #let asdf(k, an: "west") = {
    let p = point(1,1,label:$P$, label-anchor: "north-east")
    let q = point(k, k*k, label:$Q$, label-anchor: an)
    cartesian-canvas(
        size:(4,3),
        x-domain: (-2.1,2.1),
        y-domain: (-1, 4.3),
        graph(x => x*x),
        p,
        q,
        line(p,q),
        tangent(x => x*x, 1, style: (stroke: active-theme.plot.highlight))
      )
  }
    #grid(
    columns: (1fr,1fr,1fr),
    rows: (auto, auto),
    asdf(2),asdf(1.5), asdf(1.2),
    asdf(0, an: "north-east"), asdf(0.5, an: "north-east"), asdf(0.8)
  )
  #definition()[
    We say that the slope of the tangent line is the limit of the slopes of the secant lines, and we express this symbolically by writing
    $ lim_(Q->P) m_(P Q) = m "   and   " limx(1) (x sr - 1)/(x-1) = 2 $
    Knowing that the slope of the tangent line is 2 and that it passes the point $P(1,1sr)$, we can use the point-slope form of the equation of a line $ y-y_1=m(x-x_1) $ to express the tangent line through $P$ as 
    $ y-1=2(x-1) "   or   " y=2x -1 $
  ]
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
  $ v(t) = lim_(Delta t→0) (s(t + Delta t) - s(t)) / Delta t $
]

= Exercises

#example("Water tank")[
  A tank holds 1000 gallons of water, which drains from the bottom of the tank in half an hour. The values in the table show the volume $V$ of water remaining in the tank (in gallons) after $t$ minutes.
  #let datas = (
      (5,694),
      (10,444),
      (15,250),
      (20,111),
      (25,28),
      (30,0)
    )
  #table-plot(
    horizontal: true,
    headers: ([$t$(min)], [$V$(gal)]),
    data: datas
  )
  + If $P$ is the point $(15,250)$ on the graph of $V$, find the slopes of the secant line $P Q$ when $Q$ is the point on the graph with $t=5, 10, 20, 35, 30$.
  + Estimate the slope of the tangent line at $P$ by averaging the slopes of two secant lines.
  + Use a graph of $V$ to estimate the slope of the tangent line at P.

  #solution()[
    Without loss of generality, let $Q$ be $(t,V)$. \
    Then, The slopes of $P Q$ is $ (V - 250)/(t - 15) $
    If we calculate this for each Q,
    
    #let dada = datas
    #let _ = dada.remove(2)
    #value-table(
      horizontal: true,
      func: $ (V - 250)/(t - 15) $,
      variable: $ Q(t,V) $,
      values: dada.map(x => [(#x.at(0), #x.at(1))]),
      results: dada.map(x => align(center + horizon)[#calc.round((x.at(1) - 250)/(x.at(0) - 15), digits: 3)])
    )
  ]
  #solution()[
    To estimate the slope of tangent line at $P$, we can evaluate the secant line between $P$ and its adjacent value: $(10,444)$ and $(20,111)$.
    
    From _Solution 1_, we know that the slope is each -38.8 and -27.8
    
    Average of two value gives us -33.3
    $ therefore -33.3 $
  ]
  #solution()[
    #cartesian-canvas(
      x-domain: (0,30),
      y-domain: (0,700),
      x-tick: 5,
      y-tick: 50,
      data-series(datas, plot-type: "both")
    )
    Um.... I don't know try it yourself. Probably around -30 lol
  ]
]

#example("Dock of a bridge")[
  The dock of a bridge is suspended 275 feet above a river. If a peblle falls off the bridge, the height, in feet, of the pebble above the water surface after $t$ seconds is given by $y=275-16t sr$.
  + Find the average velocity of the pebble for the time period beginning when $t=4$ and lasting
    + 0.1 seconds
    + 0.05 seconds
    + 0.01 seconds
  + Sketch the curve, two of the secant lines, and the tangent line.
  #solution()[
    Average velocity is defined by $ "(Distance Moved)"/"(Time elasped)" $
    Since the distance moved is the change of location, we can use the given equation of pebble height to calculate this.
    
    Let $Delta t$ be the time elasped. Then the average velocity is:
    $ overline(v) = ((275-16dot (4+Delta t) sr)-(275-16dot 4 sr))/(Delta t) $
    $ = (16{4 sr - (4+Delta t)sr})/(Delta t) = -(16(Delta t sr + 8 Delta t))/(Delta t) = 16Delta t + 128 $
    If we apply each elasped time given on the problem, we get
    #let vla = (0.1, 0.05, 0.01)
    #value-table(
      horizontal: true,
      variable: $Delta t$,
      func: $overline(v)$,
      values: vla,
      results: vla.map(x => calc.round(16 * x + 128, digits: 6))
    )
  ]
  #let fff = graph(x => 275 - 16 * x*x, domain:(0,5))
  #solution()[
    The entire $y=275-16t sr$ graph looks like:
    #let P = (4,(fff.f)(4))
    #let Q(k) = (4 + k, (fff.f)(4 + k))
    #cartesian-canvas(
      size: (6,6),
      x-domain: (-0.5, 5),
      y-domain: (0,275),
      y-tick: 25,
      fff,
    )
    The specific part we've been investigating is
    #cartesian-canvas(
      x-domain: (3.95,4.2),
      y-domain: (0,30),
      x-tick: 0.025,
      y-tick: 2.5,
      graph(fff.f, domain: (3.8,4.2)),
      point(..P, label: $P$, label-anchor: "north", label-padding: 1),
      point(..Q(0.01), label: $Q_1$, label-anchor: "south", label-padding: 1),
      point(..Q(0.05), label: $Q_2$, label-anchor: "north", label-padding: 1),
      point(..Q(0.1), label: $Q_3$, label-anchor: "north", label-padding: 1),
    )
  ]
  The lines are indistinguishable.....
]

#example("Motorcycle")[
  The table shows the position of a motorcyclist after accelerating from rest.
  #let dat = (
      (0,0),
      (1,4.9),
      (2,20.6),
      (3,46.5),
      (4,79.2),
      (5,124.8),
      (6,176.7)
    )
  #table-plot(
    horizontal: true,
    headers: ($t ("seconds")$, $s ("feet")$),
    data: dat
  )
  + Find the average velocity for each time period:
  #grid(
    columns: (1fr, 1fr, 1fr, 1fr),
    [
      (a) $[2,4]$
    ],
    [
      (b) $[3,4]$
    ],   
    [
      (c) $[4,5]$
    ],
    [
      (d) $[4,6]$
    ],
  
  )
  2. Use the graph of $s$ as a function of $t$ to estimate the instantaneous velocity when $t=3$.
  \
  #solution()[
    The average velocity is defined by $ ("Distance moved")/("Time elapsed") $
    Thus, average velocity can be obtained by dividing the difference of corresponding position value by the difference of each end of the interval.
    
    Calculating like above gives us
    #let ints = ((2,4), (3,4), (4,5), (4,6))
    #value-table(
      horizontal: true,
      variable: "Interval",
      func: "Avg. Velocity",
      values: ints.map(x => [[#x.at(0), #x.at(1)]]),
      results: ints.map(x => calc.round((dat.at(x.at(0)).at(1) - dat.at(x.at(1)).at(1))/(x.at(0) - x.at(1)), digits: 5))
    )
  ]
  #solution()[
    #let est-slope = ((dat.at(3).at(1) - dat.at(2).at(1))+(dat.at(4).at(1) - dat.at(3).at(1)))/2
    #cartesian-canvas(
      x-domain: (-0.5,6.5),
      y-domain: (-5, 180),
      axis-label: ($t$, $s$),
      y-tick: 20,
      data-series(dat, plot-type: "both"),
      line-point-slope(dat.at(3), est-slope)
    )
    About #calc.round(est-slope, digits: 5). This value is obtained by calculating the average of slope between 2 and 3, 3 and 4.
  ]
]
