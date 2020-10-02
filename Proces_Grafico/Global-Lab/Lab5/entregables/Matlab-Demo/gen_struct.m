function structural_element = gen_struct(radio, pre_define)
    
    % como usar esta funcion
    % marcar un radio, SIEMPRE IMPAR
    % seleccionar un tipo de estructura: 
    % 1 Linea Vertical, 2 Linea horizonta, 3 Cuadrado, 4 Cruz, 5 Circulo, 6 Diamante
    
    structural_element = zeros(radio, radio);
    sub_rad = (radio - 1) / 2;
    switch pre_define
        case 1
            % linea vertical
            structural_element(:,1+sub_rad) = 1;
        case 2
            % linea horizontal
            structural_element(1+sub_rad, :) = 1;
        case 3
            % cuadrado
            structural_element = ones(radio,radio);
        case 4
            % cruz
            structural_element(:, 1+sub_rad) = 1;
            structural_element(1+sub_rad, :) = 1;
        case 5
            % circulo
            sub_rad_mid = sub_rad + 1;

            imageSizeX = radio;
            imageSizeY = radio;
            [columnsInImage rowsInImage] = meshgrid(1:imageSizeX, 1:imageSizeY);
            
            centerX = sub_rad_mid;
            centerY = sub_rad_mid;
            radius = sub_rad_mid;
            structural_element = (rowsInImage - centerY).^2 + (columnsInImage - centerX).^2 <= radius.^2;
        case 6
            % diamante
            structural_element(1:1+sub_rad,(end - sub_rad):end) = tril(ones(1+sub_rad));
            structural_element = structural_element + structural_element';
            structural_element = structural_element + rot90(structural_element);
            structural_element = structural_element ~= 0;
        otherwise
            structural_element = ones(radio, radio)
        end
end