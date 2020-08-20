function Apertura(image, radio, name_SE);

threshold = otsuMethod(image);
templateBin = Binarization(image, threshold);
[fEro,cEro]=size(templateBin);

for i=1:fEro
    for j=1:cEro
        matrixErosion(i,j) = 255;
        matrixDilatacion(i,j) = 255;
    end
end

%EROSION
matrixErosion = ErosionMatriz(templateBin, radio, name_SE);

%DILATACION
matrixDilatacion = DilatacionMatriz(matrixErosion, radio, name_SE);

imageErosion = uint8(matrixErosion);
imageDilatacion = uint8(matrixDilatacion);
imageBin = uint8(templateBin);

figure
    subplot(1,4,1); imshow(image); title('Imagen Normal.')
    subplot(1,4,2); imshow(imageBin); title('Binarizacion.')    
    subplot(1,4,3); imshow(imageErosion); title('Erosion')
    subplot(1,4,4); imshow(imageDilatacion); title('Dilatacion')
whos image