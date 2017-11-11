clear
clc
% Kapitel 6 i GVL = C4
% Kapitel 4.2 i Heath = C3

% Computer Excerise 2: Eigenvalues

% 2.1
A = [1, 2, 3, 4; 
    2, 2, -1, -4;
    3, -1, 3, 1;
    4, -4, 1, 4];

[n, m] = size(A);
I = eye(n,m);

[V, H] = hess(A);

eigH = eig(H)
eigA = eig(A)
lambdaA = eigA(2);
%% 3.1 The QR algorithm

B = A;
N = 10;
for k = 1:N
    [Q,R] = qr(B);
    B = R*Q;
end

B
lambdaB = B(4,4);
% Felet är cirka: 2.854998459866920e-10
error = abs(lambdaA - lambdaB)

%% 3.2 The QR algorithm with Shift
lambdaA = eigA(3);
B = A;
N = 3;
for k = 1:N
    sigma = A(end,end);
    [Q,R] = qr(B - sigma*I);
    B = R*Q + sigma*I;
end

B
lambdaB = B(4,4);
% Felet är cirka: 7.8907e-05
error = abs(lambdaA - lambdaB)
    

%% 3.3 QR Algorithm computing all eigenvalues






    
    
    
    
    
    
    
    
    
    
    
    
    
    