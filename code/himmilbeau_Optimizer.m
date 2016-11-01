sdpvar x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11;
himmilbeau = ((( (2/1) * x3 + ( (2/1) * x4 + ( (2/1) * x5 + (x6 + (x11))))) * x1^2 + (( (2/1) * x3 + ( (4/1) * x4 + ( (4/1) * x5 + ( (2/1) * x6 + ( (2/1) * x11))))) * x2 + ( (-22/1) * x3 + ( (-22/1) * x4 + ( (-44/1) * x5 + ( (-22/1) * x6 + ( (2/1) * x8 + ( (2/1) * x9 + (x10 + ( (-21/1) * x11)))))))))) * x1 + (( (2/1) * x7 + ( (4/1) * x8 + ( (4/1) * x9 + ( (2/1) * x10 + ( (2/1) * x11))))) * x2^2 + ( (-14/1) * x8 + ( (-28/1) * x9 + ( (-14/1) * x10 + ( (-14/1) * x11)))))) * x1 + (((( (2/1) * x7 + ( (2/1) * x8 + ( (2/1) * x9 + (x10 + (x11))))) * x2^2 + ( (2/1) * x4 + ( (2/1) * x5 + (x6 + ( (-14/1) * x7 + ( (-14/1) * x8 + ( (-28/1) * x9 + ( (-14/1) * x10 + ( (-13/1) * x11))))))))) * x2 + ( (-22/1) * x4 + ( (-44/1) * x5 + ( (-22/1) * x6 + ( (-22/1) * x11))))) * x2 + ( (242/1) * x5 + ( (121/1) * x6 + ( (98/1) * x9 + ( (49/1) * x10 + ( (170/1) * x11))))));
err = [x3 x4 x5 x6 x7 x8 x9 x10 x11];
var = [x1 x2];
a = [-5 -5];
b = [5 5];
iter = 4;

[p_geneig, p_mvbeta, p_robustsdp] = comparaison(iter, himmilbeau, var, a, b, err);
[m_geneig, m_mvbeta, m_robustsdp] = comparaison(iter, -himmilbeau, var, a, b, err);

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