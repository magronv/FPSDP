sdpvar x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21;
kepler0 = (( - x14 + ( - x15 + ( - x16 + ( - x17 + ( - x18 + ( - x19 + ( - x20 + ( - x21)))))))) * x1 + ((x15 + (x16 + (x17 + (x18 + (x19 + (x20 + (x21))))))) * x2 + ((x16 + (x17 + (x18 + (x19 + (x20 + (x21)))))) * x3 + (( - x17 + ( - x18 + ( - x19 + ( - x20 + ( - x21))))) * x4 + ((x18 + (x19 + (x20 + (x21)))) * x5 + ((x19 + (x20 + (x21))) * x6)))))) * x1 + ((( - x10 + ( - x11 + ( - x13 + ( - x21)))) * x3 + ((x7 + (x9 + (x11 + (x13 + (x21))))) * x5)) * x2 + (((x8 + (x9 + (x11 + (x13 + (x21))))) * x6) * x3 + ((( - x12 + ( - x13 + ( - x21))) * x6) * x5)));
err = [x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21];
var = [x1 x2 x3 x4 x5 x6];
a = [4 4 4 4 4 4];
b = [6.36 6.36 6.36 6.36 6.36 6.36];
iter = 2;

[p_geneig, p_mvbeta, p_robustsdp] = comparaison(iter, kepler0, var, a, b, err);
[m_geneig, m_mvbeta, m_robustsdp] = comparaison(iter, -kepler0, var, a, b, err);

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
