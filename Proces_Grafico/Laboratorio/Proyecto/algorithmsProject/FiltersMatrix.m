function Output = FiltersMatrix(templateGray, radio, name_filter, rank, iterations);

[f, c] = size(templateGray);

for m=1:iterations
    for i=1:f-radio+1
        for j=1:c-radio+1
            matrixEva = templateGray(i:i+radio-1,j:j+radio-1);
            imageFiltred(i,j) = MethodsFilters(matrixEva, radio, name_filter, rank);
        end
    end
    
    for i=1:f-radio+1
        for j=1:c-radio+1
            templateGray(i,j) = imageFiltred(i,j);
        end
    end
end

Output = imageFiltred;