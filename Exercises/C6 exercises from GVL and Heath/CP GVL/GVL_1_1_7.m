function [eltime] = GVL_1_1_7(m, n, r)

A = round(100*rand(m,r));
B = round(100*rand(r,n));
C = round(100*rand(m,n));

% [m, r] = size(A);
% [~, n] = size(C);
tic
for j = 1:n
    for k = 1:r
            C(:,j) = C(:,j) + A(:,k)*B(k,j);
    end
end
eltime = toc;


end