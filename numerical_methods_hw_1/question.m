function [y,dy]=question(x)
% The function and its jacobian matrix

n=length(x);
y=zeros(size(x)); %setting up initial values for both y and dy 
dy=zeros(n,n);

y(1)= 3*x(1)-cos(x(2)*x(3))-(1/2);
y(2)= x(1)^2-(81*(x(2)+0.1)^2)+sin(x(3))+(1.06);
y(3)= exp((-x(1)*x(2)))+20*x(3)+(10*pi-3)/3;

% creating jacobian matrix...

dy(1,1)= 3; %dy(1)/dx(1)
dy(1,2)= x(3)*sin(x(3)*x(2)); %dy(1)/dx(2)
dy(1,3)= x(2)*sin(x(3)*x(2)); %dy(1)/dx(3)

dy(2,1)= 2*x(1); %dy(2)/dx(1)
dy(2,2)= -2*81*(x(2)+0.1); %dy(2)/dx(2)
dy(2,3)= cos(x(3)); %dy(2)/dx(3)

dy(3,1)= -x(2)*exp(-x(1)*x(2)); %dy(3)/dx(1)
dy(3,2)= -x(1)*exp(-x(1)*x(2)); %dy(3)/dx(2)
dy(3,3)= 20; %dy(3)/dx(3)