sdpvar x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 x32 x33 x34 x35 x36 x37 x38 x39 x40 x41 x42;
kepler2 = ((( - x7 + ( - x8 + ( - x9 + ( - x10 + ( - x11 + ( - x12 + ( - x13 + ( - x14 + ( - x22 + ( - x30 + ( - x33 + ( - x36 + ( - x39 + ( - x42)))))))))))))) * x4) * x1 + (((x7 + (x9 + (x10 + (x11 + (x12 + (x13 + (x14 + (x22 + (x30 + (x33 + (x36 + (x39 + (x42))))))))))))) * x4 + ((x15 + (x16 + (x17 + (x18 + (x19 + (x20 + (x21 + (x22 + (x30 + (x33 + (x36 + (x39 + (x42))))))))))))) * x5 + (( - x37 + ( - x38 + ( - x39 + ( - x42)))) * x6))) * x2 + (((x7 + (x10 + (x11 + (x12 + (x13 + (x14 + (x22 + (x30 + (x33 + (x36 + (x39 + (x42)))))))))))) * x4 + (( - x34 + ( - x35 + ( - x36 + ( - x39 + ( - x42))))) * x5 + ((x23 + (x24 + (x25 + (x26 + (x27 + (x28 + (x29 + (x30 + (x33 + (x36 + (x39 + (x42)))))))))))) * x6))) * x3 + ((( - x7 + ( - x11 + ( - x12 + ( - x13 + ( - x14 + ( - x22 + ( - x30 + ( - x33 + ( - x36 + ( - x39 + ( - x42))))))))))) * x4 + ((x7 + (x12 + (x13 + (x14 + (x22 + (x30 + (x33 + (x36 + (x39 + (x42)))))))))) * x5 + ((x7 + (x13 + (x14 + (x22 + (x30 + (x33 + (x36 + (x39 + (x42))))))))) * x6))) * x4)))) * x1 + (((( - x15 + ( - x16 + ( - x17 + ( - x18 + ( - x19 + ( - x20 + ( - x21 + ( - x22 + ( - x30 + ( - x33 + ( - x36 + ( - x39 + ( - x42))))))))))))) * x5) * x2 + ((( - x31 + ( - x32 + ( - x33 + ( - x36 + ( - x39 + ( - x42)))))) * x4 + ((x15 + (x17 + (x18 + (x19 + (x20 + (x21 + (x22 + (x30 + (x33 + (x36 + (x39 + (x42)))))))))))) * x5 + ((x23 + (x24 + (x25 + (x26 + (x27 + (x28 + (x29 + (x30 + (x33 + (x36 + (x39 + (x42)))))))))))) * x6))) * x3 + (((x15 + (x18 + (x19 + (x20 + (x21 + (x22 + (x30 + (x33 + (x36 + (x39 + (x42))))))))))) * x5) * x4 + ((( - x15 + ( - x19 + ( - x20 + ( - x21 + ( - x22 + ( - x30 + ( - x33 + ( - x36 + ( - x39 + ( - x42)))))))))) * x5 + ((x15 + (x20 + (x21 + (x22 + (x30 + (x33 + (x36 + (x39 + (x42))))))))) * x6)) * x5)))) * x2 + (((( - x23 + ( - x25 + ( - x26 + ( - x27 + ( - x28 + ( - x29 + ( - x30 + ( - x33 + ( - x36 + ( - x39 + ( - x42))))))))))) * x6) * x3 + (((x23 + (x26 + (x27 + (x28 + (x29 + (x30 + (x33 + (x36 + (x39 + (x42)))))))))) * x6) * x4 + (((x23 + (x27 + (x28 + (x29 + (x30 + (x33 + (x36 + (x39 + (x42))))))))) * x6) * x5 + (( - x23 + ( - x28 + ( - x29 + ( - x30 + ( - x33 + ( - x36 + ( - x39 + ( - x42)))))))) * x6^2)))) * x3 + (((( - x40 + ( - x41 + ( - x42))) * x6) * x5) * x4)));
err = [x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 x32 x33 x34 x35 x36 x37 x38 x39 x40 x41 x42];
var = [x1 x2 x3 x4 x5 x6];
a = [4 4 4 4 4 4];
b = [6.36 6.36 6.36 6.36 6.36 6.36];

calculate_mvbeta(2, kepler2, var, a, b, err);
calculate_geneig(1, kepler2, var, a, b, err);
calculate_robustsdp(1, kepler2, var, a, b, err);