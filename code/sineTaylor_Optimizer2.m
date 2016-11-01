sdpvar x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13;
sineTaylor = (((( (-1/5040) * x2 + ( (-1/5040) * x3 + ( (-1/5040) * x6 + ( (-1/5040) * x7 + ( (-1/5040) * x10 + ( (-1/5040) * x11 + ( (-1/5040) * x12 + ( (-1/5040) * x13)))))))) * x1^2 + ( (1/120) * x2 + ( (1/120) * x3 + ( (1/120) * x6 + ( (1/120) * x7 + ( (1/120) * x8 + ( (1/120) * x9 + ( (1/120) * x13)))))))) * x1^2 + ( (-1/6) * x2 + ( (-1/6) * x3 + ( (-1/6) * x4 + ( (-1/6) * x5 + ( (-1/6) * x9 + ( (-1/6) * x13))))))) * x1^2 + (x5 + (x9 + (x13)))) * x1;
err = [x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13];
var = x1;
a = -1.57079632679;
b = 1.57079632679;

calculate_mvbeta(6, sineTaylor, var, a, b, err);
calculate_geneig(3, sineTaylor, var, a, b, err);
calculate_robustsdp(8, sineTaylor, var, a, b, err);