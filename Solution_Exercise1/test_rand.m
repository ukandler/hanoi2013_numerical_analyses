close all;

a = [10,30,100,300,1000];

for i=1:10
    for j=1:length(a)
    A=rand(a(j));
    [LU,p,rho] = LUfac(A,1);
    GF(i,j)=rho;
    end
end


figure;
y=sqrt(1:a(length(a)));
x=1:a(length(a));
gn = loglog(x,y);
hold on;
for i=1:length(a)
g(i) = loglog(a(i)*ones(length(GF(:,i)),1),GF(:,i),'rx');
end



title('Growth factor of random matrices');
xlabel('growth factor');
ylabel('n');

legend([g(1) gn],{'growth factor' 'sqrt(n)'},'Location','NorthWest') 
