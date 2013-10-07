function b = forback(LU,b)
%INPUT:  LU  LU factorization of A (n by n)
%        b   right hand side b of dimension n
%OUTPUT: x   solution of the linear system 

n  = length(LU);
% compute the solution from the LU-factorization in 2 steps:

% 1. forward substitution (Ly=b)
for i = 2:n
   b(i) = b(i) - (LU(i,1:i-1) * b(1:i-1)); % i-th entry of y
end

   
% 2. backward substitution (Rx=y)
% TODO



