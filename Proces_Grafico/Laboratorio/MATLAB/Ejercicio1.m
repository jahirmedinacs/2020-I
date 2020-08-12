function y=biseccion(fun,a,b,tol)
u=subs(fun,a);
v=subs(fun,b);
if sign(u)==sign(v)
    disp('Error, no tiene solucion por este metodo')
    return
end
while (b-a)/2>tol
    c=(a+b)/2;
    w=subs(fun,c)
    if sign(u)==sign(w)
       a=c;
       u=w;
    else
        b=c;
        v=w;
    end
end
c
        
    