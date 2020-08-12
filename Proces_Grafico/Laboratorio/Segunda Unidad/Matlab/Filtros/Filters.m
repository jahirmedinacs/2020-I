function Filters(image, radio, name_filter, rank);
%im = imread(image);
%templateGray = double(im)
%[f, c] = size(templateGray);

templateGray = reflect(image, radio);
[f,c] = size(templateGray);

for i=1:f-radio+1
    for j=1:c-radio+1
        matrixEva = templateGray(i:i+radio-1,j:j+radio-1);
        %imageFiltred(i,j) = MethodsFilters(matrixEva, radio, name_filter, rank);
        imageFiltred(i,j) = MethodsEdgeDetention(matrixEva, radio, name_filter, rank);
    end
end

imageFiltred = reduct(imageFiltred, radio);

i = uint8(imageFiltred);

figure
    subplot(1,2,1); imshow(image); title('Imagen Normal.')
    subplot(1,2,2); imshow(i); title(name_filter)
whos image