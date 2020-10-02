thisGray = false;

structNames = {"linea vertical", "linea horizontal", "cuadrado", "cruz", "circulo", "diamante"};
files = {"coins.png", "rice.png", "platesp.png", "cells.png", "text2.png"};
% BASE_PATH = "../images/";
BASE_PATH = "";
amount_files = size(files')(1);

% Blanco y Negro

fig_id = 1;
for n_ref = 3:2:9
    for i=1:amount_files
        current_path = strcat(BASE_PATH, files{i});
        current_img = imread(current_path);
        
        if size(size(current_img))(2) > 2
            current_img = uint8(rgb2gray(current_img));
        end
        
        og_img = current_img;
                
        if ~thisGray
            current_img = im2bw(current_img, graythresh(current_img));
        end
        
        for structType = 1:6
            currentStruct = gen_struct(n_ref, structType);
                        
            pre_img = padding(current_img, 2, size(currentStruct));
                      
            dilat_current = morphologic_converter(pre_img, 1, currentStruct, thisGray);
            
            eros_current = morphologic_converter(pre_img, 2, currentStruct, thisGray);
            
            apert_current = advance_morphologic_converter(pre_img, 1, currentStruct, thisGray);
            
            claus_current = advance_morphologic_converter(pre_img, 2, currentStruct, thisGray);
            
            %%%
            
            if thisGray
                dilat_current = uint8(dilat_current);
                eros_current = uint8(eros_current);
                apert_current = uint8(apert_current);
                claus_current = uint8(claus_current);
            end
            
            %%%
            
            figure;
            subplot(3,3,1); imshow(ones(3)); title(int2str(n_ref));
            if thisGray
                subplot(3,3,2); imshow(current_img); title(files{i});
            else
                subplot(3,3,2); imshow(og_img); title(files{i});
                subplot(3,3,3); imshow(current_img); title("Binarizacion");
            end
            
            subplot(3,3,4); imshow(currentStruct); title(structNames{structType});
            
            subplot(3,3,5); imshow(dilat_current); title("Dilatacion");
            subplot(3,3,6); imshow(eros_current); title("Erosion");
            subplot(3,3,7); imshow(apert_current); title("Apertura");
            subplot(3,3,8); imshow(claus_current); title("Clausura");
            
            filename = "./results/";
            if ~thisGray
                graySTR = "BW";
            else
                graySTR = "GR";
            end
            
            vars_str = {graySTR, int2str(n_ref), structNames{structType}, files{i}};
            filename = strcat(filename, strjoin(vars_str, "_"));
            disp(filename);
            saveas(fig_id , filename, "png");
            fig_id = fig_id + 1;
        end
    end
end

% Escala de Grises

thisGray = true;

fig_id = 1;
for n_ref = 3:2:9
    for i=1:amount_files
        current_path = strcat(BASE_PATH, files{i});
        current_img = imread(current_path);
        
        if size(size(current_img))(2) > 2
            current_img = uint8(rgb2gray(current_img));
        end
        
        og_img = current_img;
                
        if ~thisGray
            current_img = im2bw(current_img, graythresh(current_img));
        end
        
        for structType = 1:6
            currentStruct = gen_struct(n_ref, structType);
                        
            pre_img = padding(current_img, 2, size(currentStruct));
                      
            dilat_current = morphologic_converter(pre_img, 1, currentStruct, thisGray);
            
            eros_current = morphologic_converter(pre_img, 2, currentStruct, thisGray);
            
            apert_current = advance_morphologic_converter(pre_img, 1, currentStruct, thisGray);
            
            claus_current = advance_morphologic_converter(pre_img, 2, currentStruct, thisGray);
            
            %%%
            
            if thisGray
                dilat_current = uint8(dilat_current);
                eros_current = uint8(eros_current);
                apert_current = uint8(apert_current);
                claus_current = uint8(claus_current);
            end
            
            %%%
            
            figure;
            subplot(3,3,1); imshow(ones(3)); title(int2str(n_ref));
            if thisGray
                subplot(3,3,2); imshow(current_img); title(files{i});
            else
                subplot(3,3,2); imshow(og_img); title(files{i});
                subplot(3,3,3); imshow(current_img); title("Binarizacion");
            end
            
            subplot(3,3,4); imshow(currentStruct); title(structNames{structType});
            
            subplot(3,3,5); imshow(dilat_current); title("Dilatacion");
            subplot(3,3,6); imshow(eros_current); title("Erosion");
            subplot(3,3,7); imshow(apert_current); title("Apertura");
            subplot(3,3,8); imshow(claus_current); title("Clausura");
            
            filename = "./results/";
            if ~thisGray
                graySTR = "BW";
            else
                graySTR = "GR";
            end
            
            vars_str = {graySTR, int2str(n_ref), structNames{structType}, files{i}};
            filename = strcat(filename, strjoin(vars_str, "_"));
            disp(filename);
            saveas(fig_id , filename, "png");
            fig_id = fig_id + 1;
        end
    end
end