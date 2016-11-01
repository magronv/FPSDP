sdpvar x1 x2 x3 x4 x5 x6 x7 x8 x9 x10;
rigibody1 = (( - x4 + ( - x5 + ( - x8 + ( - x9 + ( - x10))))) * x2 + ( - x9 + ( - x10))) * x1 + ((( (-2/1) * x6 + ( (-2/1) * x7 + ( (-2/1) * x8 + ( (-2/1) * x9 + ( (-2/1) * x10))))) * x3) * x2 + (( - x10) * x3));
err = [x4 x5 x6 x7 x8 x9 x10];
var = [x1 x2 x3];
a = [-15 -15 -15];
b = [15 15 15];
iter = 4;

[p_geneig, p_mvbeta, p_robustsdp] = comparaison(iter, rigibody1, var, a, b, err);
[m_geneig, m_mvbeta, m_robustsdp] = comparaison(iter, -rigibody1, var, a, b, err);

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