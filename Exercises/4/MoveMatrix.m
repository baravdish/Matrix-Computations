%MoveMatrix: Creates a matrix that represent camera, or object movement, while
% a picture is taken. 
%
% Usage:
%  >> A2=MoveMatrix(N,w);
% 
% where w represent the movement speed. That is a single pixel in the 
% original image will be smeared out over w+1 pixles. The movement is 
% assumed to be paralell to the x-axis.
%
function [A2]=MoveMatrix(N,w);

%
% We have a NxN block that represent movement within one row of the
% original image. This block can be created using spdiags for instance.
%
 A2=spdiags(ones(N,w+1),0:w,N,N);
%
% Now we make a block diagonal matrix using a kronecker product.
%
 A2=kron(speye(N) , A2);
