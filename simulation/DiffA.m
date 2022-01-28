function output=DiffA(t)
syms u; A=MatrixA(u);
D=diff(A); 
u=t;
output=eval(D);
% output=[sin(2*t) cos(2*t);cos(2*t) -sin(2*t)];