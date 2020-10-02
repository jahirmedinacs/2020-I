function morph_matrix = advance_morphologic_converter(image, operation, structural_element, gray)
    % image es la imagen CON PADDING, no usar esta funcion sin aplicar el padding primero
    % operation es la operacion fundamental a aplicar : 1 es Apertura , 2 es Clausura
    % structural_element es , como su nombre dice, el elemento estructural, NO USAR TAMANOS PARES (3, 5, 7)
    % gray es un valor binario (true / false) , seleccionar true ejectua la funcion en modo escala de grises
    % ejecutarla usando el valor false, trabaja de forma binaria.
    
    if operation == 1
        temp = morphologic_converter(image, 2, structural_element, gray);
        temp = padding(temp, 2, size(structural_element));
        morph_matrix = morphologic_converter(temp, 1, structural_element, gray);
        
    elseif operation == 2
        temp = morphologic_converter(image, 1, structural_element, gray);
        temp = padding(temp, 2, size(structural_element));
        morph_matrix = morphologic_converter(temp, 2, structural_element, gray);
        
    end
end