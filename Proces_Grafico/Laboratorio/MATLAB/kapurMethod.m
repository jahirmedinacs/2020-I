function salida = kapurMethod(image);
im = imread(image);
imD = double(im);
[f,c]=size(imD);

n=f*c;

histogram = Histograma(image);

%frecuencia de cada pixel.
for i=1:255
    f(i) = histogram(i)/n;
end
mayor = 0;
%{
for i=1:254
    pj = 0;
    pi = 0;
    entropiaW = 0;
    entropiaB = 0;
    entropiaT = 0;
    disp('-------------------------------------------------');
    for j=1:i
        %pAFondo = pAFondo + f(j);
        for k=1:i
           pj = pj + histogram(k); 
        end
        entropiaW = -1*(histogram(j)/pj)*(log(histogram(j)/pj));
    end 
    
    pj = 0;
    for j=i+1:254
        %pAObjeto = pAObjeto + f(j);
        for k=i+1:254
           pj = pj + histogram(k); 
        end
        pj = 1 - pj;
        entropiaB = -1*(histogram(j)/pj)*(log(histogram(j)/pj))
    end
    entropiaT = entropiaW + entropiaB;
    if(mayor > entropiaT)
        mayor = entropiaT;
        disp('oooooooooooooooooooooooooooooooooooooooo');
    end
    %Binarizacion(image,entropiaT);
end
%}

for i=1:254
    pj = 0;
    pi = 0;
    entropiaW = 0;
    entropiaB = 0;
    entropiaT = 0;
    disp('-------------------------------------------------');
    for j=1:i
        for k=1:i
           pj = pj + histogram(k); 
        end
        entropiaW = -1*(f(j)/pj)*(log(f(j)/pj));
    end 
    
    pj = 0;
    for j=i+1:254
        for k=i+1:255
           pj = pj + histogram(k); 
        end
        entropiaB = -1*(f(j)/pj)*(log(f(j)/pj));
    end
    entropiaT = entropiaW + entropiaB

    %Binarizacion(image,entropiaT);
end

salida = mayor;
