function [ lambda ] = calculate_robustsdp(nb_iter, p, x, a, b, e)
%Optimisation using robust SDP relaxations.
%Return a sequence converging to the polynomial's maximum.
%Results will be also printed in a file named "polynomial_name"_robustsdp_results.

foldername = strcat(inputname(2),'_robustsdp_results');
fid = fopen(foldername,'w');
fprintf(fid,'%s %s\n','results of calculating robustsdp for',inputname(2));

[poly, max_coefs_sdpr, ~ , ~] = scale(p, x, a, b, e);

lambda = zeros(1,nb_iter);
p_s=coefficients(poly,e);

n = length(x); %x must have at least 1 variable.
m = length(p_s); %beacause polynomials may have not envoled all the variables ei

sdpvar y z
objective = -y;
option = sdpsettings('verbose',0,'solver','mosek');

%m_*: variable names used for the optimization of "minus" the polynomial
%p_*: variable names used for the optimization of "plus" the polynomial

for i=1:nb_iter
    disp(i)
    fprintf(fid,'%s %i  ','order',i);
    base = basis(n, i);
    disp('Problem establishment:')
    p_L = []; m_L = [];
    p_R = []; m_R = [];
    p_S = []; m_S = [];
    p_G = []; m_G = [];
    tic
    for j=1:m
        [p_pow,p_coefs] = getexponentbase(p_s(m+1-j),x);
        [p_mom,p_loc] = matrix_p(base, n, i, p_pow, p_coefs);
        [p_Lj,p_Rj] = fullrf(p_loc);
        [m_Lj,m_Rj] = fullrf(-p_loc);
        p_L = [p_L, p_Lj/2];
        m_L = [m_L, m_Lj/2];
        p_R = [p_R, p_Rj'];
        m_R = [m_R, m_Rj'];
    end
    p_R = p_R';
    m_R = m_R';
    p_r = length(p_L(1,:));
    m_r = length(m_L(1,:));
    snd = length(base);
    p_mat = sdpvar(p_r+length(base));
    m_mat = sdpvar(m_r+length(base));
    p_mat(1:snd, 1:snd) = y * p_mom - z * p_L * p_L';
    m_mat(1:snd, 1:snd) = y * p_mom - z * m_L * m_L';
    p_mat((1+snd):(p_r+snd), 1:snd) = p_R ;
    m_mat((1+snd):(m_r+snd), 1:snd) = m_R ;
    p_mat(1:snd, (1+snd):(p_r+snd)) = p_mat((1+snd):(p_r+snd), 1:snd)'; %by symmetry
    m_mat(1:snd, (1+snd):(m_r+snd)) = m_mat((1+snd):(m_r+snd), 1:snd)'; %by symmetry
    p_mat((1+snd):(p_r+snd), (1+snd):(p_r+snd)) = z * eye(p_r,p_r);
    m_mat((1+snd):(m_r+snd), (1+snd):(m_r+snd)) = z * eye(p_r,p_r);
    p_constraint = p_mat >= 0;
    m_constraint = m_mat >= 0;
    t1 = toc;
    toc
    disp('Problem resolving:')
    tic
    optimize(p_constraint, objective, option);
    p_y = value(y);
    optimize(m_constraint, objective, option);
    m_y = value(y);
    t2 = toc;
    toc
    lambda(i) = max_coefs_sdpr*max(abs(p_y),abs(m_y))*2^(-53);
    fprintf(fid,'%s %e  ','bound',lambda(i));
    fprintf(fid,'%s %f %s %f\n','establishment time',t1,'resolution time',t2);
end
fclose(fid);
end
