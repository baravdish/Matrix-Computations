clear
clc
% ---------- Kommentarer ----------
% Den l�sningen kan skrivas om i generell form, vi f�r d� systemet:
% [x_k, x_k+1] = [0, 1; -0.5, 2.25]*[x_k-1, x_k]
% D.v.s. x_k = A*x_k-1
% Vi studerar A f�r att f�rst� hur stabilt/robust/k�nsligt systemet �r
A = [0, 1; -0.5, 2.25]
lambdas = eig(A) 
conditionA = cond(A) % Vi ser att conditionstalet �r "relativt" h�gt och kan ge problem vid iterativa ber�kningar
log10(cond(A)) %  > 1 , d.v.s.  vi kommer att f�rlora decimal-noggrannhet i l�sningen

% Fr�n detta f�r vi tv� punkter:
% 1. Fr�n Heath 2.3.4 Error Bound har vi: att vi f�rlorar 1 decimals
% noggrannhet relativt noggrannheten hos indata (vilket �r esp_machine).
% Och detta leder till cancellation. 
%
% 2. Fr�n punkt 1. s� kommer felet att v�xa eftersom l�sningen till
% systemet �r ocks� indata till systemet i n�sta iteration. D� �r
% l�sningen x_k indata x_k-1 f�r n�sta iteration. Felet/error/problemet
% v�xer d� f�r varje iteration.
%% Teoretisk l�sning
k = 1:225;

xTrueSingle = 4.^(1-k)./3;
n = 1:60;
xTrueDouble = 4.^(1-n)./3;
semilogy(xTrueSingle);
title('Differential equation - Exact solution')
ylabel('x_k')
xlabel('k')


%% Double precision

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

figure
semilogy(serie);
title('Differential equation - Double precision')
ylabel('x_k')
xlabel('k')

% Feluppskattning L1
figure
residual = abs(xTrueDouble' - serie);
semilogy(residual);
title('Differential equation - Error')
ylabel('residual')
xlabel('k')
%% Single precision
% Monotont avtagande hela tiden


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

semilogy(serie); % Visar ej negativa v�rden
semilogy(abs(serie));
% plot(serie);
title('Differential equation - Single precision')
ylabel('x_k')
xlabel('k')

% Feluppskattning L1
figure
residual = abs(xTrueSingle' - serie);
semilogy(residual);
title('Differential equation - Error')
ylabel('residual')
xlabel('k')












