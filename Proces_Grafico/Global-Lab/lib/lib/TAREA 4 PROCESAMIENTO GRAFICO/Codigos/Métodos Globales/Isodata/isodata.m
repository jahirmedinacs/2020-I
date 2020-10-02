function is = isodata(img)
im = imread(img);
[f,c,d] = size(im);

hn = histNormalizado(img);
[fh,L] = size(hn);
vp = [];
k = 1;
for i=1:256
   if(hn(i) ~= 0)
       vp(k) = k;
       k = k+1;
   else
       vp(k) = 0;
       k = k+1;
   end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

umbral = 0;
t = 1;
ui = 0;
menor = 1;

while t<=256
    w1 = 0;
    w2 = 0;
    uj = 0;
    hp1 = 0;
    hp2 = 0;
    %sum hn
    for i=1:t
        w1 = w1 + hn(i);
    end
    w2 = 1 - w1;
    %sum hp
    for i=1:t
        hp1 = hp1 + (vp(i)*hn(i));
    end
    for i=t+1:L-1
        hp2 = hp2 + (vp(i)*hn(i));
    end

    uj = ((hp1/w1)+(hp2/w2))/2;
    valor = uj-ui;
 
    if(valor < menor) %condicion para terminar el proceso
        menor = valor;
        umbral = uj;
    end
    
    ui = uj;
    t = t + 1;
   
end

for i=1:f
    for j=1:c
        if im(i,j)<=umbral
            imgbi(i,j)=0;
        else
            imgbi(i,j)=255;
        end
    end
end
imb = uint8(imgbi);
figure
subplot(1,2,1);imshow(im);
subplot(1,2,2);imshow(imb);title(umbral);

is = umbral;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


