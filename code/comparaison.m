function [ lass, beta, srob ] = comparaison(nb_iter, p, x, a, b, e)
%p: Polynomial which one seeks the minimum.
%x: Real variables.
%a: vector of inferior bounds, a(i)<= x(i).
%b: vector of superior bounds, x(i)<= b(i).
%e: Error variables.

n = length(x);
o = length(e);

% preprocessing variables (Linear transformation):
x_modifie_sdpr = sdpvar(1,n);
x_modifie_beta = sdpvar(1,n);
for i=1:n
    x_modifie_sdpr(i) = (a(i) + b(i) +(b(i)-a(i))*x(i)) / 2;
    x_modifie_beta(i) = (b(i) - a(i)) * x(i) + a(i);
end 
e_modifie_beta = sdpvar(1,o);
for i=1:o
    e_modifie_beta(i) = 2 * e(i) - 1;
end 

% preprocessing polynomials:
s = coefficients(p,e);
p_modifie_sdpr = p-p;
p_modifie_beta = p_modifie_sdpr;
for i=1:o
    [pow,coefs]=getexponentbase(s(o+1-i),x);
    s_modifie_sdpr = s(o+1-i)-s(o+1-i);
    s_modifie_beta = s_modifie_sdpr;
    for j=1:length(coefs)
        if (any(pow(j,:)))
            s_modifie_sdpr = s_modifie_sdpr + coefs(j)*prod((x_modifie_sdpr).^pow(j,:));
            s_modifie_beta = s_modifie_beta + coefs(j)*prod((x_modifie_beta).^pow(j,:));
        else 
            s_modifie_sdpr = s_modifie_sdpr + coefs(j);
            s_modifie_beta = s_modifie_beta + coefs(j);
        end 
    end 
    p_modifie_sdpr = p_modifie_sdpr + s_modifie_sdpr * e(i);
    p_modifie_beta = p_modifie_beta + s_modifie_beta * e_modifie_beta(i);
end

[~, coefs_sdpr] = getexponentbase(p_modifie_sdpr, [x,e]);
p_modifie_sdpr = p_modifie_sdpr / max(abs(coefs_sdpr));

[~, coefs_beta] = getexponentbase(p_modifie_beta, [x,e]);
p_modifie_beta = p_modifie_beta / max(abs(coefs_beta));

%Calculating the return values using the three implemented scripts:
disp('**********robustsdp')
srob = optipoly_opti_rob(nb_iter, p_modifie_sdpr, x, e) * max(abs(coefs_sdpr));
disp('**********geneig')
lass = optipoly_opti(nb_iter, p_modifie_sdpr, [x e]) * max(abs(coefs_sdpr));
disp('**********mvbeta')
beta = optipoly_beta(2*nb_iter, p_modifie_beta, [x e]) * max(abs(coefs_beta));

end

