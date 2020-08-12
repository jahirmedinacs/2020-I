function M = RefMatrizKapur(imagen,radio)
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
%METODO KAPUR
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

    