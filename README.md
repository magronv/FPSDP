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

		addpath(genpath(.../Yalmip/)); addpath(genpath(.../Mosek/));

Go to `code/` in order to execute the scrpits:

- do_all_benchs: will execute the scripts namebench_Optimizer2.m
- do_all_benchs_realvars: will execute the scripts namebench_Optimizer3.m

In result of executing one of the above scripts, several files contining results will be generated.

In terminal, go to `code/` and execute `./bring_together`. As result of this, one file per benchmark will be generated containing the corresponding results and a file named `all_results` containing the hole results will be generated.

### Performing polynomial maximization 

To use the scripts for maximizing your own polynomials, please read `code/README.md`.
