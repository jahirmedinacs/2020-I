function Output = AperturaMatriz(templateBin, radio, name_SE, maxIteration);
% APERTURA NECESITA UNA MATRIZ BINARIZADA
[fEro,cEro]=size(templateBin);

for i=1:fEro
    for j=1:cEro
        matrixErosion(i,j) = 255;
        matrixDilatacion(i,j) = 255;
    end
end

for iteration=1:maxIteration
    %EROSION
    matrixErosion = ErosionMatriz(templateBin, radio, name_SE);

    %DILATACION
    matrixDilatacion = DilatacionMatriz(matrixErosion, radio, name_SE);
    
    templateBin = matrixDilatacion;
end

Output = matrixDilatacion;