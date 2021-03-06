function ruidos()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im = imread('PNG\coins.png');
imRuido = imnoise(im, 'salt & pepper', 0.1);
imwrite(imRuido, 'PNGruido\coins10.png');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im = imread('PNG\coins.png');
imRuido = imnoise(im, 'salt & pepper', 0.2);
imwrite(imRuido, 'PNGruido\coins20.png');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im = imread('PNG\coins.png');
imRuido = imnoise(im, 'salt & pepper', 0.3);
imwrite(imRuido, 'PNGruido\coins30.png');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im = imread('PNG\text.png');
imRuido = imnoise(im, 'salt & pepper', 0.3);
imwrite(imRuido, 'PNGruido\text30.png');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im = imread('PNG\lena.png');
imRuido = imnoise(im, 'gaussian');
imwrite(imRuido, 'PNGruido\lena1G.png');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im = imread('PNG\lena.png');
imRuido = imnoise(im, 'salt & pepper', 0.3);
imwrite(imRuido, 'PNGruido\lena30.png');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im = imread('PNG\peppers.png');
imRuido = imnoise(im, 'salt & pepper', 0.3);
imwrite(imRuido, 'PNGruido\peppers30.png');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im = imread('PNG\peppers.png');
imRuido = imnoise(im, 'gaussian');
imwrite(imRuido, 'PNGruido\peppers1G.png');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im = imread('PNG\lena.png');
imRuido = imnoise(im, 'gaussian');
imRuido = imnoise(imRuido, 'gaussian');
imRuido = imnoise(imRuido, 'gaussian');
imwrite(imRuido, 'PNGruido\lena3G.png');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%