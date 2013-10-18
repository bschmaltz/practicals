function I=img_interp(orginal, target_rez, type)
R=orginal(:, :, 1);
G=orginal(:, :, 2);
B=orginal(:, :, 3);
targetX=1:target_rez;
targetY=1:target_rez;
[x y]=size(R);
repeats=log2(target_rez/x);
IR=interp2(R, repeats, type);
% IG=interp2(G, 1, type);
% IB=interp2(B, 1, type);
% I=cat(3, IR, IG, IB);
end