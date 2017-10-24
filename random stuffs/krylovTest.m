% Notering: Vi har ocks� att A^m * x -> (konvergerar) mot multipel av dominant
% egenvektor => vektor med dominerande/h�gsta egenv�rdet. D.v.s. vektorerna
% i slutet kommer att "g� mot att vara" parallella/linj�rt beroende
% D�rf�r �r Den h�r iterationen inte bra.
% ======= Det kan l�sas med att se till att vektorerna �r ortogonala ======
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