clear
clc

n = 100;

A = rand(n) + n*eye(n);
b = ones(n,1);
b = b/norm(b);

m = 20;
V = zeros(n,m+1);
V(:,1) = b;
H = zeros(m+1,m);

for j = 1:m
    % Pick a vector from V
    vj = V(:,j);
    % Apply A
    u = A*vj;
    
    % Gram-Schmidt => Make sure every previous vector is orthogonal with
    % the current vector vj
    for i = 1:j
        H(i,j) = dot(u,V(:,i));
        u = u - H(i,j)'*V(:,i);
    end
    
    H(j+1,j) = norm(u);
    
    if H(j+1,j) == 0
        break
    end
    
    % Rewrite V so it has orthonormal vectors
    V(:,j+1) = u/H(j+1,j);
    
end

% Q = V(:,2:end);
EYE = V'*V
%map = EYE < 0.1;
%EYE(map) = 0;





    


