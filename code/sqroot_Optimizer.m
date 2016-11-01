sdpvar x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15;
sqroot = (((( (-1/32) * x5 + ( (-5/128) * x11 + ( (-5/128) * x12 + ( (-5/128) * x13 + ( (-5/128) * x14 + ( (-5/128) * x15)))))) * x1 + ( (1/16) * x4 + ( (1/16) * x7 + ( (1/16) * x8 + ( (1/16) * x9 + ( (1/16) * x10 + ( (1/16) * x15))))))) * x1 + ( (-1/8) * x3 + ( (-1/8) * x4 + ( (-1/8) * x5 + ( (-1/8) * x6 + ( (-1/8) * x10 + ( (-1/8) * x15))))))) * x1 + (x2 + ( (3/2) * x3 + ( (3/2) * x6 + ( (3/2) * x10 + ( (3/2) * x15)))))) * x1 + (x3 + (x6 + (x10 + (x15))));
err = [x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15];
var = x1;
a = 0;
b = 1;
iter = 3;

[p_geneig, p_mvbeta, p_robustsdp] = comparaison(iter, sqroot, var, a, b, err);
[m_geneig, m_mvbeta, m_robustsdp] = comparaison(iter, -sqroot, var, a, b, err);

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