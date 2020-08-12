function output = SE_VerticalLine_Dilatation(matrixIn, radio, posX, posY);

for i=1:radio
    matrixIn(i+posX-1,posY) = 0;
end
output = matrixIn;