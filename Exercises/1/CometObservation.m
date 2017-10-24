% CometPosition: Make observations of the Comet position at
% certain times and with a certain noise level.
%
function [PositionData] = CometObservation(Time ,NoiseLevel)

if nargin < 2
    NoiseLevel = 1e-3;
end  % Default Noiselevel

% Create a set of observation of the Comet position at certain times.
% At time t=0 the comet is positioned at "angle theta=0" and it 
% travels with a constant angle-velocity. 
  
  CometAngleVelocity = 0.57;
  theta = Time*CometAngleVelocity;
  P = [3,1;-2,4]*[sin(theta); 
                  cos(theta)];
  
  P = P + NoiseLevel*randn(size(P));
  PositionData = P + [10,0;0,-3]*ones(size(P));