function average = MethodsFilters(matrixIn, radio, name_filter, rank);

sum = 0;

centro = matrixIn(round(radio/2),round(radio/2));

if strcmp(name_filter, 'Promedio Simple')
    for i=1:radio
        for j=1:radio
            sum = sum + matrixIn(i,j);
        end
    end
    
    average = sum/(radio*radio);
elseif strcmp(name_filter, 'Promedio Rango')
    cont = 0;
    
    for i=1:radio
        for j=1:radio
            pixel = matrixIn(i,j);
            if centro-rank<=pixel && pixel<=centro+rank
                sum = sum + pixel;
                cont=cont + 1;
            end
        end
    end
    
    average = sum / cont; 
elseif strcmp(name_filter, 'Promedio Doble')
      for i=1:radio
        for j=1:radio
            sum = sum + matrixIn(i,j);
        end
      end
      
      average = (sum+centro)/10;
elseif strcmp(name_filter, 'Mediana Simple')
    median = ((radio^2)+1)/2;
    index = 1;
    for i=1:radio
        for j=1:radio
            vect(index) = matrixIn(i,j);
            index = index + 1;
        end
    end
    
    vect = sort(vect);
    average = vect(median);
elseif strcmp(name_filter, 'Mediana Cruz')
    index = 1;
    for i=1:radio
        vect(index) = matrixIn(i,(radio-1)/2);
        index = index + 1;
        vect(index) = matrixIn((radio-1)/2,i);
        index = index + 1;
    end
    
    median = (index+1)/2;
    vect = sort(vect);
    average = vect(median);
elseif strcmp(name_filter, 'Mediana Ponderada')
    index = 1;
    matrixP = [1 1 1;
              2 2 2;
              1 1 1];
   
   for i=1:radio
       for j=1:radio
           loop = matrixP(i,j);
           p = 1;
           while p <=loop
               vect(index) = matrixIn(i,j);
               index = index + 1;
               p = p + 1;
           end
       end
   end
   
    median = round(index/2);
    vect = sort(vect);
    average = vect(median);
elseif strcmp(name_filter, 'Realce')
    Gx = [-1/8 -1/8 -1/8;
          -1/8 1 -1/8;
          -1/8 -1/8 -1/8];
      
      Gy = [-1/8 -1/8 -1/8;
            -1/8 1 -1/8;
            -1/8 -1/8 -1/8;];
        
    for i=1:radio
        for j=1:radio
            sum = sum + (matrixIn(i,j)*Gx(i,j));
        end
    end
    
    x = sum;
    sum = 0;
    
    for i=1:radio
        for j=1:radio
            sum = sum + (matrixIn(i,j)*Gy(i,j));
        end
    end
    
    y = sum;
    
    average = round(sqrt(x*x+y*y));
    
    if average > 255
        average = 255;
    end
    
elseif strcmp(name_filter, 'Gaussiano')
    index = 1;
    matrixP = fspecial('gaussian', radio, rank);
   
   for i=1:radio
       for j=1:radio
            sum = sum + (matrixIn(i,j)*matrixP(i,j));
       end
   end
   
   average = sum;
   
end

    
