function output = SE_HorizontalLine_Dilatation(matrixIn, radio, posX, posY);

for i=1:radio
    matrixIn(posX,posY+i-1) = 0;
end

output = matrixIn;