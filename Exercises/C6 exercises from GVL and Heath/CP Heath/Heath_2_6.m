clear
clc
% ----------------- Kommentarer -----------------
% Fr�n Heath 2.3.4 Error Bound har vi: Antag att indata i systemet har
% en noggrannhet p� machine precision; d� f�rlorar den ber�knade l�sningen
% ungef�r log10(cond(A)) decimalers noggrannhet relativt till noggranheten
% hos indata (vilket �r eps_machine)
% Med 4 siffrors noggrannhet s� ger n = 10 ett fel p� 4 decimaler, se
% variabeln p_norm_error l�ngre ned. D.v.s. om n > 9 s� r�knar vi med
% totalt fel (100%) bland elementen i vektorn x_hat, som ocks� finns definierad l�ngre ned.
% 
% condition_number_vector �r en vektor med konditionstalet cond(H) f�r H med storlek nxn,
% d�r n g�r fr�n 1,2,3...osv. Vi kan se p� grafen att f�r n > 12 s�
% varierar matrisens konditionstal, som avtar/�kar i takt med att n �kar. 
% Detta beror p� att matrisen �r n�stan singul�r och ger d�rf�r op�litlig feluppskattning.

n = 10;
H = hilb(n); % Skapa en hilbert matris
x = ones(n,1);
b = H*x;

x_hat = H\b; % L�s ut en approximativ l�sning
% x_hat = gausselim(H,b); => Ger samma residual/norm/error som H\b
r = b - H*x_hat;
p_norm_residual = max(abs(r))

absolute_error = x_hat - x;
p_norm_error = max(abs(absolute_error))
% Fr�n Heath s. 61 samt exempel 2.7, f�r vi:

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