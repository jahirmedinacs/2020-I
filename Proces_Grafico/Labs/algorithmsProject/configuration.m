function configuration();

image = 'E:\Mis Archivos\procesamiento grafico\Proyecto\Project_Images\image3.png'
im = imread(image);
templateGray = double(im);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CODE OF CONFIGURATIONS 
%Matrix1 = FiltersMatrix(templateGray, 5, 'Mediana Simple', 0, 5);

MatrixFinal = EcuaHistograma(templateGray, 1);
MatrixFinal = GrayToBin(MatrixFinal);
MatrixFinal = FiltersMatrixEdge(MatrixFinal, 3, 'Operador Sobel', 0, 1);
MatrixFinal = FiltersMatrix(MatrixFinal,3,'Realce', 0, 1);
MatrixFinal = CierreMatriz(MatrixFinal,3,'cruz',4);


i = uint8(MatrixFinal);

imwrite(i, 'E:\Mis Archivos\procesamiento grafico\Proyecto\Images_Process\out_image3.png');

    figure
        subplot(1,2,1); imshow(image); title('Imagen Normal.')
        subplot(1,2,2); imshow(i); title('Salidex')
    whos image

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%