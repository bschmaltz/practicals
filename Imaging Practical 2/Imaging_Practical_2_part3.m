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

%% c)
RMSE_512_nearest=rmse(I, scaled512_nearest);
% [M N]=size(I(:, :, 1));
% RMSE_512_nearest=1/(M*N)*sum(sum(((I(:, :, 1)-scaled512_nearest(:, :, 1))...
%     .^2+(I(:, :, 2)-scaled512_nearest(:, :, 2)).^2+(I(:, :, 3)...
%     -scaled512_nearest(:, :, 3)).^2).^0.5));
% RMSE_512_linear=1/(M*N)*sum(sum(((I(:, :, 1)-scaled512_linear(:, :, 1))...
%     .^2+(I(:, :, 2)-scaled512_linear(:, :, 2)).^2+(I(:, :, 3)...
%     -scaled512_linear(:, :, 3)).^2).^0.5));
% RMSE_512_cubic=1/(M*N)*sum(sum(((I(:, :, 1)-scaled512_cubic(:, :, 1))...
%     .^2+(I(:, :, 2)-scaled512_cubic(:, :, 2)).^2+(I(:, :, 3)...
%     -scaled512_cubic(:, :, 3)).^2).^0.5));
% RMSE_256_nearest=1/(M*N)*sum(sum(((I(:, :, 1)-scaled256_nearest(:, :, 1))...
%     .^2+(I(:, :, 2)-scaled256_nearest(:, :, 2)).^2+(I(:, :, 3)...
%     -scaled256_nearest(:, :, 3)).^2).^0.5));
% RMSE_256_linear=1/(M*N)*sum(sum(((I(:, :, 1)-scaled256_linear(:, :, 1))...
%     .^2+(I(:, :, 2)-scaled256_linear(:, :, 2)).^2+(I(:, :, 3)...
%     -scaled256_linear(:, :, 3)).^2).^0.5));
% RMSE_256_cubic=1/(M*N)*sum(sum(((I(:, :, 1)-scaled256_cubic(:, :, 1))...
%     .^2+(I(:, :, 2)-scaled256_cubic(:, :, 2)).^2+(I(:, :, 3)...
%     -scaled256_cubic(:, :, 3)).^2).^0.5));
% RMSE_128_nearest=1/(M*N)*sum(sum(((I(:, :, 1)-scaled128_nearest(:, :, 1))...
%     .^2+(I(:, :, 2)-scaled128_nearest(:, :, 2)).^2+(I(:, :, 3)...
%     -scaled128_nearest(:, :, 3)).^2).^0.5));
% RMSE_128_linear=1/(M*N)*sum(sum(((I(:, :, 1)-scaled128_linear(:, :, 1))...
%     .^2+(I(:, :, 2)-scaled128_linear(:, :, 2)).^2+(I(:, :, 3)...
%     -scaled128_linear(:, :, 3)).^2).^0.5));
% RMSE_128_cubic=1/(M*N)*sum(sum(((I(:, :, 1)-scaled128_cubic(:, :, 1))...
%     .^2+(I(:, :, 2)-scaled128_cubic(:, :, 2)).^2+(I(:, :, 3)...
%     -scaled128_cubic(:, :, 3)).^2).^0.5));

