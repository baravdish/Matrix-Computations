clear
clc
% ----------------- Kommentarer -----------------
% Från Heath 2.3.4 Error Bound har vi: Antag att indata i systemet har
% en noggrannhet på machine precision; då förlorar den beräknade lösningen
% ungefär log10(cond(A)) decimalers noggrannhet relativt till noggranheten
% hos indata (vilket är eps_machine)
% Med 4 siffrors noggrannhet så ger n = 10 ett fel på 4 decimaler, se
% variabeln p_norm_error längre ned. D.v.s. om n > 9 så räknar vi med
% totalt fel (100%) bland elementen i vektorn x_hat, som också finns definierad längre ned.
% 
% condition_number_vector är en vektor med konditionstalet cond(H) för H med storlek nxn,
% där n går från 1,2,3...osv. Vi kan se på grafen att för n > 12 så
% varierar matrisens konditionstal, som avtar/ökar i takt med att n ökar. 
% Detta beror på att matrisen är nästan singulär och ger därför opålitlig feluppskattning.

n = 10;
H = hilb(n); % Skapa en hilbert matris
x = ones(n,1);
b = H*x;

x_hat = H\b; % Lös ut en approximativ lösning
% x_hat = gausselim(H,b); => Ger samma residual/norm/error som H\b
r = b - H*x_hat;
p_norm_residual = max(abs(r))

absolute_error = x_hat - x;
p_norm_error = max(abs(absolute_error))
% Från Heath s. 61 samt exempel 2.7, får vi:

condition_number_vector = zeros(n,1);
for k = 1:n
    condition_number_vector(k) = log10(cond(hilb(k)));
end

% semilogy(condition_number)
plot(condition_number_vector);

%% Kladd/test/anteckningar

% SIZE = 3;
% n = 1:SIZE;
% vec = ones(1,SIZE);
% N = vec./n
% 
% A = zeros(SIZE);
% 
% for k = 1:SIZE
%    
%     A(k:end,k) = N(k:end);
%     A(k,k:end) = N(k:end);
%     
%     
% end