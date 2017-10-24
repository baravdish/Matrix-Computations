% Notering: Vi har också att A^m * x -> (konvergerar) mot multipel av dominant
% egenvektor => vektor med dominerande/högsta egenvärdet. D.v.s. vektorerna
% i slutet kommer att "gå mot att vara" parallella/linjärt beroende
% Därför är Den här iterationen inte bra.
% ======= Det kan lösas med att se till att vektorerna är ortogonala ======
clear
clc


n = 100;
A = rand(n) + n*eye(n);
b = ones(n,1);
K = b;
SIZE = n-1;
residual = ones(SIZE,1);
for m = 1:SIZE
    % LS
    x = (A*K)\b;
    % Approximate
    xm = K*x;
    residual(m) = norm(b-A*xm);
    K(:,m+1) = A*K(:,m);
end

semilogy(1:SIZE, residual)