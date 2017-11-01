% -------------- Kommentar--------------
% Residualen f�r den exakta l�sningen och den numeriska/ber�knade l�sningen
% konvergerar mot v�rdet sqrt(2) (roten ur 2)
% 
% Eftersom vi har att epsilon = 10^-16 och e = 10^-2k 
% => s� ger det oss att e �r mindre �n epsilon f�r k > 8,
% d�rf�r s� konvergerar residualen/blir e inte mindre �n epsilon (dvs machine
% precision)
clear
clc


SIZE = 9;
e = 0;
A = [e, 1; 1, 1];
b = [1 + e, 2];
x_correct = [1, 1];
residual = zeros(SIZE, 1);
for k = 1:SIZE
    e = 10^(-2*k);
    A(1,1) = e;
    b(1,1) = 1 + e;
    x = gausselim(A,b);
    residual(k) = norm((x - x_correct));
end

plot(residual)
title('Error estimation')
ylabel('residual')
xlabel('k')
figure
semilogy(residual)
title('Semilog - Error estimation')
ylabel('residual')
xlabel('k')