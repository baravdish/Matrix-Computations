clear
clc

n = 1000;
y = zeros(n,1);
A = randi([1,1000], 1000, 1000);
x = randi([1,1000],1000,1);
% gaxpy
tic
for i = 1:n
    for j = 1:n
        y(i) = y(i) + A(i,j)*x(j);
    end
end
badTime = toc

% Modified
tic
for i = 1:n
    y = y + A(:,i)*x(i);
end
modTime = toc

badTime / modTime

