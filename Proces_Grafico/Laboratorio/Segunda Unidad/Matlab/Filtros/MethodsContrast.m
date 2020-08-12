function MethodsContrast(image, name_filter);

imageIn = imread(image);
matrixIn = double(imageIn);
[f,c] = size(matrixIn);

if strcmp(name_filter, 'Ecualizacion Histograma');
    sum = 0;
    
    for i=1:f
        for j=1:c
            matrixSalida(i,j) = 255;
        end
    end
    
   histogram = Histograma(matrixIn);
    
    for i=1:256
        if histogram(i) ~= 0
            matrixPR(i) = histogram(i)/(f*c);
        else 
            matrixPR(i) = 0;
        end
    end
    
    for i=1:256
        sum = sum + matrixPR(i);
        matrixS(i) = round(255*sum);
    end
    
    for i=1:f
        for j=1:c
            new = matrixS(matrixIn(i,j)+1);
            matrixSalida(i,j) = new;
        end
    end
    
    histogram2 = Histograma(matrixSalida);
end

imageEcualizada = uint8(matrixSalida);


figure
    subplot(2,2,1); imshow(image); title('Imagen Normal.')
    subplot(2,2,2); plot(histogram); title('Histograma Normal')
    subplot(2,2,3); imshow(imageEcualizada); title(name_filter)
    subplot(2,2,4); plot(histogram2); title('Histograma Ecualizado')
whos image