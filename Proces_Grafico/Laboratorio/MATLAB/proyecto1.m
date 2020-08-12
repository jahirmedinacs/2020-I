clear all
bin=input('Ingrese el numero binario que desea convertir a decimal: ','s');
L=length(bin);
decimal=0;
for i=1:L
 decimal=decimal +str2double(bin(i))*2^(L-i);
 c=floor(decimal/8);
 r=rem(decimal,8); 
 octal= [c r];
end
display(octal)