sdpvar x1 x2 x3 x4 x5 x6;
sineOrder3 = ((( (-1/8) * x2 + ( (-1290061377/10000000000) * x3 + ( (-1290061377/10000000000) * x4 + ( (-1290061377/10000000000) * x5 + ( (-1290061377/10000000000) * x6))))) * x1 + ( (1/2) * x2 + ( (1/2) * x6))) * x1 + ( (4774648293/5000000000) * x2 + ( (4774648293/5000000000) * x6))) * x1;
err = [x2 x3 x4 x5 x6];
var = x1;
a = -2;
b = 2;

calculate_mvbeta(12, sineOrder3, var, a, b, err);
calculate_geneig(6, sineOrder3, var, a, b, err);
calculate_robustsdp(9, sineOrder3, var, a, b, err);