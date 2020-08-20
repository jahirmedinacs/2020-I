function y = Binarizacion(imagen,umbral);
im=imread(imagen);
imD=double(im);
[f,c]=size(imD)
for i=1:f
    for j=1:c
        if imD(i,j)<=umbral
            nuevaI(i,j) = 0;
        else
            nuevaI(i,j) = 255;
        end
    end
end
imB = uint8(nuevaI);
imshow(imB);
y = nuevaI; 