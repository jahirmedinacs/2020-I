function Cierre(image, radio, name_SE);

threshold = otsuMethod(image);
templateBin = Binarization(image, threshold);
[fEro,cEro] = size(templateBin);

for i=1:fEro
    for j=1:cEro
        matrixErosion(i,j) = 255;
        matrixDilatacion(i,j) = 255;
    end
end

%DILATACION
matrixDilatacion = DilatacionMatriz(templateBin, radio, name_SE);

%EROSION
matrixErosion = ErosionMatriz(matrixDilatacion, radio, name_SE);


imageErosion = uint8(matrixErosion);
imageDilatacion = uint8(matrixDilatacion);
imageBin = uint8(templateBin);

figure
    subplot(1,3,1); imshow(image); title('Imagen Normal.')
    subplot(1,3,2); imshow(imageBin); title('Binarizacion.')    
    subplot(1,3,3); imshow(imageErosion); title('Cierre')
whos image