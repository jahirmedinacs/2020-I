function otsu(imagen)
im = imread(imagen);
%bin = rgb2gray(im);
[f,c,d] = size(im);

hN = histNormalizado(imagen);

mayor = -1;
umbral = -1;

for t=1:255
    w1 = 0;
    u1 = 0; u2 = 0;
    for i=1:t
        w1 = w1 + double(hN(i));
    end
    w2 = 1 - w1;
    
    for i=1:t
        c1 = (hN(i)/w1);
        u1 = u1 + c1*i;
    end
    for i=t+1:255
        c2 = (hN(i)/w2);
        u2 = u2 + c2*i;
    end
    ut = w1*u1 + w2*u2;
    
    B = w1*(u1 - ut)^2 + w2*(u2 - ut)^2;
    if(B > mayor)
        mayor = B;
        umbral = t;
    end
end

%BINARIZAR LA IMAGEN

for i=1:f
    for j=1:c
        if im(i,j) <= umbral
            imgbi(i,j) = 0;
        else
            imgbi(i,j) = 255;
        end
    end
end

imb = uint8(imgbi);
figure
    subplot(1,2,1); imshow(im)
    subplot(1,2,2); imshow(imb); title(umbral)
whos im
whos imb
end


