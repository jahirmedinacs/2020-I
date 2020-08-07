function output = GrayToBin(imD);

threshold = otsuMethod(imD);
Matrix = Binarization(imD, threshold);

output = Matrix;