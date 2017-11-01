%% Double precision
% Monoton avtagande funktion fram till k = 20, sedan växande
clear
clc

x1 = 1/3;
x2 = 1/12;

n = 60; % double
serie = zeros(n,1);
serie(1) = x1;
serie(2) = x2;
for k = 2:(n-1)
    xk = difference_eq_17(serie(k), serie(k-1));
    serie(k+1) = xk;
end

semilogy(serie);
title('Differential equation')
ylabel('x_k')
xlabel('k')
%% Single precision
% Monotont avtagande hela tiden
clear
clc

x1 = single(1/3);   
x2 = single(1/12);

n = 225; % single
serie = single(zeros(n,1));
serie(1) = x1;
serie(2) = x2;
for k = 2:(n-1)
    xk = single(difference_eq_17(single(serie(k)), single(serie(k-1))));
    serie(k+1) = xk;
end

semilogy(serie); % Visar ej negativa värden
semilogy(abs(serie));
% plot(serie);
title('Differential equation')
ylabel('x_k')
xlabel('k')
%% Teoretiskt lösning
clear
clc

k = 1:225;

xk = 4.^(1-k)./3;
semilogy(xk);
title('Differential equation')
ylabel('x_k')
xlabel('k')












