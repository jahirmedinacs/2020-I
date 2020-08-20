function Dilatacion(image, radio, name_SE);
threshold = otsuMethod(image);
templateBin = Binarization(image, threshold);

%templateBin = [  255 255 255 255 255 255 255 255 255 255;
%            255 255 255 255 255 255 255 255 255 255;
%            255 255 0 0 0 0 0 0 255 255;
%            255 255 0 255 255 255 255 255 255 255;
%            255 255 0 255 255 255 255 255 255 255;
%            255 255 0 255 255 255 255 255 255 255;
%            255 255 0 255 255 255 255 255 255 255;
%            255 255 0 0 0 0 0 0 255 255;
%            255 255 255 255 255 255 255 255 255 255;
%            255 255 255 255 255 255 255 255 255 255];

templateBinR = ReflectImage(templateBin, radio);
[fDil,cDil]=size(templateBinR)

for i=1:fDil
    for j=1:cDil
        matrixDilated(i,j) = 255;
    end
end

if strcmp(name_SE, 'cruz')
   for i=1:fDil
        for j=1:cDil
            if templateBinR(i,j) == 0
                matrixDilated = SE_Cross_Dilatation(matrixDilated,radio,i,j);
            end
        end
   end
   matrixDilated = ReductImage(matrixDilated,radio);
elseif strcmp(name_SE, 'cuadrado')
        for i=1:fDil
            for j=1:cDil
                if templateBinR(i,j) == 0
                    matrixDilated = SE_Square_Dilatation(matrixDilated,radio,i,j);
                end
            end
        end
        matrixDilated = ReductImage(matrixDilated,radio);
elseif strcmp(name_SE, 'lineaV')
        for i=1:fDil-radio+1
            for j=1:cDil
                if templateBinR(i,j) == 0
                    matrixDilated = SE_VerticalLine_Dilatation(matrixDilated,radio,i,j);
                end
            end
        end    
        matrixDilated = ReductImage(matrixDilated,radio);
elseif strcmp(name_SE, 'lineaH')
         for i=1:fDil-radio+1
            for j=1:cDil
                if templateBinR(i,j) == 0
                    matrixDilated = SE_HorizontalLine_Dilatation(matrixDilated,radio,i,j);
                end
            end
        end    
        matrixDilated = ReductImage(matrixDilated,radio);
end

imageDilated = uint8(matrixDilated);
imageBin = uint8(templateBin);

figure
    subplot(1,3,1); imshow(image); title('Imagen Normal.')
    subplot(1,3,2); imshow(imageBin); title('Binarizacion.')    
    subplot(1,3,3); imshow(imageDilated); title('Dilatacion.')
whos image