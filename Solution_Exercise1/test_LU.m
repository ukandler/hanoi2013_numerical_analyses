% part i) 
A1 = [5 3 -1  0;
      2 5  0  1;
     -1 0  5 -2;
      0 1 -2  5];

b1 = [27;24;4;4];

[LU1,p] = LUfac(A1,1);
x1 = forback(LU1,b1,p);

x1exact = A1\b1;
test1 = norm(x1exact-x1);


if (test1 < 1e-16)
   printf('Example i) is solved correctly \n')
else
   printf('Error in the LU factorization \n')
end


% part ii) 
eps=1e-16;

A2 = [eps 2;
      1   1];

b2 = [1; 1];

[LU2,p] = LUfac(A2,1);
x2 = forback(LU2,b2,p);

x2exact = A2 \ b2;
test2 = norm(x2exact - x2);


if (test2 < 1e-16)
  fprintf('Example ii) is solved correctly \n')
else
  fprintf('Error in the LU factorization \n')
end

