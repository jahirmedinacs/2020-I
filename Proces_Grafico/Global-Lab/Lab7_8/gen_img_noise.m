BASE_PATH = "./Imagenes/uniques/";
files = {"barbara",
"blur",
"boat",
"cameraman",
"coins",
"concordorthophoto",
"hands1",
"house",
"jetplane",
"lake",
"lena",
"liftingbody",
"livingroom",
"mandril",
"peppers",
"pirate",
"plate",
"platesp",
"pout",
"rice",
"saturn",
"test2",
"test",
"text",
"tire",
"walkbridge",
"westconcordorthophoto",
"woman_blonde",
"woman_darkhair"};

SUFIX = {"_gauss_001.png",
"_gauss_004.png",
"_gauss_008.png",
"_sp_001.png",
"_sp_004.png",
"_sp_008.png",
"_speck_002.png",
"_speck_004.png",
"_speck_008.png"};

for ii = [1:size(files)(1)]
    current_img_path = strjoin({BASE_PATH, files{ii}, ".png"}, "");
    curr_img = imread(current_img_path);
    
    disp(files{ii});
    
    if size(size(curr_img))(2) > 2
        curr_img = uint8(rgb2gray(curr_img));
        imwrite(curr_img, current_img_path);
    elseif max(max(curr_img)) == 1 && min(min(curr_img)) == 0
        curr_img = uint8(curr_img * 255);
        imwrite(curr_img, current_img_path);
    end
    
    % gauss
    imwrite(imnoise(curr_img,'gaussian',0 , 0.01), strjoin({PATH, files{ii}, "_gauss_001.png"}, ""));
    imwrite(imnoise(curr_img,'gaussian',0 , 0.04), strjoin({PATH, files{ii}, "_gauss_004.png"}, ""));
    imwrite(imnoise(curr_img,'gaussian',0 , 0.08), strjoin({PATH, files{ii}, "_gauss_008.png"}, ""));
    
    % sal y pimienta
    imwrite(imnoise(curr_img,'salt & pepper', 0.01), strjoin({PATH, files{ii}, "_sp_001.png"}, ""));
    imwrite(imnoise(curr_img,'salt & pepper', 0.04), strjoin({PATH, files{ii}, "_sp_004.png"}, ""));
    imwrite(imnoise(curr_img,'salt & pepper', 0.08), strjoin({PATH, files{ii}, "_sp_008.png"}, ""));
    
    % speckel
    imwrite(imnoise(curr_img,'speckle', 0.02), strjoin({PATH, files{ii}, "_speck_002.png"}, ""));
    imwrite(imnoise(curr_img,'speckle', 0.04), strjoin({PATH, files{ii}, "_speck_004.png"}, ""));
    imwrite(imnoise(curr_img,'speckle', 0.08), strjoin({PATH, files{ii}, "_speck_008.png"}, ""));
    
end