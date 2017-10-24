clear
clc

n = 2000;
m = 3000;
A = randn(n,m);
A = A * A'; % symmetrisk
A = A + eye(n); %  diagonal-dominant => pos. def.

tic
cond(A)
toc

b = randn(n,1);

N = 10000;
limit = 1e-6;

% norms = conjGradientTest(A,b,N,limit);

% normsNR = CGNRtest(A,b,n,N,limit);
