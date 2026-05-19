#import "../../templates/templater.typ": *

Sometimes the functions are too complex to calculate value from arbitary input. We can approximate the value using the diiferentiation.

If $f$ is a polynomial of degree five or higher, there is no general formula for solving $f(x)=0$. Likewise, there is no formula for finding exact solutions of a transcendental equation such as $cos x = x$.

Instead of seeking exact solutions, we compute approximate solutions.

#theorem("Newton's Method")[
  Suppose we want to solve an equationn of the form $f(x)=0$. The solutions correspond to the x-intercepts of the graph of f.

  *Step 1.* Choose an initial approximation $x_1$.

  TODO: FILL BEOLOW

  #image("../images/Newton", width: 50%)
]
Will it converge to the solution?
#proof[
  TODO
]

#example([
  Starting with $x_1=0$, Starting with $x_1 = 0$
])
