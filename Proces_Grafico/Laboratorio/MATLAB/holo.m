
f = input('digite la funcion ','s');
sf = sym(f);
ezplot(sf);
tol = input('digite la toleracia del metodo');
x0 = input('digite el valor inicial del metodo');
v = symvar(sf);
f1 = diff(sf);
sw =0;
j=0;
while sw==0
   j=j+1;
   x1 = x0 - (subs(sf,v,x0))/(subs(f1,v,x0));
   if abs(x0-x1)>tol
       x0=x1;
       sw=0;
   else
       sw=1;
       
   end

end
fprintf('%d iteraciones',j)    % # de iteraciones 
vpa(x1)?