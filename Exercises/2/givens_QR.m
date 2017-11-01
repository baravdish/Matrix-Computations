% Given rotation på hela matrisen, inte bara uppdatering av en rad 

function [A] = givens_QR(A)

[m,n] = size(A);

for j = 1:n
    for i = m:-1:(j+1)
        [c, s] = givens(A(i-1,j), A(i,j));
        A(i-1:i,j:n) = [c, s; -s, c]'*A(i-1:i, j:n);
    end
end


end