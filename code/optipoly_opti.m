function [ lambda ] = optipoly_opti(nb_iter, p, x, a, b, e)
%Maximization of polynomial p with x varies in [a,b] and e in [-1,1]^m.
%The algorithm performs Lasserre's SDP relaxations.
%Returns a sequence converging to the polynomial's maximum.

[poly, max_coefs_sdpr, ~ , ~] = scale(p, x, a, b, e);

[pow,coefs]=getexponentbase(poly,[x e]);

lambda = zeros(1,nb_iter);
n = length([x e]);

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
    lambda(i) = max_coefs_sdpr*value(y);
    toc
end

end

