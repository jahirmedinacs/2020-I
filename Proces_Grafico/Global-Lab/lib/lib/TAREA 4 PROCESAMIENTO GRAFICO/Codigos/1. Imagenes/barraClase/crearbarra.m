C0 = ones(1,1);
C85 = 85*(ones(1,2));
C171 = 171*(ones(1,3));
C255 = 255*(ones(1,4));

X= [C0 C85 C171 C255];
X = [X;X;X;X;X;X;X;X;X;X];
Matriz = uint8(X);
imwrite(Matriz,'barra.jpg')
figure
imshow(Matriz)