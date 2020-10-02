function padded = padding(matrix, type_of, mask_size)

    % Como usar esta funcion
    % matrix es el valor de la imagen (si es a color, debera ser convertida a escala de grises o binarizarse)
    % type_of es el tipo de padding, 1 es el padding con reflejo, 2 es el padding con zeros (recomendado
    % para morfologia)
    % mask_size  es el TAMANO de la mascara, no la mascara, por que si se desea pasar la mascara, se debe usar
    % size(<mascara>) , nunca pasar la mascara.
    
    [x,y] = size(matrix);
    m_x = mask_size(1);
    m_y = mask_size(2);
    
    if m_x == m_y
        n_ref = (m_x - 1) / 2;
        
        % Mirrored
        if type_of == 1
            temp = matrix;
            
            % left - right
            temp = [fliplr(matrix(:,1:n_ref)) , matrix, fliplr(matrix)(:,1:n_ref)];
            temp = [fliplr(rot90(temp(1:n_ref,:),2)) ; temp ; fliplr(rot90(temp,2)(1:n_ref,:))];
            padded = temp;
        % Zero-ed
        elseif type_of == 2
            temp = zeros(x + 2 * n_ref, y + 2 * n_ref);
            temp(1 + n_ref:end - n_ref,1 + n_ref:end - n_ref) = matrix;
            padded = temp;
        else
            padded = zeros(x,y);
        end
    else
        padded = zeros(x,y);
    end
end