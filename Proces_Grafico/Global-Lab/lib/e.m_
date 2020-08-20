function e(image);
threshold = otsuMethod(image);
templateBin = Binarization(image, threshold);

matrix1 = DilatacionMatriz(templateBin, 3, 'cruz');
matrixfinal = DilatacionMatriz(matrix1, 3, 'cruz');

image1 = uint8(matrix1);
imageFinal = uint8(matrixfinal);

figure
    subplot(1,3,1); imshow(image); title('Imagen Normal.')
    subplot(1,3,2); imshow(image1); title('Dilatacion N°1.')    
    subplot(1,3,3); imshow(imageFinal); title('Dilatacion N°2.')
whos image


