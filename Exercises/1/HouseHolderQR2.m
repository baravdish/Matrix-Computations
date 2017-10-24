clear
clc

% A = rand(20,20);
A = [2, -5, 3; -1, 8, 5; 4, -1, 7; -1, 3, 2];
b = [3, 5, -2, 4]';
[m, n] = size(A);
U = A;

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
R = zeros(size(A));
for i = 1:m
    R(i,i:end) = A(i,i:n);
end

Q = eye(m);

for j = n:-1:1
    if j ~= m
        v(j:m) = [1; A((j+1):m,j)];
        B(j) = 2/(1 + norm(A((j+1):m, j))^2);
        Q(j:m, j:end) = Q(j:m, j:end) - (B(j)*v(j:m))*(v(j:m)'*Q(j:m,j:end));
    end
end

Rclean = R(1:n, 1:n);
%% Ax = b
for j = 1:n
    v = [1; A((j+1):m,j)];
    beta = 2/(v'*v);
    b(j:m) = b(j:m) - beta*(v'*b(j:m))*v;
end

x = Rclean\b(1:n);
% x = backSubstitution(R(1:n,1:n),b,n);
