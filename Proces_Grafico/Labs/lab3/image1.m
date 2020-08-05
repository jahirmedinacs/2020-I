IMG = uint8(zeros(512,512,3));

trng_l = 100;
trng_d = eye(trng_l,trng_l);

rombo = [ rot90(trng_d) trng_d; trng_d rot90(trng_d)];
rombo = m_gradiente(255 * rombo, 0);
rombo = uint8(rombo);

circulo = uint8(m_gradiente(255 * m_circulo(150),0));

band_l = eye(70,100);

band =  ( band_l + rot90(rot90(band_l)))';
band = uint8(m_gradiente(255 * band,0));


%%% Coloreando 

IMG(:,:,2) = 255;

[r_i, r_j] = size(rombo);
c_rombo = uint8(zeros(r_i, r_j,3));
c_rombo(:,:,1) = rombo;
c_rombo(:,:,2) = rombo;

[c_i, c_j] = size(circulo);
c_circulo = uint8(zeros(c_i, c_j,3));
c_circulo(:,:,3) = circulo;

[b_i, b_j] = size(band);
c_band = uint8(zeros(b_i, b_j,3));
c_band(:,:,1) = band;
c_band(:,:,2) = band;
c_band(:,:,3) = band;

%%% Agregando padding



imshow(IMG);