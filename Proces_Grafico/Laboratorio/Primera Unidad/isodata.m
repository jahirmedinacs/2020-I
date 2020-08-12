function salida = isodata(t,h)

hP = zeros(1,256);

for j = 1:256
     hP(j) = h(j)*(j);
end

shN = 0;
shP = 0;
shNL = 0;
shPL = 0;

for i = 1:t
   shN = shN + h(i);
   shP = shP + hP(i);
end

for i = t+1:256
   shNL = shNL + h(i);
   shPL = shPL + hP(i);
end

if (shN == 0||shNL == 0)
    uj = 1;
else    
    uj = ((shP/shN) + (shPL/shNL))/2;
end

salida = uj;






 