clear
clc
A =  [2    -5    3;
     -1     8    5;
      4    -1    7;
      -1    3    2];
x = A(:,1); % I det här fallet använder vi A. Behöver inte alltid vara så.

ApplyReflection(A, x) % Applicera reflektion på första kolumnen
[R, Q] = HouseholderQR(A); % QR factorization med Householder
QQ = Q*Q' % Ska ge identitetsmatrisen
[Qreal, Rreal] = qr(A); % Det "korrekta" svaret
n = size(A,2);
Rnew = R(1:n,:);
Qnew = Q(1:n,:);
gamma = R(1:n,end);
alpha = R(n+1,end);

% Coefs = Rnew\gamma; % man kan också köra detta, ger samma resultat
Coefs = backSubstitution(Rnew,gamma,n); % man kan också köra detta, ger samma resultat
residual = abs(alpha)
%%
% clear
% clc

time = 0:0.25:15;
PositionData = CometObservation(time);
[Coefs, residual] = CometTrajectory(PositionData)
DisplayComet(Coefs, PositionData);

%% Kolla snabbheten bara för skojs skull
% clear
% clc
% 
% time = 0:0.01:5; % 251 element = 0,9 sek.....501 element = 6,5 sek
% 
% length(time)
% SIZE = 100;
% vars = ones(SIZE,1);
% 
% tic
% for i = 1:SIZE
%     PositionData = CometObservation(time);
%     [~, residual] = CometTrajectory(PositionData);
%     vars(i) = residual;
% end
% toc
% median(vars)
% max(vars)
% plot(vars)
