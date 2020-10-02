n = input('ingrese numero: ');
if n==256
    pixel = 16;
else
    if n==512
        pixel = 32;
    
    else
        disp('pixel no determinado')
        break;
    end
end

D=255*[zeros(pixel/2,pixel/2) zeros(pixel/2,pixel/2) ones(pixel/2,pixel/2);
       zeros(pixel/2,pixel/2) ones(pixel/2,pixel/2) zeros(pixel/2,pixel/2);
       ones(pixel/2,pixel/2) zeros(pixel/2,pixel/2) zeros(pixel/2,pixel/2)];
Aux = D;
D =[D flip(D,2);flip(D,1) flip(D,3)];
D = repmat(D,5);
tam = min(size(D));
for i=tam+1:n
    for j=tam+1:n
        D(i,j)=1;
    end
end

for i=1:n/2
    for j=1:n
        X(i,j)=255 - 255*j/i + D(i,j);
    end
end

for i=1:n/2
    for j=1:n/2
        Aux(i,j) = X(i,j);
    end
end
Aux = triu(Aux);
for i=1:n/2
    for j=1:n/2
        X(i,j) = Aux(i,j);
    end
end
X =[X ; flip(X,1)];

Matriz = uint8(X);
imwrite(Matriz,'MiImagen.jpg')
figure
imshow(Matriz)