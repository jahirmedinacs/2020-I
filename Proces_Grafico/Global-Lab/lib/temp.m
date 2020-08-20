x = magic(6)
x = x(2:end,1:4)

[filas, columnas] = size(x);
ancho = 5
max_val_ref = 255
for index = [1: (filas * columnas)]
    index
    if x(index) == max_val_ref
        ref = mod(index,filas)
        if ref == 0
            ref = filas
        end
        
        carry = [ref - ancho: ref + ancho]
    end

end

x