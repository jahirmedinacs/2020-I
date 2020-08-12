function salida = kapurMethod(image);
im = imread(image);
imD = double(im);
[f,c]=size(imD);
mayor = 0;
n=f*c;

histogram = Histograma(image);

%frecuencia de cada pixel.
for i=1:255
    p(i) = histogram(i)/n;
end

for i=1:255
    pt = 0;
    eObjeto = 0;
    eFondo = 0;
    entropiaT = 0;
    %CALCULO PARA EL OBJETO
    for j=1:i
        pt = pt + p(j); 
    end
        
    for j=1:i
        aux = p(j)/pt;
        eObjeto = eObjeto + (-(aux)*(log(aux + 1e-64)));
    end 
    
    %CALCULO PARA EL FONDO
    pt = 0;
    for j=i+1:255
        pt = pt + p(j); 
    end
        
    for j=i+1:255
        aux = p(j)/pt;
        eFondo = eFondo + (-(aux)*(log(aux + 1e-64)));
    end
    
    entropiaT = eObjeto + eFondo;
    if (entropiaT > mayor )
        mayor = entropiaT;
    end
    
    %Binarizacion(image,entropiaT);
end
Binarizacion(image,entropiaT);
salida = mayor;

