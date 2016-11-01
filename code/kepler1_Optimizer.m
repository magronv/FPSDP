sdpvar x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28;
kepler1 = ((( - x5 + ( - x6 + ( - x7 + ( - x8 + ( - x9 + ( - x10 + ( - x15 + ( - x20 + ( - x23 + ( - x25 + ( - x27 + ( - x28)))))))))))) * x4) * x1 + (((x5 + (x7 + (x8 + (x9 + (x10 + (x15 + (x20 + (x23 + (x25 + (x27 + (x28))))))))))) * x4 + (x11 + (x12 + (x13 + (x14 + (x15 + (x20 + (x23 + (x25 + ( - x26)))))))))) * x2 + (((x5 + (x8 + (x9 + (x10 + (x15 + (x20 + (x23 + (x25 + (x27 + (x28)))))))))) * x4 + (x16 + (x17 + (x18 + (x19 + (x20 + (x23 + ( - x24)))))))) * x3 + (( - x5 + ( - x9 + ( - x10 + ( - x15 + ( - x20 + ( - x23 + ( - x25 + ( - x27 + ( - x28))))))))) * x4^2)))) * x1 + ((( - x11 + ( - x12 + ( - x13 + ( - x14 + ( - x15 + ( - x20 + ( - x23 + ( - x25 + ( - x27 + ( - x28)))))))))) * x2 + ((( - x21 + ( - x22 + ( - x23 + ( - x25 + ( - x27 + ( - x28)))))) * x4 + (x12 + (x13 + (x14 + (x15 + (x16 + (x17 + (x18 + (x19 + ( (2/1) * x20 + ( (2/1) * x23 + ( (2/1) * x25 + ( (2/1) * x27 + ( (2/1) * x28)))))))))))))) * x3 + ((x13 + (x14 + (x15 + (x20 + (x23 + (x25 + (x27 + (x28)))))))) * x4))) * x2 + ((( - x17 + ( - x18 + ( - x19 + ( - x20 + ( - x23 + ( - x25 + ( - x27 + ( - x28)))))))) * x3 + ((x18 + (x19 + (x20 + (x23 + (x25 + (x27 + (x28))))))) * x4)) * x3 + (( - x28) * x4)));
err = [x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28];
var = [x1 x2 x3 x4];
a = [4 4 4 4];
b = [6.36 6.36 6.36 6.36];
iter = 2;

[p_geneig, p_mvbeta, p_robustsdp] = comparaison(iter, kepler1, var, a, b, err);
[m_geneig, m_mvbeta, m_robustsdp] = comparaison(iter, -kepler1, var, a, b, err);

geneig = zeros(1,iter);
mvbeta = zeros(1,2*iter);
robustsdp = zeros(1,iter);
for i=1:iter
    geneig(i) = max(abs(p_geneig(i)),abs(m_geneig(i)));
    mvbeta(2*i-1) = max(abs(p_mvbeta(2*i-1)),abs(m_mvbeta(2*i-1)));
    mvbeta(2*i) = max(abs(p_mvbeta(2*i)),abs(m_mvbeta(2*i)));
    robustsdp(i) = max(abs(p_robustsdp(i)),abs(m_robustsdp(i)));
end

robustsdp = 2^(-53)*robustsdp;
geneig = 2^(-53)*geneig;
mvbeta = 2^(-53)*mvbeta;