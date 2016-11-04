sdpvar x1 x2 x3 x4 x5 x6 x7 x8 x9 x10;
rigidbody1 = (( - x4 + ( - x5 + ( - x8 + ( - x9 + ( - x10))))) * x2 + ( - x9 + ( - x10))) * x1 + ((( (-2/1) * x6 + ( (-2/1) * x7 + ( (-2/1) * x8 + ( (-2/1) * x9 + ( (-2/1) * x10))))) * x3) * x2 + (( - x10) * x3));
err = [x4 x5 x6 x7 x8 x9 x10];
var = [x1 x2 x3];
a = [-15 -15 -15];
b = [15 15 15];

calculate_mvbeta(8, rigidbody1, var, a, b, err);
calculate_geneig(4, rigidbody1, var, a, b, err);
calculate_robustsdp(4, rigidbody1, var, a, b, err);
