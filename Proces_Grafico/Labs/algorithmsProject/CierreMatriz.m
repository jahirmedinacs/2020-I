function Output = CierreMatriz(templateBin, radio, name_SE, maxIteration);
% CIERRE NECESITA UNA MATRIZ BINARIA
[fEro,cEro] = size(templateBin);

for i=1:fEro
    for j=1:cEro
        matrixErosion(i,j) = 255;
        matrixDilatacion(i,j) = 255;
    end
end

for iteration=1:maxIteration
    %DILATACION
    matrixDilatacion = DilatacionMatriz(templateBin, radio, name_SE);

    %EROSION
    matrixErosion = ErosionMatriz(matrixDilatacion, radio, name_SE);

        templateBin = matrixErosion;
end

Output = matrixErosion;