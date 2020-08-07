function output = Dilatacion(templateBin, radio, name_SE, maxIteracions);

%templateBin = [  255 255 255 255 255 255 255 255 255 255;
%            255 255 255 255 255 255 255 255 255 255;
%            255 255 0 0 0 0 0 0 255 255;
%            255 255 0 255 255 255 255 255 255 255;
%            255 255 0 255 255 255 255 255 255 255;
%            255 255 0 255 255 255 255 255 255 255;
%            255 255 0 255 255 255 255 255 255 255;
%            255 255 0 0 0 0 0 0 255 255;
%            255 255 255 255 255 255 255 255 255 255;
%            255 255 255 255 255 255 255 255 255 255];

for iteration=1:maxIterations
templateBinR = ReflectImage(templateBin, radio);
[fDil,cDil]=size(templateBinR);

    for i=1:fDil
        for j=1:cDil
            matrixDilated(i,j) = 255;
        end
    end

    if strcmp(name_SE, 'cruz')
       for i=1:fDil
            for j=1:cDil
                if templateBinR(i,j) == 0
                    matrixDilated = SE_Cross_Dilatation(matrixDilated,radio,i,j);
                end
            end
       end
       matrixDilated = ReductImage(matrixDilated,radio);
    elseif strcmp(name_SE, 'cuadrado')
            for i=1:fDil
                for j=1:cDil
                    if templateBinR(i,j) == 0
                        matrixDilated = SE_Square_Dilatation(matrixDilated,radio,i,j);
                    end
                end
            end
            matrixDilated = ReductImage(matrixDilated,radio);
    elseif strcmp(name_SE, 'lineaV')
            for i=1:fDil-radio+1
                for j=1:cDil
                    if templateBinR(i,j) == 0
                        matrixDilated = SE_VerticalLine_Dilatation(matrixDilated,radio,i,j);
                    end
                end
            end    
            matrixDilated = ReductImage(matrixDilated,radio);
    elseif strcmp(name_SE, 'lineaH')
             for i=1:fDil-radio+1
                for j=1:cDil
                    if templateBinR(i,j) == 0
                        matrixDilated = SE_HorizontalLine_Dilatation(matrixDilated,radio,i,j);
                    end
                end
            end    
            matrixDilated = ReductImage(matrixDilated,radio);
    end
    templateBin = matrixDilated;
end


output = matrixDilated;