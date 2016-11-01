sdpvar x1 x2 x3 x4 x5 x6;
sineOrder3 = ((( (-1/8) * x2 + ( (-1290061377/10000000000) * x3 + ( (-1290061377/10000000000) * x4 + ( (-1290061377/10000000000) * x5 + ( (-1290061377/10000000000) * x6))))) * x1 + ( (1/2) * x2 + ( (1/2) * x6))) * x1 + ( (4774648293/5000000000) * x2 + ( (4774648293/5000000000) * x6))) * x1;
err = [x2 x3 x4 x5 x6];
var = x1;
a = -2;
b = 2;
iter = 6;

[p_geneig, p_mvbeta, p_robustsdp] = comparaison(iter, sineOrder3, var, a, b, err);
[m_geneig, m_mvbeta, m_robustsdp] = comparaison(iter, -sineOrder3, var, a, b, err);

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