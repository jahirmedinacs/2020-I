function output = SE_HorizontalLine_Erosion(matrixIn, radio);
contVer = 0;
band = false;

for j=1:radio
    if matrixIn(1,j) == 0
       contVer = contVer + 1;
    end
end


if contVer == radio 
    band = true;
end


output = band;