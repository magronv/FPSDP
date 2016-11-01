function[ mat ] = basis (n, d)
%Calculate the basis of polynomial with degree d and n variables.
Sd = nchoosek(n+d,n);
mat = zeros(Sd,n);
deb = 2;
fin = n + 1;
diff = n;
k = 1;
l = 0;

if n == 0
    mat(1,1) = 0;
end

for i = 1:n
    mat(i+1,i) = 1;
end

for m = 2:d 
    for i = 1:n
        for j = deb:fin
            mat(j+diff,:) = mat(j,:);
            mat(j+diff,k) = mat(j,k)+1;
            if mat(j,k) ~= 0
                l = l+1;
            end
        end
        k = k +1;
        deb = deb + l;
        diff = diff + fin - deb + 1;
        l = 0;
    end
    fin = fin + diff;
    k = 1;
end

end
