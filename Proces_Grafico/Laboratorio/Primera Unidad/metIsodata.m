function metIsodata(imagen)
im = imread(imagen);
imD = double(im); 
[f c] = size(imD);

h = zeros(1,256); 
hn = zeros(1,256);
for i=1:f
    for j=1:c
        k = imD(i,j);
        h(k+1) = h(k+1)+1;
    end
end;
hn = h/(f*c);

u = zeros(1,256);

for i=1:256
    u(i) = isodata(i,hn);  
end

i = 2;
while (abs(u(i)-u(i-1)) >= 1 || u(i)==1)
    i = i+1;   
end

umbral = u(i);

for i=1:f
    for j=1:c
        if imD(i,j) <= umbral
            imD(i, j) = 0;
        else
            imD(i, j) = 255;
        end
    end
end

imb = uint8(imD);
figure
    subplot(1,2,1); imshow(im)
    subplot(1,2,2); imshow(imb); title(umbral)
whos im



