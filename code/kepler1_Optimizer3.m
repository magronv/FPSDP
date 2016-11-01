sdpvar x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 x32;
kepler1 = ((( (-2/1) * x5 + ( - x8 + ( - x9 + ( - x10 + ( - x11 + ( - x12 + ( - x13 + ( - x14 + ( - x19 + ( - x24 + ( - x27 + ( - x29 + ( - x31 + ( - x32)))))))))))))) * x4) * x1 + (((x5 + (x6 + (x8 + (x9 + (x11 + (x12 + (x13 + (x14 + (x19 + (x24 + (x27 + (x29 + (x31 + (x32)))))))))))))) * x4 + (x15 + (x16 + (x17 + (x18 + (x19 + (x24 + (x27 + (x29 + ( - x30)))))))))) * x2 + (((x5 + (x7 + (x8 + (x9 + (x12 + (x13 + (x14 + (x19 + (x24 + (x27 + (x29 + (x31 + (x32))))))))))))) * x4 + (x20 + (x21 + (x22 + (x23 + (x24 + (x27 + ( - x28)))))))) * x3 + (( - x5 + ( (-2/1) * x8 + ( - x9 + ( - x13 + ( - x14 + ( - x19 + ( - x24 + ( - x27 + ( - x29 + ( - x31 + ( - x32))))))))))) * x4^2)))) * x1 + ((( (-2/1) * x6 + ( - x15 + ( - x16 + ( - x17 + ( - x18 + ( - x19 + ( - x24 + ( - x27 + ( - x29 + ( - x31 + ( - x32))))))))))) * x2 + ((( - x6 + ( - x7 + ( - x8 + ( - x25 + ( - x26 + ( - x27 + ( - x29 + ( - x31 + ( - x32))))))))) * x4 + ( (2/1) * x6 + ( (2/1) * x7 + (x16 + (x17 + (x18 + (x19 + (x20 + (x21 + (x22 + (x23 + ( (2/1) * x24 + ( (2/1) * x27 + ( (2/1) * x29 + ( (2/1) * x31 + ( (2/1) * x32)))))))))))))))) * x3 + ((x6 + (x8 + (x17 + (x18 + (x19 + (x24 + (x27 + (x29 + (x31 + (x32)))))))))) * x4))) * x2 + ((( (-2/1) * x7 + ( - x21 + ( - x22 + ( - x23 + ( - x24 + ( - x27 + ( - x29 + ( - x31 + ( - x32))))))))) * x3 + ((x7 + (x8 + (x22 + (x23 + (x24 + (x27 + (x29 + (x31 + (x32))))))))) * x4)) * x3 + (( - x8 + ( - x32)) * x4)));
err = [x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 x32];
var = [x1 x2 x3 x4];
a = [4 4 4 4];
b = [6.36 6.36 6.36 6.36];

calculate_mvbeta(4, kepler1, var, a, b, err);
calculate_geneig(2, kepler1, var, a, b, err);
calculate_robustsdp(2, kepler1, var, a, b, err);