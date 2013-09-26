[tm, signal, fs] = rdsamp('chfdb/chf01',1, 0, 2);
[ann] = rdann('chfdb/chf01');

plot(tm, signal(:,1), 'r', tm, signal(:,2), 'b')
hold on
plot(tm(ann), signal(ann, 1), 'ro', MarkerSize', 4, ...
     tm(ann), signal(ann, 2), 'bo', MarkerSize', 4)