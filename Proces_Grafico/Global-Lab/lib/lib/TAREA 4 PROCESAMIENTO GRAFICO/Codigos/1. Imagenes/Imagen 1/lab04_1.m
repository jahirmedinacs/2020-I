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

D=255*[ones(pixel/2,pixel/2) ones(pixel/2,pixel/2);
    ones(pixel/2,pixel/2) ones(pixel/2,pixel/2)];
B = repmat(D,n/pixel);

B = pintar(5,11,0,1,B,pixel,0);
B = pintar(3,5,1,2,B,pixel,0);
B = pintar(2,3,2,3,B,pixel,0);
B = pintar(1,2,3,5,B,pixel,0);
B = pintar(0,1,5,8,B,pixel,0);
B = pintar(11,12,1,4,B,pixel,0);
B = pintar(12,14,2,3,B,pixel,0);
B = pintar(14,15,3,4,B,pixel,0);
B = pintar(15,16,4,8,B,pixel,0);
B = pintar(10,11,4,8,B,pixel,0);
B = pintar(11,13,6,7,B,pixel,0);

for i=1:n
    for j=1:n/2
        A(i,j)=B(i,j);
    end
end

%Gris oscuro
A = pintar(1,2,5,8,A,pixel,50);
A = pintar(5,7,1,2,A,pixel,50);
A = pintar(10,11,2,4,A,pixel,50);
A = pintar(9,10,3,8,A,pixel,50);
A = pintar(8,9,3,6,A,pixel,100);
A = pintar(5,8,2,3,A,pixel,100);
A = pintar(2,3,5,8,A,pixel,100);
A = pintar(3,4,5,8,A,pixel,150);
A = pintar(5,8,3,4,A,pixel,150);

ReflejoA = flip(A,2);
Final = [A ReflejoA];
Matriz = uint8(Final);
imwrite(Matriz,'Honguito.jpg')
figure
imshow(Matriz)