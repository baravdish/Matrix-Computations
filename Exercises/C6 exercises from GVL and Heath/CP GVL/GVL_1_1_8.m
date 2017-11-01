function [eltime] = GVL_1_1_8(m, n, r)

A = round(100*rand(m,r));
B = round(100*rand(r,n));
C = round(100*rand(m,n));

% [m, r] = size(A);
% [~, n] = size(C);
tic
for k = 1:r
    C = C + A(:,k)*B(k,:);
end
eltime = toc;


end