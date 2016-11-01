sdpvar x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13;
rigibody1 = (( - x4 + ( - x5 + ( - x7 + ( - x8 + ( - x11 + ( - x12 + ( - x13))))))) * x2 + ( - x4 + ( - x12 + ( - x13)))) * x1 + ((( (-2/1) * x5 + ( (-2/1) * x6 + ( (-2/1) * x9 + ( (-2/1) * x10 + ( (-2/1) * x11 + ( (-2/1) * x12 + ( (-2/1) * x13))))))) * x3) * x2 + (( - x6 + ( - x13)) * x3));
err = [x4 x5 x6 x7 x8 x9 x10 x11 x12 x13];
var = [x1 x2 x3];
a = [-15 -15 -15];
b = [15 15 15];

calculate_mvbeta(8, rigibody1, var, a, b, err);
calculate_geneig(4, rigibody1, var, a, b, err);
calculate_robustsdp(4, rigibody1, var, a, b, err);
