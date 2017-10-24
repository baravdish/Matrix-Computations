%% 3.1 QR
clear
clc

% Initial matrix
A = [1, 2, 3, 4;
     2, 2, -1, -4;
     3, -1, 3, 1;
     4, -4, 1, 4;];
 
%  Reduce to Hessenberg form
[V, A] = hess(A);

B = A;
N = 10;
for k = 1:N
    [Q, R] = qr(B);
    B = R*Q;
end

Avec = (eigs(A))
Bvec = (diag(B))
 
norm(Avec(1) - Bvec(end))
%% 3.2 - QR shift
clear
clc

A = [1, 2, 3, 4;
     2, 2, -1, -4;
     3, -1, 3, 1;
     4, -4, 1, 4;];
[V, A] = hess(A);

B = A;
N = 3;
for k = 1:N
    s = B(4,4);
    [Q, R] = qr(B - s*eye(4));
    B = R*Q + s*eye(4);
end

Avec = (eigs(A))
Bvec = (diag(B))

norm(Avec(2) - Bvec(end))













