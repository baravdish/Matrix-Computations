function [norms] = CGNRtest(A,b,n,N,limit)

x = zeros(n,1);
r(:,1) = b - A*x;
uOld = A'*r;
p = uOld;
uNew = uOld;
% N = 10000;
% limit = 1e-5;
for i = 1:N
    
   w = A*p;
   alpha = (uNew'*uNew)/(w'*w);
   x = x + alpha*p;
   r(:,i+1) = r(:,i) - alpha*w;
   
   if sqrt(norm(r(:,i+1))) < limit
       sqrt(norm(r(:,i+1)))
       disp('hejhej bryt loop')
       break
   end
   
   uOld = uNew;
   uNew = A'*r(:,i+1);
   beta = (uNew'*uNew)/(uOld'*uOld);
   p = uNew + beta*p;
   
end

result = sqrt(norm(r(:,end)));

if i == N    
    displ('Fler iterationer behövs')
    disp(['Landade på ' num2str(result)])
    disp(['ville ha ' num2str(limit)])
else
    disp(['Vi är i hamn! Loop break vid ' num2str(i) ', fick ' num2str(result)])
end

norms = sqrt(sum(r.^2,1));
figure('NumberTitle', 'off', 'Name', 'Semilogy');
semilogy(norms);
figure('NumberTitle', 'off', 'Name', 'Plot');
plot(norms)