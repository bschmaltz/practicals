[tm, signal, fs] = rdsamp('chfdb/chf01',[], 9999, 0);
[ann,type,subtype,chan,num,comments] = rdann('chfdb/chf01','ecg','V', 9999,0);

plot(tm, signal(:,1), 'r', tm, signal(:,2), 'b')
hold on
plot(tm(ann), signal(ann, 1), 'ro', ...
     tm(ann), signal(ann, 2), 'bo')
