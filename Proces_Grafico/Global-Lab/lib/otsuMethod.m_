function salida = otsuMethod(imD);

[fOtsu,cOtsu]=size(imD);
histogram = Histograma(imD);

n = fOtsu*cOtsu;

%frecuencia de cada pixel.
for i=1:255
    f(i) = histogram(i)/n;
end

mayor = 0;

for i=1:255
    w1 = 0;
    w2 = 0;
    u1 = 0;
    u2 = 0;
    ut = 0;
    sigma = 0;
    %W1
    for j=1:i
        w1 = w1 + (f(j));
    end
    %U1
    for j=1:i
        u1 = u1 + (j*(f(j)/w1));
    end
    %W2
    for j=i+1:255
        w2 = w2 + (f(j));
    end 
    %U2
    for j=i+1:255
        u2 = u2 + (j*(f(j)/w2));
    end
    
    ut = (w1*u1)+(w2*u2);
    sigma = (w1*(u1-ut)^2)+(w2*(u2-ut)^2);
    
    if(mayor < sigma)
        mayor = sigma;
        umbral = i;
        umbral
    end

end

salida = umbral;