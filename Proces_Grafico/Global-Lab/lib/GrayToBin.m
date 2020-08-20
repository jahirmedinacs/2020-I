function output = GrayToBin(imD);

threshold = otsuMethod(imD);
threshold
Matrix = Binarization(imD, threshold);

output = Matrix;