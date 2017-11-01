function [eltime] = GVL_1_1_5(m, n, r)

A = round(100*rand(m,r));
B = round(100*rand(r,n));
C = round(100*rand(m,n));

% [m, r] = size(A);
% [~, n] = size(C);
tic
for i = 1:m
    for j = 1:n
        for k = 1:r
        	C(i,j) = C(i,j) + A(i,k)*B(k,j);
        end
    end
end
eltime = toc;


end