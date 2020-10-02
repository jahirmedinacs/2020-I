function aGris()
imag = input('Ingrese direccion de la imagen:','s');
name = strcat(imag,'.png');
im = imread(imag);
bin = rgb2gray(im);
Matriz = uint8(bin);
imwrite(Matriz,name)
figure
imshow(Matriz)