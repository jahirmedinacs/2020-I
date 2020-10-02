%pkg load image

% Elemento estructural : Circulo, a mayor tamano se nota la
%	circunferencia

demo_size = 3
subplot(1,2,1); imshow(gen_struct(demo_size,5));
subplot(1,2,2); imshow(gen_struct(demo_size,6));

demo_size = 9
subplot(1,2,1); imshow(gen_struct(demo_size,5));
subplot(1,2,2); imshow(gen_struct(demo_size,6));

demo_size = 17
subplot(1,2,1); imshow(gen_struct(demo_size,5));
subplot(1,2,2); imshow(gen_struct(demo_size,6));

demo_size = 21
subplot(1,2,1); imshow(gen_struct(demo_size,5));
subplot(1,2,2); imshow(gen_struct(demo_size,6));

% Demostracion Basica, Basada en los casos de las
% 	diapositivas.

debug_DIL_STRUC = [0 1 0; 1 1 1; 0 1 0];
subplot(1,3,1); imshow(debug_DIL_STRUC);

debug_DIL = zeros(10,10);
debug_DIL(3,4:7) = 1;
debug_DIL(3:8,4) = 1;
debug_DIL(8,4:7) = 1;

subplot(1,3,2); imshow(debug_DIL); title("Dilatacion");

debug_DIL = padding(debug_DIL, 2, size(debug_DIL_STRUC));
debug_DIL_RE = morphologic_converter(debug_DIL, 1, debug_DIL_STRUC, false);
subplot(1,3,3); imshow(debug_DIL_RE);

%%%

debug_ERO_STRUC = [0 1 0; 1 1 1; 0 1 0];
subplot(1,3,1); imshow(debug_ERO_STRUC); title("Erosion");

debug_ERO = zeros(10,10);
debug_ERO(3,4:6) = 1;
debug_ERO(4:6,3:7) = 1;
debug_ERO(7,4:6) = 1;

subplot(1,3,2); imshow(debug_ERO);

debug_ERO = padding(debug_ERO, 2, size(debug_ERO_STRUC));
debug_ERO_RE = morphologic_converter(debug_ERO, 2, debug_ERO_STRUC, false);
subplot(1,3,3); imshow(debug_ERO_RE);

% Morfologia con imagenes binarizadas y escala de grises,
%	caso : coins.png 

img =imread("../images/coins.png");
size(img)

struct = gen_struct(5, 4)

pre_img = padding(img, 1, size(struct));
size(pre_img)
imshow(pre_img)

morph_matrix  = morphologic_converter(pre_img, 1, struct, true);
imshow(morph_matrix)

subplot(1,2,1); imshow(uint8(struct * 255));
subplot(1,2,2); imshow(morph_matrix);

morph_matrix  = morphologic_converter(pre_img, 2, struct, true);
imshow(morph_matrix)

subplot(1,2,1); imshow(pre_img);
subplot(1,2,2); imshow(uint8(morph_matrix));

morph_matrix  = advance_morphologic_converter(pre_img, 1, struct, true);
imshow(morph_matrix)

morph_matrix  = advance_morphologic_converter(pre_img, 2, struct, true);
imshow(morph_matrix)

img_bw = im2bw(img,graythresh(img));
imshow(img_bw);

pre_img_bw = padding(img_bw, 1, size(struct));

struct = gen_struct(5,6)

imshow(struct)

morph_matrix  = morphologic_converter(pre_img_bw, 1, struct, false);
imshow(morph_matrix)

subplot(1,2,1); imshow(struct);
subplot(1,2,2); imshow(morph_matrix);

morph_matrix  = morphologic_converter(pre_img_bw, 2, struct, false);
imshow(morph_matrix)

morph_matrix  = advance_morphologic_converter(pre_img_bw, 1, struct, false);
imshow(morph_matrix)

morph_matrix  = advance_morphologic_converter(pre_img_bw, 2, struct, false);
imshow(morph_matrix)