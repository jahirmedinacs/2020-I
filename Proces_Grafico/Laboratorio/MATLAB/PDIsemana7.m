function otsu=PDIsemana7()
matriz = [0,85,171,255];
tam = 4;

for i=1:4
    f(i) = 0;
end

%for i=1:tam
%    num = matriz(i);
%    f(num+1) = f(num+1) + 1;
%end

f(1) = 10;
f(2) = 20;
f(3) = 30;
f(4) = 40;

for i=1:tam-1
    w1 = 0;
    w2 = 0;
    mc1 = [];
    mc2 = [];
    disp('Cambio')
    for j=1:i
        %Primer C
        w1 = w1 + (f(j)/100);
    end

    for j=i+1:tam
        %Segundo C
        w2 = w2 + (f(j)/100);
    end
    
    for j=1:i
        %Primer C
        c1 = (f(j)/100)/w1;
        mc1 = [mc1 c1];
    end
    
    for j=i+1:tam
        %Primer C
        c2 = (f(j)/100)/w2;
        mc2 = [mc2 c2];
    end
    
end
    
otsu = mc1; 