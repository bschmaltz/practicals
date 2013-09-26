[tm, signal, fs] = rdsamp('chfdb/chf01',[], 1000, 1);
% The following line doesn't work and is suppose to fetch the annotations
%
%   ann = rdann('chfdb/chf01', 'ecg', 3, 1000, 1);
%
% Returns 'Improper assignment with rectangular empty matrix'
%
% However when we test:
%  
%   rdann('mitdb/100', 'atr'
%
% and
% 
%   rdann('challenge/2013/set-a/a01', 'fqrs')
%
% it works.

plot(tm, signal(:,1), 'r', tm, signal(:,2) - 10, 'b')
% How we would plot the annotations if we had them
%
%   hold on
%   plot(tm(ann), signal(ann, 1), 'ro', 'MarkerSize', 4, ...
%       tm(ann), signal(ann, 2) - 10, 'bo', 'MarkerSize', 4)
