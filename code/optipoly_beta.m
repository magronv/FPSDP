function [ lambda ] = optipoly_beta(nb_iter, p, x, a, b, e)
%Maximization of polynomial p with x varies in [a,b] and e in [-1,1]^m.
%The algorithm performs elementary calculations using the beta function.
%Returns a sequence converging to the polynomial's maximum.

[~, ~, poly, max_coefs_beta] = scale(p, x, a, b, e);

[pow,coefs]=getexponentbase(poly,[x e]);

lambda = zeros(1,nb_iter);
n = length([x e]);

base = basis(2*n, nb_iter);

res = zeros(1,nb_iter+2);
res(1) = 1;
for i=0:nb_iter
    res(i+2) = res(i+1) + nchoosek(i+2*n-1,i);
end

t = length(coefs);

for k=2:(nb_iter+1)
    disp(k-1);
    tic
    nb_calc = res(k+1) - res(k);
    min = + Inf;
    for i=1:nb_calc
        tmp = 0;
        denum = prod(beta(base(res(k)+i-1,1:n)+1, base(res(k)+i-1,(n+1):(2*n))+1));
        for r=1:t
            num = prod(beta(base(res(k)+i-1, 1:n)+pow(r,:)+1, base(res(k)+i-1,(n+1):(2*n))+1));
            tmp = tmp + coefs(r)*num;
        end
        tmp = tmp/denum;
        if (tmp < min)
            min = tmp;
        end
    end
    lambda(k-1) = max_coefs_beta*min;
    toc
end

end

