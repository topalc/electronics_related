function x = newtonraphson2
% fleft = nonlinear equation's left side.
% fright = nonlinear equation's right side.
% x0 = first guess
% ea = error tolerance
tol = 1e-4; % Or some other tolerance
err = 1000; % Any value larger than tol
x = [0.1; 0.1; -0.1]; % However this is defined.
iter = 1; max_iter = 300; % Or whatever.
while (err > tol)

syms x1 x2 x3

while(1)
   arg =[x(1),x(2),x(3)];
    f = @(x)[3*x(1)-cos(x(2)*x(3))-(1/2), x(1)^2-(81*(x(2)+0.1)^2)+sin(x(3))+(1.06), exp((-x(1)*x(2)))+20*x(3)+(10*pi-3)/3];
    J = @(x)jacobian(f,arg)
    
      delta_x = J(x)\(-f(x)); % Compute x_{n+1}-x_n
    err = norm(delta_x, Inf);
    x = x + delta_x;
    iter = iter + 1;
    [iter x'] % This line simply outputs the current iteration and the solution. You can dress this up by using sprintf if you like.
    if (iter > max_iter)
        disp 'Failed to converge';
        break;
    end
end
end