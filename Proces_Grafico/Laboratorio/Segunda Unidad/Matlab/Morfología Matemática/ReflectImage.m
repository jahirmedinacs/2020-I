function  output = ReflectImage(matrix, radio);
[fMat,cMat]=size(matrix);

fTotal = fMat + 2 * radio;
cTotal = cMat + 2 * radio;

for i=1:fTotal
    for j=1:cTotal
        if i>radio && i<=fTotal-radio && j>radio && j<=cTotal-radio
            matrixReflect(i,j) = matrix(i-radio,j-radio);
        else 
            matrixReflect(i,j) = 255;
        end
    end
end

output = matrixReflect;
