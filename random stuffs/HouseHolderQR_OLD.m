function [R, Q, x] = HouseHolderQR(A,b, computeX, computeQ)

if nargin < 1
    A = [2, -5, 3; -1, 8, 5; 4, -1, 7; -1, 3, 2];
    b = [3, 5, -2, 4]';    
    A(:,end+1) = b;
    computeX = 0;
    computeQ = 0;
elseif nargin == 1
    computeX = 0;
    computeQ = 0;
    b = [3, 5, -2, 4]';
elseif nargin == 2
    computeX = 0;
    computeQ = 0;
elseif nargin == 3
    computeQ = 0;
end

% A = rand(20,20);
[m, n] = size(A);
U = A;
x = zeros(n,1);
Q = eye(m);
R = zeros(size(A));
B = zeros(n,1);

for j = 1:n
    if j ~= m
        [v, beta] = HH(A(j:m,j));
        I = eye(length(v),length(v));
        A(j:m, j:n) = (I - beta*(v*v'))*A(j:m,j:n);
        if j < m
            A((j+1):m, j) = v(2:m-j+1);
        end
        B(j) = 2/(1 + norm(A(j+1:m, j))^2);
    end
end

%% Extract R & Q
% R
for i = 1:m
    R(i,i:end) = A(i,i:n);
end

% Q
if computeQ == 1
    for j = n:-1:1
        if j ~= m
            v(j:m) = [1; A((j+1):m,j)];
            B(j) = 2/(1 + norm(A((j+1):m, j))^2);
            Q(j:m, j:end) = Q(j:m, j:end) - (B(j)*v(j:m))*(v(j:m)'*Q(j:m,j:end));
        end
    end
end

%% Ax = b
if computeX == 1
    for j = 1:n
        v = [1; A((j+1):m,j)];
        beta = 2/(v'*v);
        b(j:m) = b(j:m) - beta*(v'*b(j:m))*v;
    end
    x = R(1:n, 1:n)\b(1:n);
end
% x = backSubstitution(R(1:n,1:n),b,n);
