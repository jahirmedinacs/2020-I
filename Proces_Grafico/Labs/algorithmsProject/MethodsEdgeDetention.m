function average = MethodsEdgeDetention(matrixIn, radio, name_Operator, rank);

if strcmp(name_Operator,'Operador Roberts')
    
    sumX = 0;
    sumY = 0;
     Gy = [0 0 0;
           0 0 1;
           0 -1 0];
      
      Gx = [-1 0 0;
            0 1 0;
            0 0 0];
        
      for i=1:radio
          for j=1:radio
              sumX = sumX + (matrixIn(i,j)*Gx(i,j));
          end
      end
      
      for i=1:radio
          for j=1:radio
              sumY = sumY + (matrixIn(i,j)*Gy(i,j));
          end
      end
      
      average = round(sqrt((sumX*sumX)+(sumY*sumY)));
      
elseif strcmp(name_Operator,'Operador Prewitt')
    sumX = 0;
    sumY = 0;
     Gy = [-1 0 1;
           -1 0 1;
           -1 0 1];
      
      Gx = [-1 -1 -1;
            0 0 0;
            1 1 1];
        
      for i=1:radio
          for j=1:radio
              sumX = sumX + (matrixIn(i,j)*Gx(i,j));
          end
      end
      
      for i=1:radio
          for j=1:radio
              sumY = sumY + (matrixIn(i,j)*Gy(i,j));
          end
      end
      
      average = round(sqrt((sumX*sumX)+(sumY*sumY)));
elseif strcmp(name_Operator,'Operador Sobel')
    sumX = 0;
    sumY = 0;
     Gy = [-1 0 1;
           -2 0 2;
           -1 0 1];
      
      Gx = [-1 -2 -1;
            0 0 0;
            1 2 1];
        
      for i=1:radio
          for j=1:radio
              sumX = sumX + (matrixIn(i,j)*Gx(i,j));
          end
      end
      
      for i=1:radio
          for j=1:radio
              sumY = sumY + (matrixIn(i,j)*Gy(i,j));
          end
      end
      
      average = round(sqrt((sumX*sumX)+(sumY*sumY)));
      if average > 255
        average = 255;
    end
elseif strcmp(name_Operator,'Operador Laplaciano')
    sum = 0;
    
     v = fspecial('laplacian', 0.5);

      for i=1:radio
          for j=1:radio
              sum = sum + (matrixIn(i,j)*v(i,j));
          end
      end
      
      average = sum;
elseif strcmp(name_Operator,'Operador LOG')
    sum = 0;
    
     v = fspecial('log', radio, rank);

      for i=1:radio
          for j=1:radio
              sum = sum + (matrixIn(i,j)*v(i,j));
          end
      end
      
      average = sum/9;
    
elseif strcmp(name_Operator,'Operador Kirsch')
    sum = 0;
    if rank == 0
        mK = [-1 -1 -1;
               0 0 0;
               1 1 1];
    elseif rank == 45
        mK = [-1 -1 0;
              -1 0 1;
               0 1 1];
    elseif rank == 90
        mK = [-1 0 1;
              -1 0 1;
              -1 0 1];
    elseif rank == 135
        mK = [0 1 1;
              -1 0 1;
              -1 -1 0];
    end 
    
    for i=1:radio
          for j=1:radio
              sum = sum + (matrixIn(i,j)*mK(i,j));
          end
    end
      
    average = sum;
end