%% d) Single precision
clear
clc

% För N = 10^8 så tar det 1 sekund, vid n = 2100 så konvergerar serien mot 15.4
% För N = 10^9 så tar det 26 sekunder, 
% Vid n = 2097151 så konvergerar serien mot 15.4 
tic
SIZE = 10^7;
serie = single(ones(SIZE,1));
% serie = single(1);
n = single(2);
while n <= SIZE
    serie(n) = single(serie(n-1) + single(1/n));
%     serie = serie + single(1/n);
    n = n + 1;
end
toc
semilogx(serie(1:1000:end))
title('Single precision sum')
ylabel('Partial sum of the series');
xlabel('n')
%% d) Double precision
% För N = 10^8 så tar det 1.2 sekunder, serien är "divergent" (konvergerar
% extremt långsamt)
% För N = 10^9 så tar det 28 sekunder, serien är "divergent" (konvergerar
% extremt långsamt)
tic
SIZE = 10^8;
serie = ones(SIZE,1);
% serie = 1;
n = 2;
while n <= SIZE
    serie(n) = serie(n-1) + 1/n;
%     serie = serie + 1/n;
    n = n + 1;
end
toc
semilogx(serie(1:1000:end))
title('Single precision sum')
ylabel('Partial sum of the series');
xlabel('n')








