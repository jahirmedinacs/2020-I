function output = EcuaHistograma(matrixIn, maxIteration);

[f,c] = size(matrixIn);

for it = 1: maxIteration   
    sum = 0;
    
    for i=1:f
        for j=1:c
            matrixSalida(i,j) = 255;
        end
    end
    
   histogram = Histograma(matrixIn);
   

    for i=1:256
        if histogram(i) ~= 0
            matrixPR(i) = histogram(i)/(f*c);
        else 
            matrixPR(i) = 0;
        end
        
    end
    

    for i=1:256
        sum = sum + matrixPR(i);
        matrixS(i) = round(255*sum);
    end
    
    for i=1:f
        for j=1:c
            new = matrixS(matrixIn(i,j)+1);
            matrixSalida(i,j) = new;
        end
    end
    
    matrixIn = matrixSalida;
end
    
output = matrixSalida;