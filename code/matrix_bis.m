function [ mom , loc ] = matrix_bis(base, pow, coefs)
%Calculates intuitively the moment and localizing matrix
%, in the basis of polynomials of degree d with n variables
%, based on coefs and pow calculated from the polynomial.

snd = length(base);
len = length(coefs);
mom = zeros(snd);
loc = mom;

for j=1:snd
    for i=j:snd
        for k=1:len
            if (~any(mod(base(i,:)+base(j,:)+pow(k,:),2)))
                loc(i,j)=loc(i,j)+coefs(k)*prod(2./(base(i,:)+base(j,:)+pow(k,:)+1));
            end
        end 
        if (~any(mod(base(i,:)+base(j,:),2)))
            mom(i,j)=prod(2./(base(i,:)+base(j,:)+1));
        end
        loc(j,i)=loc(i,j);
        mom(j,i)=mom(i,j);
    end
end

end
