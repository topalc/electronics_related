function x = gausseidel(A,B,es)

%Inputs: 

% A = Coefficent Matrix
% B = Right-Hand Side Vector
% es = stop criterion (default = 0.00001%)

%Outputs:
% x = solution vector

[m,n] = size(A);
if m ~= n, error('Matrix A must be square'); end
C = A;

for i=1:n
    C(i,i)=0;
    x(i)=0;
end

x= x';

for i=1:n
    C(i,1:n)=C(i,1:n)/A(i,i);
end

for i=1:n
    d(i)=B(i)/A(i,i);
end

iter = 0;
while(1)
    xold = x;
    fprintf('\n %d. Iteration! \n', iter);
    x
    for i=1:n
        x(i)=d(i)-C(i,:)*x;
        
        if x(i) ~= 0
            ea(i)=abs((x(i)-xold(i))/x(i))*100;
        end
    end
    ea
    iter = iter +1;
    if norm(ea,Inf)<=es break, end
end
for i= 1:length(x)
    fprintf('\nx%d = %f\n', i, x(i)); 
end

