function salida = otsuMethod(image);
im = imread(image);
imD = double(im);
[f,c]=size(imD);
histogram = Histograma(image);

n = f*c;

%frecuencia de cada pixel.
for i=1:255
    f(i) = histogram(i)/n;
end

for i=1:256
    sigma(i) = 0;
end 

for i=1:255
    w1 = 0;
    w2 = 0;
    u1 = 0;
    u2 = 0;
    ut = 0;
    %W1
    for j=1:i
        w1 = w1 + (f(j));
    end
    %U1
    for j=1:i
        u1 = u1 + (j*(f(j)/w1));
    end
    %W2
    for j=i+1:255
        w2 = w2 + (f(j));
    end 
    %U2
    for j=i+1:255
        u2 = u2 + (j*(f(j)/w2));
    end
    
    ut = (w1*u1)+(w2*u2);
    sigma(i) = (w1*(u1-ut)^2)+(w2*(u2-ut)^2);
    pause(1)
    Binarizacion(image,sigma(i));
end

%imB = uint8(sigma);

%figure
    %subplot(1,2,1)
    %imshow(im)
    %title(strcat('Imagen Original:  ',image))
    %subplot(1,2,2)
    %imshow(sigma)
    %title('Otsunado')
salida = histogram;