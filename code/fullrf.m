function [ C, F ] = fullrf( matrice )
%Full rank factorisation of the given matrix
%Given an m*n matrix matrice of rank r, fullrf returns
%two matrices C and F such that matrice=C*F, where
%C is an m*r matrix and F is an r*n matrix.

tmp = rref(matrice);

r = rank(matrice);

[p, q] = size(matrice);

C = zeros(p,r);
j = 1;
for i=1:q
    m = find(tmp(:,i),1,'last');
    n = find(tmp(m,:),1);
    if (n>=i)
        C(:,j) = matrice(:,i);
        j = j+1;
    end
end

F = tmp(1:r,:);

end
