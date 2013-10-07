function [LU,gf] = LUfac(A)
% computes the LU factorization of A in place
%
% INPUT:  A matrix[n,n]
% 
% OUTPUT: LU matrix[n,m]  contains the LU-factorization of A
%         gf growth factor of A

[n,~] = size(A);

%largest element of the matrix A
amax  = TODO;

for j = 1:n-1
        % TODO
        % compute L entries
        % compute U entries
        % compute akmax (maximum element of the LU factorization)
end

LU = A(:,:);

% growth factor
gf = akmax/amax;


