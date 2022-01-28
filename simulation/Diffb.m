function diffb=Diffb(t)
syms u;
b=vocterb(u);
D=diff(b);
u=t;
diffb=eval(D);
