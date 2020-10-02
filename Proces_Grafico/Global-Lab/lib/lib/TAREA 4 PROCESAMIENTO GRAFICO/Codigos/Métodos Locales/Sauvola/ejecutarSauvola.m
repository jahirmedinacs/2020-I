imagen=imread('cameraman.png');
[a,b,c]=size(imagen);
if c==3
    bin = rgb2gray(imagen);
    imagen = uint8(bin);
end
tic
output=sauvola(imagen,[3 3]);
toc
subplot(1,2,1);
imshow(imagen);
subplot(1,2,2);
imshow(output);