% TestImage: Creates a simple test image for use with the image 
% reconstruction exercise. 
% 
% Usage:
%  >> X = TestImage(N);
%
function [X]=TestImage(N)
  
  x=(0:N-1)/(N-1);
  [xx,yy]=meshgrid(x);
  X=zeros(size(xx));
  
  ind=find( xx >= 3/16 & xx <= 4/16 & yy >= 5/16 & yy <= 13/16 );
  X(ind)=1;
  
  ind=find( xx >= 1/16 & xx <= 5/16 & yy >= 11/16 & yy <= 13/16 );
  X(ind)=1;  

  ind=find( xx >= 3/16 & xx <= 7/16 & yy >= 10/16 & yy <= 12/16 );
  X(ind)=1;
  
  
