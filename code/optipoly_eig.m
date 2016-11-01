function [ lambda ] = optipoly_eig(nb_iter, poly,x)
%Optimisation using Lasserre's SDP relaxations.
%Returns a sequence converging to the polynomial's maximum.
%The SDP solver used here is eig.

[pow,coefs]=getexponentbase(poly,x);

lambda = zeros(1,nb_iter);
n = length(x);

for i=1:nb_iter
    base = basis(n, i);
    disp(i)
    disp('Calculating moment and localising matrices:')
    tic
    [M,L] = matrix_p(base, n, i, pow, coefs);
    toc
    disp('Resolving of the SDP problem:')
    tic
    lambda(i) = min(eig(L,M));
    toc
end

end

