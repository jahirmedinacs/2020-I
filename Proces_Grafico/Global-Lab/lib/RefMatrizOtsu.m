function M = RefMatrizOtsu(imagen,radio)
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
%METODO OTSU
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

        for i=1:255
            w1 = 0;
            w2 = 0;
            u1 = 0;
            u2 = 0;
            ut = 0;
            sigma = 0;
            %W1
            for j=1:i
                w1 = w1 + (hn(j));
            end
            %U1
            for j=1:i
                u1 = u1 + (j*(hn(j)/w1));
            end
            %W2
            for j=i+1:255
                w2 = w2 + (hn(j));
            end 
            %U2
            for j=i+1:255
                u2 = u2 + (j*(hn(j)/w2));
            end

            ut = (w1*u1)+(w2*u2);
            sigma = (w1*(u1-ut)^2)+(w2*(u2-ut)^2);

            if(mayor < sigma)
                mayor = sigma;
                umbral = i;
            end

        end

        if imagenNormal(genF,genC) <= umbral
           imagenNormal(genF, genC) = 0;
        else
           imagenNormal(genF, genC) = 255;
        end
    end
end


imb = uint8(imagenNormal);
imbR = uint8(imagenReflejada);
figure
    subplot(1,3,1); imshow(im)
    subplot(1,3,2); imshow(imbR)
    subplot(1,3,3); imshow(imb); title(umbral)
    
whos im