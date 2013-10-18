% Imaging Practical 2 Part 4
load('Test_Image_1024.mat');
load('Test_Image_256.mat');
%% a)
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

%Scale the 256 up to 1024 with nearest, linear, and cubic interpolation
scaled256_nearest=img_interp(I_256, 1024, 'nearest');
scaled256_linear=img_interp(I_256, 1024, 'linear');
scaled256_cubic=img_interp(I_256, 1024, 'cubic');

BW_canny_256_nearest=edge(rgb2gray(scaled256_nearest), 'canny');
BW_canny_256_linear=edge(rgb2gray(scaled256_linear), 'canny');
BW_canny_256_cubic=edge(rgb2gray(scaled256_cubic), 'canny');
figure;
imshow(BW_canny_256_nearest);
title('256 Nearest');
figure;
imshow(BW_canny_256_linear);
title('256 Linear');
figure;
imshow(BW_canny_256_cubic);
title('256 Cubic');

%Comparison to original benchmark:
%Using the nearest method of interpolation resulted in a digitized
%apearance not only for the scaled image but also in the resulting edges
%found. Many of the edges found do not match the orgianl benchmark. In
%regard to the linear and cubic methods both showed better representation
%of the edges found on the benchmark. However, there was still a large
%number of edges not found in the interpolated images that were found in
%the orgial benchmark.

%% c)

h = fspecial('gaussian', [5 5], 2);
filtered_scaled256_nearest=imfilter(scaled256_nearest, h, 'same');
filtered_scaled256_linear=imfilter(scaled256_linear, h, 'same');
filtered_scaled256_cubic=imfilter(scaled256_cubic, h, 'same');

BW_canny_filtered_256_nearest=edge(rgb2gray(filtered_scaled256_nearest), 'canny');
BW_canny_filtered_256_linear=edge(rgb2gray(filtered_scaled256_linear), 'canny');
BW_canny_filtered_256_cubic=edge(rgb2gray(filtered_scaled256_cubic), 'canny');
figure;
imshow(BW_canny_filtered_256_nearest);
title('Filtered 256 Nearest');
figure;
imshow(BW_canny_filtered_256_linear);
title('Filtered 256 Linear');
figure;
imshow(BW_canny_filtered_256_cubic);
title('Filtered 256 Cubic');

%Effect of smoothing:
%Smoothing the image resulted in a lower number of edges found for all
%three methods of interpolation. In particuarlly there was a loss of detail
%in the image.