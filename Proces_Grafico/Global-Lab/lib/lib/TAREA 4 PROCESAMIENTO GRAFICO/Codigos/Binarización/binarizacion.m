function bin=binarizacion(imagen,T)
imd=imread(imagen);

[f,c]=size(imd);

for i=1:f
    for j=1:c
        k=imd(i,j);
        if k<= T
            h(i,j)=0;
        else if k > T
                h(i,j)=1;
            end
        end
    end
end
subplot(1,2,1);
imshow(imagen);
subplot(1,2,2);
imshow(h);
bin=h;

