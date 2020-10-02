function hN = histNormalizado(imagen)
img = imread(imagen);
[f,c,d] = size(img);
if d>1
    I = rgb2gray(img);
    h = imhist(I);
else
    h = imhist(img);
end

[x,y] = size(h);
for i=1:x
    hN(i) = h(i)/(f*c);
end

end