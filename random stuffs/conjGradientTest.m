function [norms] = conjGradientTest(A,b,N,limit)
% clear
% clc
% 
% n = 2000;
% m = 3000;
% A = randn(n,m);
% A = A * A';
% A = A + eye(n);
% At = A';
% 
% b = randn(n,1);

x = 0;

r(:,1) = b;
rho(1) = r(:,1)'*r(:,1);

for i = 1:N
   
    if sqrt(rho(i)) < limit
        break
    end
    
    % matlab börjar på 1
    if i <= 2
        p = r(:,i);
    else
        p = r(:,i) + (rho(i-1)/rho(i-2))*p; % p = r + B*p
    end
    
    w = A*p;
    alpha = rho(i)/(p'*w); % (r(i),r(i))/(Ap,p)
    x = x + alpha*p;
    r(:,i+1) = r(:,i) - alpha*w; % r(i+1) = r(i) - alpha*Ap
    rho(i+1) = r(:,i+1)'*r(:,i+1); 
    
end

norms = sqrt(sum(r.^2,1));
figure('NumberTitle', 'off', 'Name', 'Semilogy');
semilogy(norms);
figure('NumberTitle', 'off', 'Name', 'Plot');
plot(norms)
%%
% x = zeros(n,1);
% r(:,1) = b - A*x;
% zOld = A'*r;
% p = zOld;
% zNew = zOld;
% N = 10000;
% limit = 1e-5;
% for i = 1:N
%     
%    w = A*p;
%    alpha = (zNew'*zNew)/(w'*w);
%    x = x + alpha*p;
%    r(:,i+1) = r(:,i) - alpha*w;
%    
%    if sqrt(norm(r(:,i+1))) < limit
%        sqrt(norm(r(:,i+1)))
%        disp('hej')
%        break
%    end
%    
%    zOld = zNew;
%    zNew = At*r(:,i+1);
%    beta = (zNew'*zNew)/(zOld'*zOld);
%    p = zNew + beta*p;
%    
% end
% 
% result = sqrt(norm(r(:,end)));
% 
% if i == N    
%     displ('Was not fast enough, more iterations needed')
%     disp(['Got ' num2str(result)])
%     disp(['wanted ' num2str(limit)])
% else
%     disp(['Goal reached! Loop break at ' num2str(i) ', got ' num2str(result)])
% end
% 
% norms = sqrt(sum(r.^2,1));
% figure('NumberTitle', 'off', 'Name', 'Semilogy');
% semilogy(norms);
% figure('NumberTitle', 'off', 'Name', 'Plot');
% plot(norms)













