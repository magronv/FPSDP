function [ mom ,loc ] = matrix_p(base, n, d, pow, coefs)
%Calculates intelligently the moment and localizing matrix
%, in the basis of polynomials of degree d with n variables
%, based on coefs and pow calculated from the polynomial.


%indices for the first elements for each subblock
res = zeros(1,d+2);
res(1) = 1;
for i=0:d
    res(i+2) = res(i+1) + nchoosek(i+n-1,i);
end

%mom : moment matrix
%loc : localizing matrix
%d_l : width of the subblock
%d_c : length of the subblock

t = length(coefs);

mom = zeros(res(d+2)-1,res(d+2)-1);
loc = mom;
for i=1:(d+1)
    d_l = res(i+1) - res(i);
    for j=1:i
        d_c = res(j+1) - res(j);
        if (~mod(i+j,2))
            for k=0:(d_l-1)
                for l=0:(d_c-1)
                    if (~any(mod(base(res(i)+k,:)+base(res(j)+l,:),2)))
                        mom(res(i)+k,res(j)+l)=prod(2./(base(res(i)+k,:)+base(res(j)+l,:)+1));
                    end
                end
            end
        end
        for r=1:t
            if (~mod(i+j+sum(pow(r,:)),2))
                for k=0:(d_l-1)
                    for l=0:(d_c-1)
                        if (~any(mod(base(res(i)+k,:)+base(res(j)+l,:)+pow(r,:),2)))
                            loc(res(i)+k,res(j)+l)=loc(res(i)+k,res(j)+l)+coefs(r)*prod(2./(base(res(i)+k,:)+base(res(j)+l,:)+pow(r,:)+1));
                        end
                    end
                end
            end
        end
        mom(res(j):(res(j)+d_c-1),res(i):(res(i)+d_l-1)) = mom(res(i):(res(i)+d_l-1),res(j):(res(j)+d_c-1))';
        loc(res(j):(res(j)+d_c-1),res(i):(res(i)+d_l-1)) = loc(res(i):(res(i)+d_l-1),res(j):(res(j)+d_c-1))';
    end
end
    
end
