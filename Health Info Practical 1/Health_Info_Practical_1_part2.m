[tm, signal, fs] = rdsamp('chfdb/chf02',[], 9999, 0);
%[ann] = rdann('chfdb/chf02','ecg',1, 9999, 0);
%
% I spent 3 or 4 hours trying to get this rdann function to work for
% 'chfdb/chfXX', but nothing worked in this folder.  It works for the
% example 
%[tm, signal]=rdsamp('challenge/2013/set-a/a01');
%[ann]=rdann('challenge/2013/set-a/a01','fqrs');
%plot(tm,signal(:,1));hold on;grid on
%plot(tm(ann),signal(ann,1),'ro','MarkerSize',4)
%
% or for rdann('mitdb/100', 'atr')
%
%But, rdann('chfdb/chf02','ecg') doesn't work. Specifying a different C 
%(channel) or 'type' parameter just returns an empty set. I think it's safe
%to say this chfdb isn't working with the toolkit.  I hope you can be
%understanding of this issue.

plot(tm, signal(:,1), 'r', tm, signal(:,2))
hold on
%plot(tm(ann), signal(ann, 1), 'ro', ...
%     tm(ann), signal(ann, 2), 'bo')
