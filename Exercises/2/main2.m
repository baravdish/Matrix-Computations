clc
clear
A =  [2    -5    3;
     -1     8    5;
      4    -1    7;
     -1     3    2];

b = [3, 5, -2, 4]';

% QR-factorization on augumented system A, b
R = HouseholderQR([A, b])
R = R(1:3,:) % Ta bort sista raden
xr = R(:,1:3)\R(:,4)

R = [R; 1, 2, 6, 5] % Ny data läggs till
R = QRUpdateRow(R) % Uppdatera R, bara för den sista raden
R = R(1:3,:) % Ta bort sista raden
x2 = R(:,1:3)\R(:,4) 


x = [A; 1 2 6]\[b;5]

% Inbyggda
% [Q, R] = givensqr(A)

% Rreal =
% 
%    -4.6904    5.3300   -5.7564
%          0   -8.4018   -6.5083
%          0         0    3.3920
%          0         0         0