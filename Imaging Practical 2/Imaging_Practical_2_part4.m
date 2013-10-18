% Imaging Practical 2 Part 4
%% a)
load('Test_Image_1024.mat');
I=rgb2gray(I);
BW_sobel=edge(I, 'sobel');
BW_prewitt=edge(I, 'prewitt');
BW_roberts=edge(I, 'roberts');
BW_canny=edge(I, 'canny');
imshow(BW_sobel);
title('Sobel');
figure;
imshow(BW_prewitt);
title('Prewitt');
figure;
imshow(BW_roberts);
title('Roberts');
figure;
imshow(BW_canny);
title('Canny');
% Roberts detected the least edges. Prewitt and Sobel detected more than 
% Roberts but not by much, where both had the same effectiveness.
% Canny works the best since it detects the most contours and edges found
% in the image slice allowing for more feature extraction.

%% b)

%% c)
