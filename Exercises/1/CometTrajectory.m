% CometTrajectory: Simulation of a situation where one wants to find the
% orbit of a comet from observations of the comets position. This is done
% by fitting an ellipse to positional data. 
%
function [Coefs, residual] = CometTrajectory(PositionData)

% PositionData contains both x- and y-coordinates for the observations.
 
x = PositionData(1,:)';
y = PositionData(2,:)';

% Now create the least squares problem and solve it....

% b ska vara en kolumnvektor som innehåller -1, detta för att man kan flytta över 1 från VL till HL i uttrycket och då blir HL en kolumn med -1
b = -1*ones(length(y),1);

% Bygg upp systemet
A(:,1) = x.^2;
A(:,2) = x.*y;
A(:,3) = y.^2;
A(:,4) = x;
A(:,5) = y;

% rank(A)
% cond(A)

Ar = [A, b]; % Slå ihop till aguemented system
[R, Q] = HouseholderQR(Ar);

% LSS och Residual 
% Följande uttryck för att beräkna LSS och residualen finns under rubrik "Avoiding the Q" i kurs TANA15, föreläsning L03 QR-Decomposition, 
% 10 Agusti 2017, på slide eller sida 8 

n = size(A,2);
Rnew = R(1:n,:);
Qnew = Q(1:n,:);
gamma = R(1:n,end);
alpha = R(n+1,end);
% whos Qnew
% whos Rnew
% r = Qnew*b;

% Coefs = Rnew\gamma; 
Coefs = backSubstitution(Rnew,gamma,n);
residual = abs(alpha);
DisplayComet(Coefs,PositionData);
% size(b)
% size(Qnew)

  


          
