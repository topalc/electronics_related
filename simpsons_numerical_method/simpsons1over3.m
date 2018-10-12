function I = simpsons1over3(f,a,b,n)
% This function computes the integral "I" via Simpson's rule in the interval [a,b] with n+1 equally spaced points
    h=(b-a)/n; xi=a:h:b;
    I= h/3*(f(xi(1))+2*sum(f(xi(3:2:end-2)))+4*sum(f(xi(2:2:end)))+f(xi(end)));
end