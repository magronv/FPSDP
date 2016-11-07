# FPSDP
## Description
`FPSDP` is a Matlab toolbox for computation of lower bounds for roundoff error using semidefinite relaxations.

We consider the roundoff error r of a program implementing a polynomial function f(x):

			r(x,e) = l(x, e) + h(x, e)

with `l(x, e)` the part of `r(x, e)` linear w.r.t. `e` and `h(x, e)` the part  of `r(x, e)` non-linear w.r.t. `e`.

`FPSDP` computes an upper bound of `|l(x, e)|` with `x` lying in a box, and `e` being bounded by a given machine `epsilon`.


For instance, one can consider f(x) = x1^3 + (3/4) x1 x2^2, with x1 in [-1, 1] and x2 in [-2, 2].

## Installation instructions
### Prerequisites
FPSDP has been tested with `Matlab2015a` and relies on two external libraries for Matlab:

- `Yalmip` to handle the poynomial representations (Free)
- `Mosek` SDP solver (Free Academic license)

### Download
`FPSDP` is maintained as a GitHub repository at the address https://github.com/magronv/FPSDP.git

It can be obtained with the command:

$ git clone https://github.com/magronv/FPSDP.git

### Benchmarks
In the Matlab command window, add to the path the `Yalmip` and `Mosek` directories.

		addpath(genpath('path to Yalmip')); addpath(genpath('path to Mosek'));

Go to `code/` in order to execute the following scripts:

- `do_all_benchs`: executes all scripts `id_Optimizer2.m`, for each id in {'rigidbody1', 'rigidbody2', 'kepler0', 'kepler1', 'kepler2', 'sineTaylor', 'sineOrder3', 'sqroot', 'himmilbeau'}
- `do_all_benchs_realvars`: executes all scripts `id_Optimizer3.m`

After executing one of the above scripts, several files containing results are generated.

In your favorite shell terminal, go to `code/` and execute `./bring_together`.
This generates one result file for each benchmark. A file named `all_results` containing all results is also generated.
