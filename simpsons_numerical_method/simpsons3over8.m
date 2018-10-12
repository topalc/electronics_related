function I = simpsons3over8(f,a,b,n)


h=(b-a)/n;
x=a+h;
integ=f(a)+f(b);
i=1;
while (x<b)
    if (i<=2)
        integ=integ+3*f(x);
        i=i+1;
    else
        integ=integ+2*f(x);
        i=1;
    end
    x=x+h;
end
integ=integ*3*h/8;
I = integ;
end