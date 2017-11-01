%% d) Single precision
clear
clc

% F�r N = 10^8 s� tar det 1 sekund, vid n = 2100 s� konvergerar serien mot 15.4
% F�r N = 10^9 s� tar det 26 sekunder, 
% Vid n = 2097151 s� konvergerar serien mot 15.4 
tic
SIZE = 10^8;
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

%% d) Double precision
% F�r N = 10^8 s� tar det 1.2 sekunder, serien �r divergent 
% F�r N = 10^9 s� tar det 28 sekunder, serien �r divergent
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











