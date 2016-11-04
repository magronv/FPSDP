sdpvar x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15;
rigidbody2 = (((( - x10 + ( - x11 + ( - x12 + ( - x13 + ( - x14 + ( - x15)))))) * x3) * x2 + (( (2/1) * x4 + ( (2/1) * x5 + ( (2/1) * x6 + ( (2/1) * x9 + ( (2/1) * x13 + ( (2/1) * x14 + ( (2/1) * x15))))))) * x3)) * x2) * x1 + (( - x15) * x2 + (( (6/1) * x7 + ( (6/1) * x8 + ( (3/1) * x9 + ( (3/1) * x13 + ( (6/1) * x14 + ( (6/1) * x15)))))) * x3^2));
err = [x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15];
var = [x1 x2 x3];
a = [-15 -15 -15];
b = [15 15 15];

calculate_mvbeta(6, rigidbody2, var, a, b, err);
calculate_geneig(3, rigidbody2, var, a, b, err);
calculate_robustsdp(4, rigidbody2, var, a, b, err);
