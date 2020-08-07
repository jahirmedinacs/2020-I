%debug

img = imread("../Labs/imgs/plate")

alt_img = GrayToBin(img)

otsuMethod(img)

subplot(1,2,1); imshow(alt_img)
subplot(1,2,2); imshow(img)
