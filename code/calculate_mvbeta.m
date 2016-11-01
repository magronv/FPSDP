function [ lambda ] = calculate_mvbeta( nb_iter , p, x, a, b, e)
%Optimisation using elementary calculation.
%Returns a sequence converging to the polynomial's maximum.
%Results will be also printed in a file named p_mvbeta_results.

foldername = strcat(inputname(2),'_mvbeta_results');
fid = fopen(foldername,'w');
fprintf(fid,'%s %s\n','results of calculating mvbeta for',inputname(2));

[~, ~, poly , max_coefs_beta] = scale(p, x, a, b, e);

[p_pow,p_coefs]=getexponentbase(poly,[x e]);

lambda = zeros(1,nb_iter);
n = length([x e]);

base = basis(2*n, nb_iter);

res = zeros(1,nb_iter+2);
res(1) = 1;
for i=0:nb_iter
    res(i+2) = res(i+1) + nchoosek(i+2*n-1,i);
end

t = length(p_coefs); %same as length(m_coefs)

for k=2:(nb_iter+1)
    disp(k-1);
    fprintf(fid,'%s %i  ','order',k-1);
    tic
    nb_calc = res(k+1) - res(k);
    p_min = + Inf;
    m_min = + Inf;
    for i=1:nb_calc
        p_tmp = 0;
        m_tmp = 0;
        denum = prod(beta(base(res(k)+i-1,1:n)+1, base(res(k)+i-1,(n+1):(2*n))+1));
        for r=1:t
            p_num = prod(beta(base(res(k)+i-1, 1:n)+p_pow(r,:)+1, base(res(k)+i-1,(n+1):(2*n))+1));
            p_tmp = p_tmp + p_coefs(r)*p_num;
            m_tmp = m_tmp - p_coefs(r)*p_num; %to avoid doing the same for -poly
        end
        p_tmp = p_tmp/denum;
        if (p_tmp < p_min)
            p_min = p_tmp;
        end
        m_tmp = m_tmp/denum;
        if (m_tmp < m_min)
            m_min = m_tmp;
        end
    end
    tt = toc;
    toc
    lambda(k-1) = max_coefs_beta*max(abs(p_min),abs(m_min))*2^(-53);
    fprintf(fid,'%s %e  ','bound',lambda(k-1));
    fprintf(fid,'%s %f\n','time',tt);
end
fclose('all');
end
