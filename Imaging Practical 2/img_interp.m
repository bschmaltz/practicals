function I=img_interp(original, target_rez, type)
R=original(:, :, 1);
G=original(:, :, 2);
B=original(:, :, 3);
[x y]=size(R);
targetX=(1:target_rez)/(target_rez/x);
targetY=(1:target_rez)/(target_rez/x);
IR=interp2(R, targetX, targetY(:), type);
IG=interp2(G, targetX, targetY(:), type);
IB=interp2(B, targetX, targetY(:), type);
I=cat(3, IR, IG, IB);
end