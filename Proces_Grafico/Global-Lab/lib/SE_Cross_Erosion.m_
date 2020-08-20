function output = SE_Cross_Erosion(matrixIn, radio);
aux = round(radio/2);
contSE = (radio*2)-1;
contVer = 0;
band = false;

for i=1:radio
    for j=1:radio
        SE(i,j) = 255;
    end
end

for i=1:radio
    SE(aux,i) = 0;
    SE(i,aux) = 0;
end

for i=1:radio
    for j=1:radio
        if matrixIn(i,j) == 0 && SE(i,j) == 0
            contVer = contVer + 1;
        end
    end
end

if contVer == contSE 
    band = true;
end


output = band;
