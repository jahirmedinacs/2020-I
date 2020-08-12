function M = RefMatrizIsofata(imagen,radio)
im=imread(imagen);
imagenNormal = double(im);
imaux = imagenNormal;
M = imagenNormal;
[fr,cr] = size(im);
%primero reflejamos las filas superiores
for i=1 : radio
    F  = imaux(i,:);
    M  = [F;M];%le agrego una fila mas 
end
%reflejamos las filas inferiores
cont = 0;
i = fr;
while cont<radio %iremos retrocediendo
    F = imaux(i,:);
    M = [M;F];
    cont = cont+1;
    i = i-1;
end
imaux = M; %ahora actualizamos la matriz auxiliar
%ahora reflejamos las columnas 
for i=1 : radio
    C = imaux(:,i);
    M = [C M];
end
cont = 0;
i = cr;
while cont<radio
    C = imaux(:,i);
    M = [M C];
    cont = cont+1;
    i = i-1;
end 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%METODO ISODATA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imagenReflejada = M;
[f,c]=size(imagenReflejada);

for genF=1:fr
    for genC=1:cr
        mayor = -1;
        umbral = 0;
%HISTOGRAMA NORMALIZADO%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        h = zeros(1, 256);
        hn = zeros(1,256);
        for i=1:radio
            for j=1:radio
                k = imagenReflejada(i+genF,j+genC);
                h(k+1) = h(k+1)+1;
            end
        end

        hn = h/(radio*radio);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        u = zeros(1,256);
        
        for i=1:256
            u(i) = isodata(i, hn);  
        end

        i=2;
        while ((abs(u(i)-u(i-1)) >= 1 || u(i)==1) && (i>256))
            i = i+1;   
        end

        umbral = u(i);

        if imagenNormal(genF,genC) <= umbral
           imagenNormal(genF, genC) = 0;
        else
           imagenNormal(genF, genC) = 255;
        end
    end
end


imb = uint8(imagenNormal);
figure
    subplot(1,2,1); imshow(im)
    subplot(1,2,2); imshow(imb); title(umbral)
whos im

    