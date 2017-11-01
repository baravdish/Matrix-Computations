%% Double precision
% Monotont avtagande fram till k = 18, sedan växande
% 
clear
clc

x1 = 1/3;
x2 = 1/12;
xk = x2;

n = 60; % double
serie = zeros(n,1);
for k = 1:n
    xk = difference_eq_17(x2, x1);
    x1 = x2;
    x2 = xk;
    serie(k) = xk;
end

semilogy(serie);
%% Single precision
% Monotont avtagande hela tiden
clear
clc

x1 = single(1/3);
x2 = single(1/12);
xk = x2;

n = 225; % single
serie = single(zeros(n,1));
for k = 1:n
    xk = single(difference_eq_17(single(x2), single(x1)));
    x1 = x2;
    x2 = xk;
    serie(k) = xk;
end

semilogy(serie); % Visar ej negativa värden
semilogy(abs(serie));
% plot(serie);
