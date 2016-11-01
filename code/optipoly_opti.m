function [ lambda ] = optipoly_opti(nb_iter, poly,x)
%Optimisation using Lasserre's SDP relaxations.
%Returns a sequence converging to the polynomial's maximum.
%The SDP solver used here is mosek.

[pow,coefs]=getexponentbase(poly,x);

lambda = zeros(1,nb_iter);
n = length(x);

sdpvar y;
objective = -y;
option = sdpsettings('verbose',0,'solver','mosek');

for i=1:nb_iter
    base = basis(n, i);
    disp(i)
    disp('Calculating moment and localising matrices:')
    tic
    [M,L] = matrix_p(base, n, i, pow, coefs);
    toc
    disp('Resolving of the SDP problem:')
    tic
    constraint = L>=M*y;
    optimize(constraint,objective,option);
    lambda(i) = value(y);
    toc
end

end

