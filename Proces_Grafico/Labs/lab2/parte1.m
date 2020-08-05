paisaje = imread('../imgs/lake.png');
cosa = imread('../imgs/coins.png');
persona = imread('../imgs/lena.png');
animal = imread('../imgs/mandril.png');
libre = imread('../imgs/jetplane.png');
cosa2 = imread('../imgs/house.png');
comida = imread('../imgs/rice.png');
persona2 = imread('../imgs/cameraman.png');
libre2 = imread('../imgs/boat.png');
comida2 = imread('../imgs/peppers.png');


figure
subplot(3,4,1), imshow(paisaje);
subplot(3,4,2), imshow(cosa);
subplot(3,4,3), imshow(persona);
subplot(3,4,4), imshow(animal);
subplot(3,4,5), imshow(libre);
subplot(3,4,6), imshow(persona);
subplot(3,4,7), imshow(comida);
subplot(3,4,8), imshow(persona2);
subplot(3,4,9), imshow(libre2);
subplot(3,4,11), imshow(comida2);   
