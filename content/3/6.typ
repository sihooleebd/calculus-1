#import "../../templates/templater.typ": *

= Graphing with calculus and technology
A graphing device draws thousands of points faster than we ever could, and then happily shows us the *wrong picture*. The screen only displays the window we ask for. Calculus is how we know what to ask for.

#note("The viewing window problem")[
  Every plot lives inside a rectangle $[x_"min", x_"max"] times [y_"min", y_"max"]$.
  Choose it too small and the interesting features fall outside the frame.
  Choose it too large and they flatten into invisibility.
  The derivative tells us *where* the features are, so the window can be built around them.
]

#example("A Cubic that Hides its Personality")[
  Graph the function
  $ f(x) = x^3 - 100x $
  and choose a viewing window that shows all of its important features.
  #solution("")[
    A naive first attempt : plot it on $-3 <= x <= 3$, the sort of default window every calculator loves.

    #canvas.cartesian-canvas(
      size: (8, 4),
      x-domain: (-3.2, 3.2),
      y-domain: (-320, 320),
      y-tick: 100,
      graph.graph(x => x * x * x - 100 * x, domain: (-3, 3), label: $f(x)$),
    )

    The graph looks like a boring straight-ish line sloping downhill. No hint of a cubic at all, and nothing on the screen warns us that we are being deceived.

    Now consult calculus instead of the screen :
    $ f'(x) = 3x^2 - 100 = 0 quad ==> quad x = plus.minus 10/sqrt(3) approx plus.minus 5.77 $
    Both critical points lie *outside* the window we chose. Their values are
    $ f(plus.minus 10/sqrt(3)) = minus.plus 2000/(3sqrt(3)) approx minus.plus 385 $
    So the honest window must reach past $x = plus.minus 5.77$ horizontally and past $y = plus.minus 385$ vertically :

    #canvas.cartesian-canvas(
      size: (8, 5),
      x-domain: (-12, 12),
      y-domain: (-500, 500),
      x-tick: 3,
      y-tick: 125,
      graph.graph(x => x * x * x - 100 * x, domain: (-11.2, 11.2), label: $f(x) = x^3 - 100x$),
      graph.point(5.7735, -384.9, label: ""),
      graph.point(-5.7735, 384.9, label: ""),
    )

    Same function, same machine, but this frame was designed by the derivative, and now the two extrema, the inflection at the origin, and the three roots ($x = 0, plus.minus 10$) are all on display.
  ]
]

#note("The division of labor")[
  Technology is superb at *drawing* and terrible at *knowing*. Calculus is the reverse. The workflow that actually functions :
  1. Differentiate to locate critical points, inflection points, and asymptotes.
  2. Build a window that contains them.
  3. Let the machine draw.
  4. If the picture contradicts the calculus, distrust the picture first : resolution, rounding, and sampling all lie.
]

#example("When the Screen Cannot Win")[
  What goes wrong if we ask a machine to graph
  $ f(x) = sin(100 x) $
  on the interval $[0, 2pi]$?
  #solution("")[
    The function completes $100$ full oscillations across the window. A screen a few hundred pixels wide gets roughly one or two pixels per period, so what it draws is *not the function* but an interference pattern between the true frequency and the pixel grid : the same aliasing that makes wheels spin backward on film.

    Calculus knows better without drawing anything : the graph is an ordinary sine wave with amplitude exactly $1$ and period
    $ (2pi)/100 approx 0.063 $
    A trustworthy view needs a window only a few periods wide, such as $[0, 0.2]$, a window nobody would guess without first reading the formula.
  ]
]

#note("What this section is really about")[
  Neither tool replaces the other. The machine supplies speed and precision ; calculus supplies the guarantee that nothing important is hiding off-screen. Use each one to audit the other.
]
