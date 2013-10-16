image = load('Test_Image_512.mat');
gray = rgb2gray(image.I_512);


gray_dct = dct2(gray);
gray_idct = idct2(gray_dct(1:128, 1:128), 512, 512);
residual_dct = abs(gray-gray_idct);

gray_dft = fft2(gray);
gray_idft = ifft2(gray_dft(192:319, 192:319), 512, 512);
residual_dft = abs(gray-gray_idft);

figure, imshow(gray),title('Grayscale 512x512');
figure, imshow(gray_dct),title('DCT');
figure, imshow(gray_idct),title('Inverse DCT Image');
figure, imshow(residual_dct),title('DCT: Difference Image');

figure, imshow(gray_dft),title('DFT');
%figure, imshow(gray_idft),title('Inverse DFT Image');
%figure, imshow(residual_dft),title('DFT: Difference Image');