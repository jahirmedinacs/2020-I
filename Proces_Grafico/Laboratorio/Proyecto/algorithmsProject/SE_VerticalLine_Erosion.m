function output = SE_VerticalLine_Erosion(matrixIn, radio);
contVer = 0;
band = false;

for j=1:radio
    if matrixIn(j,(radio+1)/2) == 0
       contVer = contVer + 1;
    end
end


if contVer == radio 
    band = true;
end


output = band;