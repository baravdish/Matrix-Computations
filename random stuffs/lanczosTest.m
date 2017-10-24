% Lanczos algorithm
% Gabriel Baravdish
clear
clc

n = 1000;
m = 20;
% Skapa en random matrix
A = rand(n);
% Symmetri
A = A*A';
% Diagonal dominant => positive definite matrix
A = A + eye(n);

% Initiera
q0 = zeros(n,1);
q1 = rand(n,1);
rk = q1;

k = 1;
b(1) = 1;
I = eye(n);
Q(:,1) = q1;
alpha(1) = 0;
nIterations = 1000;

while b(k) ~= 0
    
    Q(:,k+1) = rk/b(k);
    k = k + 1;
    alpha(k) = Q(:,k)'*A*Q(:,k);
    
    if length(b) == 1 % första iterationen
        rk = (A - alpha(k)*I)*Q(:,k) - 0*q0;
    else
        rk = (A - alpha(k)*I)*Q(:,k) - b(k-1)*Q(:,k-1);
    end
    
    b(k) = norm(rk);
    
    if k > nIterations
        break
    end
    
end

% Q = Q(:,2:(end));
% EYE = Q'*Q;
% figure
% plot(1:k,b)



% %%
% n = 100;
% m = 20;
% % Random matrix
% A = rand(n);
% % Symmetric
% A = A*A';
% % Diagonal dominant => positive definite matrix
% A = A + n*eye(n);
% 
% V(:,2) = ones(n,1);
% V(:,1) = zeros(n,1);
% beta(1) = 0;
% 
% for j = 1:(m-1)
%     
%     wj = A*V(:,j+1);
%     
%     alpha(j) = wj'*V(:,j+1);
%     
%     wj = wj - alpha(j)*V(:,j+1) - beta(j)*V(:,j);
%     beta(j+1) = norm(wj);
%     V(:,j+2) = wj/beta(j+1);
% %     if norm(rj) == 0
% %         break
% %     end
% 
% end
%     
% wm = A*V(:,m);
% alpha(m) = wm'*V(:,m);
% 
% Q = V(:,1:(end-1));
% EYE = Q'*Q;
% T = Q'*A*Q;
% 
% %%
% 
% % Iteration with j=0
% rk=rand(n,1);
% bk=sqrt(rk'*rk);
% q1=rk/bk;
% a1=q1'*A*q1;
% % Iteration with j=1
% r1=A*q1-a1*q1;
% b1=sqrt(r1'*r1)
% q2=r1/b1;
% a2=q2'*A*q2
% 
% % Iteration with j=2
% r2=A*q2-a2*q2-b1*q1;
% b2=sqrt(r2'*r2)
% q3=r2/b2;
% a3=q3'*A*q3
% 
% % Create matrix Q
% Q=[q1 q2 q3];
% % Check orthogonality
% EYE=Q'*Q
% % Check the tridiagonal truncation
% T=Q'*A*Q