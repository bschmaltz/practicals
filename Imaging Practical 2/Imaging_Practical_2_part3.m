%% Imaging Pratical 2 Part 3
load('Test_Image_64.mat');
load('Test_Image_128.mat');
load('Test_Image_256.mat');
load('Test_Image_512.mat');
load('Test_Image_1024.mat');

%% a)
% Look at the function called img_interp.m

% function I=img_interp(original, target_rez, type)
%   R=original(:, :, 1);
%   G=original(:, :, 2);
%   B=original(:, :, 3);
%   [x y]=size(R);
%   targetX=(1:target_rez)/(target_rez/x);
%   targetY=(1:target_rez)/(target_rez/x);
%   IR=interp2(R, targetX, targetY(:), type);
%   IG=interp2(G, targetX, targetY(:), type);
%   IB=interp2(B, targetX, targetY(:), type);
%   I=cat(3, IR, IG, IB);
% end

%% b)
%Scale the 64 up to 1024 with nearest, linear, and cubic interpolation
scaled64_nearest=img_interp(I_64, 1024, 'nearest');
scaled64_linear=img_interp(I_64, 1024, 'linear');
scaled64_cubic=img_interp(I_64, 1024, 'cubic');
%Scale the 512 up to 1024 with nearest, linear, and cubic interpolation
scaled512_nearest=img_interp(I_512, 1024, 'nearest');
scaled512_linear=img_interp(I_512, 1024, 'linear');
scaled512_cubic=img_interp(I_512, 1024, 'cubic');
%Scale the 256 up to 1024 with nearest, linear, and cubic interpolation
scaled256_nearest=img_interp(I_256, 1024, 'nearest');
scaled256_linear=img_interp(I_256, 1024, 'linear');
scaled256_cubic=img_interp(I_256, 1024, 'cubic');
%Scale the 128 up to 1024 with nearest, linear, and cubic interpolation
scaled128_nearest=img_interp(I_128, 1024, 'nearest');
scaled128_linear=img_interp(I_128, 1024, 'linear');
scaled128_cubic=img_interp(I_128, 1024, 'cubic');

%Residual Image
BM_64_N=abs(I-scaled64_nearest);
BM_64_L=abs(I-scaled64_linear);
BM_64_C=abs(I-scaled64_cubic);
BM_512_N=abs(I-scaled512_nearest);
BM_512_L=abs(I-scaled512_linear);
BM_512_C=abs(I-scaled512_cubic);
BM_256_N=abs(I-scaled256_nearest);
BM_256_L=abs(I-scaled256_linear);
BM_256_C=abs(I-scaled256_cubic);
BM_128_N=abs(I-scaled128_nearest);
BM_128_L=abs(I-scaled128_linear);
BM_128_C=abs(I-scaled128_cubic);

%Comparison Description:
%The residuals from the 64x64 images are the brightest indicating those
%are largest residuals. The residual images become darker with increasing
%orginal resolution making the residual from the 512x512 image the darkest.
%All of the nearest interpolation methods result in the most digiized
%images where linear and cubic result in similar smoother images.
%Additionally, the digitized look of the residuals becomes more smooth with
%increasing orginal resolution.

%% c)

% function RMSE=rmse(original, interpolated)
%   R=(original(:, :, 1)-interpolated(:, :, 1)).^2;
%   G=(original(:, :, 2)-interpolated(:, :, 2)).^2;
%   B=(original(:, :, 3)-interpolated(:, :, 3)).^2;
%   RGB=R+G+B;
%   [M N P]=size(original);
%   RMSE=(1/(M*N)*nansum(nansum(RGB))).^(0.5);
% end

RMSE_512_nearest=rmse(I, scaled512_nearest);
RMSE_512_linear=rmse(I, scaled512_linear);
RMSE_512_cubic=rmse(I, scaled512_cubic);
RMSE_256_nearest=rmse(I, scaled256_nearest);
RMSE_256_linear=rmse(I, scaled256_linear);
RMSE_256_cubic=rmse(I, scaled256_cubic);
RMSE_128_nearest=rmse(I, scaled128_nearest);
RMSE_128_linear=rmse(I, scaled128_linear);
RMSE_128_cubic=rmse(I, scaled128_cubic);
RMSE_64_nearest=rmse(I, scaled64_nearest);
RMSE_64_linear=rmse(I, scaled64_linear);
RMSE_64_cubic=rmse(I, scaled64_cubic);

RMSE_nearest=[RMSE_64_nearest RMSE_128_nearest RMSE_256_nearest...
    RMSE_512_nearest];
RMSE_linear=[RMSE_64_linear RMSE_128_linear RMSE_256_linear...
    RMSE_512_linear];
RMSE_cubic=[RMSE_64_cubic RMSE_128_cubic RMSE_256_cubic...
    RMSE_512_cubic];
figure;
plot(RMSE_nearest);
hold on
plot(RMSE_linear, 'g');
plot(RMSE_cubic, 'r');
set(gca,'Xtick',1:4,'XTickLabel',{'64x64', '128x128', '256x256', '512x512'})
title('Variation in Error with Interpolation Method and Imput Image''s Resolution')
ylabel('RMS Error')
xlabel('Resolution of Input Image')
legend('Nearest', 'Linear', 'Cubic')
%% d)
h = fspecial('gaussian', [5 5], 2);

filtered_scaled64_nearest=imfilter(scaled64_nearest, h, 'same');
filtered_scaled64_linear=imfilter(scaled64_linear, h, 'same');
filtered_scaled64_cubic=imfilter(scaled64_cubic, h, 'same');

filtered_scaled512_nearest=imfilter(scaled512_nearest, h, 'same');
filtered_scaled512_linear=imfilter(scaled512_linear, h, 'same');
filtered_scaled512_cubic=imfilter(scaled512_cubic, h, 'same');

filtered_scaled256_nearest=imfilter(scaled256_nearest, h, 'same');
filtered_scaled256_linear=imfilter(scaled256_linear, h, 'same');
filtered_scaled256_cubic=imfilter(scaled256_cubic, h, 'same');

filtered_scaled128_nearest=imfilter(scaled128_nearest, h, 'same');
filtered_scaled128_linear=imfilter(scaled128_linear, h, 'same');
filtered_scaled128_cubic=imfilter(scaled128_cubic, h, 'same');

filtered_RMSE_512_nearest=rmse(I, filtered_scaled512_nearest);
filtered_RMSE_512_linear=rmse(I, filtered_scaled512_linear);
filtered_RMSE_512_cubic=rmse(I, filtered_scaled512_cubic);
filtered_RMSE_256_nearest=rmse(I, filtered_scaled256_nearest);
filtered_RMSE_256_linear=rmse(I, filtered_scaled256_linear);
filtered_RMSE_256_cubic=rmse(I, filtered_scaled256_cubic);
filtered_RMSE_128_nearest=rmse(I, filtered_scaled128_nearest);
filtered_RMSE_128_linear=rmse(I, filtered_scaled128_linear);
filtered_RMSE_128_cubic=rmse(I, filtered_scaled128_cubic);
filtered_RMSE_64_nearest=rmse(I, filtered_scaled64_nearest);
filtered_RMSE_64_linear=rmse(I, filtered_scaled64_linear);
filtered_RMSE_64_cubic=rmse(I, filtered_scaled64_cubic);

filtered_RMSE_nearest=[filtered_RMSE_64_nearest filtered_RMSE_128_nearest...
    filtered_RMSE_256_nearest filtered_RMSE_512_nearest];
filtered_RMSE_linear=[filtered_RMSE_64_linear filtered_RMSE_128_linear...
    filtered_RMSE_256_linear filtered_RMSE_512_linear];
filtered_RMSE_cubic=[filtered_RMSE_64_cubic filtered_RMSE_128_cubic...
    filtered_RMSE_256_cubic filtered_RMSE_512_cubic];
figure;
plot(filtered_RMSE_nearest);
hold on
plot(filtered_RMSE_linear, 'g');
plot(filtered_RMSE_cubic, 'r');
set(gca,'Xtick',1:4,'XTickLabel',{'64x64', '128x128', '256x256', '512x512'})
title('Variation in Error post filtering with Interpolation Method and Imput Image''s Resolution')
ylabel('RMS Error')
xlabel('Resolution of Input Image')
legend('Nearest', 'Linear', 'Cubic')