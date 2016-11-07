function [ lambda ] = calculate_geneig(nb_iter, p, x, a, b, e)
%Optimisation using Lasserre's SDP relaxations.
%Returns a sequence converging to the polynomial's maximum.
%Results will be also printed in a file named "polynomial_name"_geneig_results.

foldername = strcat(inputname(2),'_geneig_results');
fid = fopen(foldername,'w');
fprintf(fid,'%s %s\n','results of calculating geneig for',inputname(2));

[poly, max_coefs_sdpr, ~ , ~] = scale(p, x, a, b, e);

[p_pow,p_coefs]=getexponentbase(poly,[x e]);

lambda = zeros(1,nb_iter);
n = length([x e]);

sdpvar y;
objective = -y;
option = sdpsettings('verbose',0,'solver','mosek');

for i=1:nb_iter
    base = basis(n, i);
    disp(i)
    fprintf(fid,'%s %i  ','order',i);
    disp('Calculating moment and localising matrices:')
    tic
    [p_M,p_L] = matrix_p(base, n, i, p_pow, p_coefs);
    t1 = toc;
    toc
    disp('Resolving of the SDP problem:')
    tic
    p_constraint = p_L>=p_M*y;
    m_constraint = -p_L>=p_M*y;
    optimize(p_constraint,objective,option);
    p_y = value(y);
    optimize(m_constraint,objective,option);
    m_y = value(y);
    t2 = toc;
    toc
    lambda(i) = max_coefs_sdpr*max(abs(p_y),abs(m_y))*2^(-53);
    fprintf(fid,'%s %e  ','bound',lambda(i));
    fprintf(fid,'%s %f %s %f\n','establishment time',t1,'resolution time',t2);
end
fclose('all');
end

