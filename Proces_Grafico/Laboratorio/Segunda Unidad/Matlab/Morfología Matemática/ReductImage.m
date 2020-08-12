function  output = ReductImage(matrix, radio);
[fTotal,cTotal]=size(matrix);

fMat = fTotal - radio*2;
cMat = cTotal - radio*2;



%for i=1:fTotal
%    for j=1:cTotal
%        if i>radio && i<=fTotal-radio && j>radio && j<=cTotal-radio
%            matrixReduct(i-radio,j-radio) = matrix(i,j);
%        end
%    end
%end

for i=1:fMat
    for j=1:cMat
        matrixReduct(i,j) = matrix(i+radio,j+radio);
    end
end

output = matrixReduct;
