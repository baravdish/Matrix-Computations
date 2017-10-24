function [R] = QRUpdateRow(A)

[m, n] = size(A);
i = m;
for j = 1:i-1
    [c, s] = givens(A(j,j), A(i,j));
    A([j i],j:n) = [c, s; -s, c]'*A([j i],j:n);
end

R = A;
