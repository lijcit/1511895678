
clc;
clear all;
close all;
tic;
format long;

global gamma 
gamma=10;
lambda=[1,5,10,15,20];

 T=10;
 tspan=[0 T];
 x_temp=0;
 [m,n]=size(MatrixA(T));
 tstar=0:0.01:T;
x0=4*(rand(n+m,1)-0.5*ones(n+m,1));

%xp0=zeros(n,1);
%[x0,xp0]=decic(@odefun,0,x0,0,xp0,0);
for j=1:length(lambda)
    [t,x]=ode45(@odefun,tspan,x0,[],lambda(j));
    for i=1:length(t)
        tt=t(i);
        dotx_temp=odefun(tt,x(i,:)',lambda(j));
        dotx(:,i)=dotx_temp(m+1:m+n);
        err(j,i)=norm(MatrixA(tt)*x(i,m+1:m+n)'-vocterb(tt),'fro')+norm(MatrixC(tt)*dotx(:,i)-vocterd(tt),'fro');
    end
end

for i=1:n
    figure (1);set(gca,'FontSize',16);
    subplot(3,3,i);plot(t,x(:,m+i),'LineWidth',2);hold on
end
for i=1:length(lambda)
    figure(2);set(gca,'FontSize',16);
    plot(t,err(i,:),'LineWidth',2); hold on;
end




