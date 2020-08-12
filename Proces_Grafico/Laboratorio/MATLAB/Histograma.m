function hist=Histograma ()
imagen = 'gato.jpg';
im = imread(imagen);
imD = double(im);
[f,c]=size(imD);
 
for i=1:256
    h(i) = 0;
end
 
for i=1:f
       for j=1:c
           k = imD(i,j);
           h(k+1) = h(k+1)+1;
       end
end
plot(h);
hist = h; 