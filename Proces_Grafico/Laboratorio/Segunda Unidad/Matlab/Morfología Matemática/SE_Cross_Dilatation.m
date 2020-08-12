function output = SE_Cross_Dilatation(matrix, radio, posX, posY);
radio__ = round(radio/2)-1;

for i=1:radio
    for j=1:radio
        SE(i,j) = 255;
    end
end

freeSquares = radio - radio__;
minX = posX - freeSquares;
minY = posY - freeSquares;

for i=1:radio
    matrix(i+minX,posY) = 0; %horizontal
    matrix(posX,i+minY) = 0; %vertical
end

output = matrix;
