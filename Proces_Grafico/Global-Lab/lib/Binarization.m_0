function output = Binarization(image,threshold);
template = imread(image);
imD = double(template);
[fBin,cBin]=size(imD);

for i=1:fBin
    for j=1:cBin
        if imD(i,j)<=threshold
            imageBin(i,j) = 0;
        else
            imageBin(i,j) = 255;
        end
    end
end

output = imageBin;
