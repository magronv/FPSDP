sdpvar x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13;
sineTaylor = (((( (-1/5040) * x2 + ( (-1/5040) * x3 + ( (-1/5040) * x6 + ( (-1/5040) * x7 + ( (-1/5040) * x10 + ( (-1/5040) * x11 + ( (-1/5040) * x12 + ( (-1/5040) * x13)))))))) * x1^2 + ( (1/120) * x2 + ( (1/120) * x3 + ( (1/120) * x6 + ( (1/120) * x7 + ( (1/120) * x8 + ( (1/120) * x9 + ( (1/120) * x13)))))))) * x1^2 + ( (-1/6) * x2 + ( (-1/6) * x3 + ( (-1/6) * x4 + ( (-1/6) * x5 + ( (-1/6) * x9 + ( (-1/6) * x13))))))) * x1^2 + (x5 + (x9 + (x13)))) * x1;
err = [x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13];
var = x1;
a = -1.57079632679;
b = 1.57079632679;
iter = 3;

[p_geneig, p_mvbeta, p_robustsdp] = comparaison(iter, sineTaylor, var, a, b, err);
[m_geneig, m_mvbeta, m_robustsdp] = comparaison(iter, -sineTaylor, var, a, b, err);

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