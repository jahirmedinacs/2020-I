function y = m_gradiente(x, modifier)

    [filas, columnas] = size(x);
    y = zeros(filas, columnas);
    ancho = 10;
    max_val_ref = 255;
    
    scale = [2:ancho+1];
    scale = 1 ./ scale;
    scale = floor(max_val_ref .* scale);
    scale = scale + modifier;
    rev_scale = fliplr(scale);
    
    for index = [1: (filas * columnas)]
        x(index);
        if x(index) == max_val_ref
            ref = mod(index,filas);
            if ref == 0
                ref = filas;
            end
            carry = [ref - ancho: ref + ancho];
            carry1 = carry(carry >= 1);
            carry = carry1(carry1 <= filas);
            
            
            id_a = carry(carry < ref) - ref + index;
            id_b = carry(carry > ref) - ref + index;
            
            
            y(id_a) = rev_scale(length(rev_scale) - (length(id_a) - 1) :end);
            y(index) = max_val_ref;
            y(id_b) = scale(1:length(id_b));
                        
        end

    end
    
end