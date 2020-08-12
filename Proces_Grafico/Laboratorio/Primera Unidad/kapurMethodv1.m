function salida = kapurMethod();
im = imread('plate.png');
imD = double(im);
[f,c]=size(imD);
mayor = -1;
umbral = 0;

%HISTOGRAMA NORMALIZADO%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h = zeros(1, 256);
for i=1:f
    for j=1:c
        k = imD(i,j);
        h(k+1) = h(k+1)+1;
    end
end

hn = h/(f*c);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for t=1:256
    pt = 0;
    pr = 0;
    s1 = 0;
    s2 = 0;
    eObjeto = 0;
    eFondo = 0;
    entropiaT = 0;
    %CALCULO PARA EL OBJETO
    for j=1:t
        pt = pt + hn(j);
    end 
    for i=1:t
        if pt~=0
            s1 = hn(i)/pt;
        end
        if s1~=0
            eObjeto = eObjeto + (s1)*log2(s1);
        end
    end
    %CALCULO PARA EL FONDO
    pr = 1 - pt;
    for i=t+1:256
        if pr~=0 && pt~=0
            s2 = hn(i)/pr;
        end
        if s2~=0
            eFondo = eFondo + (s2)*log2(s2);
        end
    end
    
    entropiaT = -eObjeto + -eFondo;
    if (entropiaT > mayor )
        mayor = entropiaT;
        umbral = t-1;
    end
    
    %Binarizacion(image,entropiaT);
end
%Binarizacion(image,entropiaT);
%salida = mayor;

for i=1:f
    for j=1:c
        if imD(i,j) <= umbral
            imgbi(i, j) = 0;
        else
            imgbi(i, j) = 255;
        end
    end
end

imb = uint8(imgbi);
figure
    subplot(1,2,1); imshow(im)
    subplot(1,2,2); imshow(imb); title(umbral)
whos im

