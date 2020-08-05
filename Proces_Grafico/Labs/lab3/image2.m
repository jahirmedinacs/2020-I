img_size = 512;
IMG = zeros(img_size,img_size,3);
BASE = zeros(img_size, img_size, 3);

trng_l = 215;
trng_d = eye(trng_l,trng_l);

rombo = [ rot90(trng_d) trng_d; trng_d rot90(trng_d)];

circulo = m_circulo(150);

band_l = eye(210,300);
banda =  ( band_l + rot90(rot90(band_l)))';

%%% Agregando padding

% circulo

p_rombo = m_padding(rombo, img_size, img_size);
t_rombo = BASE;
t_rombo(:,:,1) = p_rombo;
t_rombo(:,:,2) = p_rombo;

p_circulo = m_padding(circulo, img_size, img_size);
t_circulo = BASE;
t_circulo(:,:,3) = p_circulo;

p_banda = m_padding(banda, img_size, img_size);
t_banda = BASE;
t_banda(:,:,1) = p_banda;
t_banda(:,:,2) = p_banda;
t_banda(:,:,3) = p_banda;

t_IMG = IMG + t_rombo + t_circulo;
for colors_ii = [1:3]
	IMG(:,:,colors_ii) = m_gradiente(255 * t_IMG(:,:, colors_ii), 0);
end

IMG = 255 - uint8(IMG);

tmp = IMG(:,:,1);
tmp(tmp == 255) = 0;
IMG(:,:,1) = tmp;
% 
tmp = IMG(:,:,3);
tmp(tmp == 255) = 0;
IMG(:,:,3) = tmp;

imshow(IMG);