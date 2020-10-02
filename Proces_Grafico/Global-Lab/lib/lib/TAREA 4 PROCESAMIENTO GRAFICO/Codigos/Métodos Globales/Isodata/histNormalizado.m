function hN = histNormalizado(imagen)
img = imread(imagen);
[f,c] = size(img);
h = imhist(img);

[x,y] = size(h);
for i=1:x
    hN(i) = h(i)/(f*c);
end

end