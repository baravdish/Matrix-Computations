%CircleData: Creates random points located near a circle with 
% specified center and radius.
%
% Usage:
%   >> [X,Y]=CircleData( z , r , m , tol );
%
% generates vectors (X,Y) containing m points near the circle with  
% radius r and center z=(z1,z2). The error in the points is normally 
% distributed with variance tol.
%
function [x,y] = CircleData( z,r,m, tol )

  alpha=2*pi*rand(m,1);alpha=sort(alpha);
  x=r*cos(alpha)+z(1)+tol*randn(m,1);
  y=r*sin(alpha)+z(2)*tol*randn(m,1);

end

