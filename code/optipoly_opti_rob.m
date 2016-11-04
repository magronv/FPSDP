function [ lambda ] = optipoly_opti_rob(nb_iter, poly, x, e)
%Optimisation using robust SDP relaxations.
%Returns a sequence converging to the polynomial's maximum.

lambda = zeros(1,nb_iter);
s=coefficients(poly,e);

n = length(x); %x must have at least 1 variable.
m = length(s); %beacause polynomials may have not envoled all the variables ei

sdpvar y z
objective = -y;
option = sdpsettings('verbose',0,'solver','mosek');

for i=1:nb_iter
    disp(i)
    base = basis(n, i);
    disp('Problem establishment:')
    L = [];
    R = [];
    tic
    for j=1:m
        [pow,coefs] = getexponentbase(s(m+1-j),x);
        [mom,loc] = matrix_p(base, n, i, pow, coefs);
        [Lj,Rj] = fullrf(loc);
        L = [L, Lj/2];
        R = [R, Rj'];
    end
    R = R';
    r = length(L(1,:));
    snd = length(base);
    mat = sdpvar(r+length(base));
    mat(1:snd, 1:snd) = y * mom - z * L * L';
    mat((1+snd):(r+snd), 1:snd) = R;
    mat(1:snd, (1+snd):(r+snd)) = mat((1+snd):(r+snd), 1:snd)'; %by symmetry
    mat((1+snd):(r+snd), (1+snd):(r+snd)) = z * eye(r,r);
    constraint = mat >= 0;
    toc
    disp('Problem resolving:')
    tic
    optimize(constraint, objective, option);
    toc
    lambda(i) = value(y);
end

end
