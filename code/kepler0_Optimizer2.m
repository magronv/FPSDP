sdpvar x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21;
kepler0 = (( - x14 + ( - x15 + ( - x16 + ( - x17 + ( - x18 + ( - x19 + ( - x20 + ( - x21)))))))) * x1 + ((x15 + (x16 + (x17 + (x18 + (x19 + (x20 + (x21))))))) * x2 + ((x16 + (x17 + (x18 + (x19 + (x20 + (x21)))))) * x3 + (( - x17 + ( - x18 + ( - x19 + ( - x20 + ( - x21))))) * x4 + ((x18 + (x19 + (x20 + (x21)))) * x5 + ((x19 + (x20 + (x21))) * x6)))))) * x1 + ((( - x10 + ( - x11 + ( - x13 + ( - x21)))) * x3 + ((x7 + (x9 + (x11 + (x13 + (x21))))) * x5)) * x2 + (((x8 + (x9 + (x11 + (x13 + (x21))))) * x6) * x3 + ((( - x12 + ( - x13 + ( - x21))) * x6) * x5)));
err = [x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21];
var = [x1 x2 x3 x4 x5 x6];
a = [4 4 4 4 4 4];
b = [6.36 6.36 6.36 6.36 6.36 6.36];

calculate_mvbeta(4, kepler0, var, a, b, err);
calculate_geneig(2, kepler0, var, a, b, err);
calculate_robustsdp(2, kepler0, var, a, b, err);