image = load('Test_Image_512.mat');
gray = rgb2gray(image.I_512);


gray_dct = dct2(gray);
[B IX]=sort(abs(gray_dct(:)),'descend');
gray_dct_trunc = zeros(size(gray));
for i=1:(128^2)
    row=floor(IX(i)/512)+1;
    if(row==513)
       row=512;
    end
    col=mod(IX(i),512);
    if col==0
        col=512;
    end
    gray_dct_trunc(row,col) = gray_dct(row,col);
end

gray_idct = idct2(gray_dct);
residual_dct = abs(gray-gray_idct);

figure
subplot(2,3,1);
imshow(gray),title('Grayscale 512x512');
subplot(2,3,2);
imshow(abs(gray_dct)),title('DCT');
subplot(2,3,3);
imshow(abs(gray_dct_trunc)),title('Truncated DCT');
subplot(2,3,4);
imshow(gray_idct),title('Inverse DCT Image');
subplot(2,3,5);
imshow(residual_dct),title('DCT: Difference Image');


gray_dft = fft2(gray);
[B IX]=sort(abs(gray_dft(:)),'descend');
gray_dft_trunc = zeros(size(gray));

for i=1:(128^2)
    row=floor(IX(i)/512)+1;
    if(row==513)
       row=512;
    end
    col=mod(IX(i),512);
    if col==0
        col=512;
    end
    gray_dft_trunc(row,col) = gray_dft(row,col);
end

gray_idft = abs(ifft2(gray_dft_trunc));
residual_dft = abs(gray-gray_idft);

figure
subplot(2,3,1);
imshow(gray),title('Grayscale 512x512');
subplot(2,3,2);
imshow(abs(gray_dft)),title('DFT');
subplot(2,3,3);
imshow(abs(gray_dft_trunc)),title('Truncated DFT');
subplot(2,3,4);
imshow(gray_idft),title('Inverse DFT Image');
subplot(2,3,5);
imshow(residual_dft),title('DFT: Difference Image');