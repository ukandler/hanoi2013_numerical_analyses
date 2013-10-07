function [LU,p,gf] = LUfac(A,pivot)

% INPUT:  A matrix[n,m]
%         pivot scalar[1,1] switch (without pivoting pivot=0, with pivoting pivot=1)
% OUTPUT: LU matrix[n,m]  contains the LU-factorization of A
%         p  vector[n,1]  vector of permutations p= P*[1:n]' (with P = permutation matrix)

[n,~] = size(A);

%vector of permutations
p = 1:1:n;

%largest elements of the matrix A
amax  = max(max(abs(A)));
akmax = max(max(abs(A)));


for j = 1:n-1
    
    if (pivot == 1)
        
        %pivoting (column)
        m = j;
        for i = j+1:n
            if (abs(A(p(i),j)) > abs(A(p(m),j)))
                m=i;
            end
        end
        
        %swap the entries if necessary
        if (m ~= j)
            temp = p(j);
            p(j) = p(m);
            p(m) = temp;
        end
    end %if
    
    % elimination
    
    for i = j+1:n        
        if (A(p(j),j) == 0)
            error('Matrix not invertible')
        end
        
        %L entries
        A(p(i),j) = A(p(i),j) / A(p(j),j);        
        
        %U entries
        
        for k = j+1:n
            A(p(i),k) = A(p(i),k) - A(p(j),k) * A(p(i),j);          
        end
        
    end
    
    
    akmax = max(akmax,max(max(abs(A))));
end

LU = A(p(1:n),:);

gf = akmax/amax;


