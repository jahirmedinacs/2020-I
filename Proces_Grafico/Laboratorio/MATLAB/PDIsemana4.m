
%im=imread('plate.png');
%imshow(im)
%figure,imhist(im)

function histograma=PDIsemana4()
imagen = 'plate.png';
im = imread(imagen);
numImagen = double(im);
[l,a]=size(numImagen);
 
for i=1:256
    h(i) = 0;
end
 
for i=1:l
       for j=1:a
           k = numImagen(i,j);
           h(k+1) = h(k+1)+1;
       end
end

figure
    subplot(1,2,1)
    imshow(im)
    title(strcat('Imagen Original:  ',imagen))
    subplot(1,2,2)
    plot(h);
    title('HISTOGRAMA ABSOLUTO')

    
histograma = h; 