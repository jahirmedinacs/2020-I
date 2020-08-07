function output = Erosion(templateBin, radio, name_SE, maxIterations);

%templateBin = [  255 255 255 255 255 255 255 255 255 255;
%            255 0 0 0 0 0 0 0 0 255;
%            255 0 0 0 0 0 0 0 0 255;
%            255 0 0 0 0 0 0 0 0 255;
%            255 0 0 0 255 255 255 255 255 255;
%            255 0 0 0 255 255 255 255 255 255;
%            255 0 0 0 0 0 0 0 0 255;
%            255 0 0 0 0 0 0 0 0 255;
%            255 0 0 0 0 0 0 0 0 255;
%            255 255 255 255 255 255 255 255 255 255];


for iteration = 1: maxIterations        
    templateBinR = ReflectImage(templateBin, radio);
    [fEro,cEro]=size(templateBinR);

    radio__ = round(radio/2)-1;

    for i=1:fEro
        for j=1:cEro
            matrixErosion(i,j) = 255;
        end
    end

    if strcmp(name_SE, 'cruz')
       for i=1:fEro-radio
            for j=1:cEro-radio
                matrixEva = templateBinR(i:i+radio-1,j:j+radio-1);
                band = SE_Cross_Erosion(matrixEva,radio);

                if band == true
                    matrixErosion(i+radio__,j+radio__) = 0;
                end
            end
       end
       matrixErosion = ReductImage(matrixErosion,radio);
    elseif strcmp(name_SE, 'cuadrado')
            for i=1:fEro-radio+1
                for j=1:cEro-radio+1
                    matrixEva = templateBinR(i:i+radio-1,j:j+radio-1);
                    band = SE_Square_Erosion(matrixEva,radio);

                    if band == true
                        matrixErosion(i+radio__,j+radio__) = 0;
                    end
                end
            end
            matrixErosion = ReductImage(matrixErosion,radio);
    elseif strcmp(name_SE, 'lineaV')
            for i=1:fEro-radio+1
                for j=1:cEro
                    matrixEva = templateBinR(i:i+radio-1,j:j);            
                    band = SE_VerticalLine_Erosion(matrixEva,radio);

                    if band == true
                        matrixErosion(i+radio__,j) = 0;
                    end

                end
            end    
            matrixErosion = ReductImage(matrixErosion,radio);
    elseif strcmp(name_SE, 'lineaH')
            for i=1:fEro
                for j=1:cEro-radio+1
                    matrixEva = templateBinR(i:i,j:j+radio-1);            
                    band = SE_HorizontalLine_Erosion(matrixEva,radio);

                    if band == true
                        matrixErosion(i,j+radio__) = 0;
                    end

                end
            end
            matrixErosion = ReductImage(matrixErosion,radio);
    end
    templateBin = matrixErosion;
end

output = matrixErosion;