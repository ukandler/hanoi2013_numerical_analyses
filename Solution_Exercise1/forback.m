function b = forback(LU,b,p)

n  = length(LU);
b  = b(p); % Berechne Pb

% forward substitution (Ly=b)
for i = 2:n
   b(i) = b(i) - (LU(i,1:i-1) * b(1:i-1)); % i-th entry of y
end

   
% backward substitution (Rx=y)
b(n) = b(n) / LU(n,n);
for i = n-1:-1:1 
   b(i) = (b(i) - LU(i,i+1:n) * b(i+1:n)) / LU(i,i); % i-th entry of x
end


