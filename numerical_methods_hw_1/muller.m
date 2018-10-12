function [xr,T] = muller(f,xr,h,e)

fx = inline(f); %function inserted as a string converted

%fundamental parameters
x2 = xr;
x1 = xr+h;
x0 = xr-h;

k = 0;
devam = 1;

T=[0 0 0 0 0];  % Matrix that shows x0 - x1 - x2 - x3 - e respectively

while(devam)
    k= k+1;
    
    h0 = x1-x0;
    h1 = x2-x1;
    d0 = (fx(x1) - fx(x0))/h0;
    d1 = (fx(x2)-fx(x1))/h1;
    a = (d1-d0)/(h1+h0);
    b = (a*h1)+d1 ;
    c = fx(x2);
    
 kok= sqrt(b^2-4*a*c);
 if abs(b+kok) > abs(b-kok)
     bol = b+kok;
 else
     bol = b-kok;
 end
 xr=x2+(-2*c/bol);
 devam = abs(xr-x2)/xr > e;
 x0=x1;
 x1=x2;
 x2=xr;
 T(k,:)=[x0 x1 x2 fx(xr) e]
 
end 
 
