
%im=imread('plate.png');
%imshow(im)
%figure,imhist(im)

function histograma=PDIsemana5()
imagen = 'plate.png';
im = imread(imagen);
numImagen = double(im);
[l,a]=size(numImagen);


figure
    subplot(1,2,1)
    imshow(im)
    title(strcat('Imagen Original:  ',imagen))
    subplot(1,2,2)
    imshow(im);
    title('HISTOGRAMA ABSOLUTO')

    
histograma = h; 