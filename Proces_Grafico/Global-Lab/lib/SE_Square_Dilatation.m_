function output = SE_Square_Dilatation(matrix, radio, posX, posY);
radio__ = round(radio/2)-1;

minX = posX - radio__;
minY = posY - radio__;

for i = 1 : radio
    for j = 1 : radio
        matrix(minX + i-1,minY + j-1) = 0;
    end
end

output = matrix;