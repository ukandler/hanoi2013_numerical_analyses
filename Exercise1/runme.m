%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Scriptfile 
% (LR-decomposition)
%
%
% Falk Ebert, 2008
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all

n=100;
h=1/n;
EI=5e-2;
v=[6,-4,1,zeros(1,n-3)];
A=toeplitz(v,v);
A(1,1)=7;
A(n,n)=7;
A=EI*(n^4)*A;

%A=A+ones(length(A))*1e-3;
invtime=0;
lutime=0;


%unbelastete Bruecke
x0=rand(1,n);
[LU,p,gf] = LUfac(A,1);
x0=forback(LU,-ones(n,1),p);



t=(0:1/10:1)'*2*pi;
carx=3.4*[-1,1,1,0.5,0,-0.5,-1]+0.5;
cary=4*[0.5,0.5,0.65,0.75,1,1,0.75]-1.2;
leftx=[-1,2*h,0.5,-1];
lefty=[0,0,-1,-1];

nochmal=1;

while (nochmal==1)
for i=2:n-1
    b=-ones(n,1);
    b(i)=-n;
    clf;
    hold on;
    tic;
    Ai=inv(A);
    x=Ai*b;
    invtime=invtime+toc;

% Bruecke

    plot(2/n*(1:n),x0,'r:')
    plot(2/n*(1:n),x)

% Raeder
    fill(2/n*(i-1)+h/2*cos(t),x(i-1)+h/2*(1+sin(t)),'black')
    fill(2/n*(i+1)+h/2*cos(t),x(i+1)+h/2*(1+sin(t)),'black')    

% Auto
    sphi=(x(i+1)-x(i-1))/(4*h);
    cphi=sqrt(1-sphi^2);

    fill(2/n*(i)+h*carx*cphi-h*cary*sphi,x(i)+h*cary*cphi+h*carx*sphi,'black')    

% Haenge
    fill(leftx,lefty,'green')
    fill(2-leftx,lefty,'green')
    
    
    axis([0,2,-1,1])
    axis equal
    axis off
    drawnow;
    hold off
end

disp('Press [Enter]')
pause

for i=n-1:-1:2
    b=-ones(n,1);
    b(i)=-n;
    clf;
    hold on;
    tic;
    x=forback(LU,b,p);
    lutime=lutime+toc;

% Bruecke

    plot(2/n*(1:n),x0,'r:')
    plot(2/n*(1:n),x)

% Raeder
    fill(2/n*(i-1)+h/2*cos(t),x(i-1)+h/2*(1+sin(t)),'black')
    fill(2/n*(i+1)+h/2*cos(t),x(i+1)+h/2*(1+sin(t)),'black')    


% Auto
    sphi=(x(i+1)-x(i-1))/(4*h);
    cphi=sqrt(1-sphi^2);

    fill(2/n*(i)-h*carx*cphi-h*cary*sphi,x(i)+h*cary*cphi-h*carx*sphi,'black')    

% Haenge
    fill(leftx,lefty,'green')
    fill(2-leftx,lefty,'green')
    
    
    axis([0,2,-1,1])
    axis equal
    axis off
    drawnow;
    hold off
end
    
nochmal=menu('Again?','Yes','No');
end %while


%'Zeit mit Berechnung der Inversen'
%invtime
%'Zeit mit Vorwaerts- Rueckwaertseinsetzen'
%lutime


cl=menu('Closing?','Yes','No');
if cl==1 
    close all
end
