function morph_matrix = morphologic_converter(image, operation, structural_element, gray)

    % como usar esta funcion
    % image es la imagen CON PADDING, no usar esta funcion sin aplicar el padding primero
    % operation es la operacion fundamental a aplicar : 1 es Dilatacion , 2 es Erosion
    % structural_element es , como su nombre dice, el elemento estructural, NO USAR TAMANOS PARES (3, 5, 7)
    % gray es un valor binario (true / false) , seleccionar true ejectua la funcion en modo escala de grises
    % ejecutarla usando el valor false, trabaja de forma binaria.
    
    gen_img= image;
    
    [x,y]=size(gen_img);
    morph_matrix=zeros(x,y);
    
    n_ref = (size(structural_element)(1) - 1) / 2;
    struct_indx = find(structural_element);
    struct_sum = sum(sum(structural_element));
    
    if gray
        if operation == 1
            %dilatacion

            for s=1+n_ref:x-n_ref
                for t=1+n_ref:y-n_ref
                    temp = gen_img(s-n_ref:s+n_ref, t-n_ref:t+n_ref);
                    morph_matrix(s,t) =  max(temp(struct_indx));
                end
            end
        
        elseif operation == 2
            %erosion

            for s=1+n_ref:x-n_ref
                for t=1+n_ref:y-n_ref
                    temp = gen_img(s-n_ref:s+n_ref, t-n_ref:t+n_ref);
                    morph_matrix(s,t) = min(temp(struct_indx));
                end
            end
        end
    else
        if operation == 1
            %dilatacion
        
            for s=1+n_ref:x-n_ref
                for t=1+n_ref:y-n_ref
                    if gen_img(s,t) == 1
                        temp = gen_img(s-n_ref:s+n_ref, t-n_ref:t+n_ref);
                        temp(struct_indx) = 1;
                        current = morph_matrix(s-n_ref:s+n_ref, t-n_ref:t+n_ref);
                        current = current + temp;
                        current = current ~= 0;
                        morph_matrix(s-n_ref:s+n_ref, t-n_ref:t+n_ref) = current;
                    end
                end
            end
        
        elseif operation == 2
            %erosion

            for s=1+n_ref:x-n_ref
                for t=1+n_ref:y-n_ref
                    if gen_img(s,t) == 1
                        temp = gen_img(s-n_ref:s+n_ref, t-n_ref:t+n_ref);
                        if sum(sum(temp(struct_indx))) == struct_sum
                                morph_matrix(s,t) = 1;
                        end
                    end
                end
            end
        end
    end
    morph_matrix = morph_matrix(1+n_ref:end-n_ref, 1+n_ref:end-n_ref);
end