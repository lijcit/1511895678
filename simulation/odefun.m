function xp=odefun(t,X,lambda)
global gamma
b=vocterb(t);
d=vocterd(t);
A=MatrixA(t);
C=MatrixC(t);
diffb=Diffb(t);
diffA=DiffA(t);

[m1,n]=size(A);
[m2,n]=size(C);
y=X(1:m1);
x=X(m1+1:m1+n);

M=[eye(m1),zeros(m1,n);
    zeros(m1,m1),A;
    zeros(m2,m1),C];
p=[A*x-b;
    -lambda*(A*x-b)-gamma*y-diffA*x+diffb;
    d];
xp=pinv(M)*p;
end