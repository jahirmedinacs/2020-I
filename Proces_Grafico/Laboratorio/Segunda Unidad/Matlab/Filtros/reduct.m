function  output = reduct(matrix, radio);
[fTotal,cTotal]=size(matrix);

fMat = fTotal - radio*2;
cMat = cTotal - radio*2;

for i=1:fMat
    for j=1:cMat
        matrixReduct(i,j) = matrix(i+radio,j+radio);
    end
end

output = matrixReduct;