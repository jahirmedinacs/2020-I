function output = SE_Square_Erosion(matrixIn, radio);
aux = round(radio/2);
contSE = (radio*2)-1;
contVer = 0;
band = false;
nSquare = radio*radio;

for i=1:radio
    for j=1:radio
        SE(i,j) = 0;
    end
end

for i=1:radio
    for j=1:radio
        if matrixIn(i,j) == 0 
            contVer = contVer + 1;
        end
    end
end

if contVer == nSquare 
    band = true;
end


output = band;