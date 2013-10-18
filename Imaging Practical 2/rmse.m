function RMSE=rmse(original, interpolated)
R=(original(:, :, 1)-interpolated(:, :, 1)).^2;
G=(original(:, :, 2)-interpolated(:, :, 2)).^2;
B=(original(:, :, 3)-interpolated(:, :, 3)).^2;
RGB=R+G+B;
[M N P]=size(original);
RMSE=(1/(M*N)*nansum(nansum(RGB))).^(0.5);
end