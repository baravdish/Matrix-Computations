% DisplayCometPath: The comet trajectory is an ellipse that is defined 
% by a set of parameters:
%
%  Coefs(1)*x^2+Coefs(2)*x*y+Coefs(3)*y^2+Coefs(4)*x+Coefs(5)*y+1=0;
%
% This subroutine plots the ellipse defined by the vector Coefs. We
% also plot the position data used for the ellipse fitting.
%
function [] = DisplayComet( Coefs , PositionData )
  
 % Create a string with the function expression and use ezplot. 
   
  str=[num2str(Coefs(1),'%16.12e'),'*x^2+',num2str(Coefs(2),'%16.12e')];
  str=[str,'*x*y+',num2str(Coefs(3),'%16.12e'),'*y^2+'];
  str=[str,num2str(Coefs(4),'%16.12e'),'*x+',num2str(Coefs(5),'%16.12e')];
  str=[str,'*y+1'];
  clf
  hold on, ezplot(str,[0 20 -10 10]);
  hold off
  hold on, plot( PositionData(1,:),PositionData(2,:),'kx'), hold off
  axis equal;axis([4 16 -8 4]);
  display('Plotting Observations and best Ellipse fit');