sdpvar x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18;
rigidbody2 = (((( - x4 + ( (-2/1) * x5 + ( - x6 + ( - x13 + ( - x14 + ( - x15 + ( - x16 + ( - x17 + ( - x18))))))))) * x3) * x2 + (( (2/1) * x4 + ( (2/1) * x5 + ( (2/1) * x6 + ( (2/1) * x7 + ( (2/1) * x8 + ( (2/1) * x9 + ( (2/1) * x12 + ( (2/1) * x16 + ( (2/1) * x17 + ( (2/1) * x18)))))))))) * x3)) * x2) * x1 + (( - x5 + ( - x18)) * x2 + (( (12/1) * x6 + ( (6/1) * x10 + ( (6/1) * x11 + ( (3/1) * x12 + ( (3/1) * x16 + ( (6/1) * x17 + ( (6/1) * x18))))))) * x3^2));
err = [x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18];
var = [x1 x2 x3];
a = [-15 -15 -15];
b = [15 15 15];

calculate_mvbeta(6, rigidbody2, var, a, b, err);
calculate_geneig(3, rigidbody2, var, a, b, err);
calculate_robustsdp(7, rigidbody2, var, a, b, err);
