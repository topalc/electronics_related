function x0= newton(f,x0,es)
%Performs Newton's for the function defined in f starting with x0 and...
%...running maximum of 100 times.

[y,dy]=f(x0);       % x0 values inserted at f function, which gives y and
                    % dy as outputs.
n=length(x0);       

i=1;

while i<100
  s= -(dy)\y;       % x1=x0-(J^-1)*F   Newton-Raphson's Method
  err = norm(s, Inf);       % x1-x0 = -(J^-1)*F = error
  x1=x0+s;
  x0=x1;            % assigned for iteration
  [y,dy]=f(x0);     % new x0 inserted to f function
  
  fprintf('%d. Iteration!\n',i);
  
  x0  
  
  y
   
  err  
 
 i=i+1;
  
 if err <= es break,
 
 end
end

