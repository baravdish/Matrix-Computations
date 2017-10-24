%BLURMATRIX:
%
% A matrix representing a Guassian point spread function. The parameter 
% sigma controls the width of the Gaussian point spread function and 
% thus the amount of smoothing (the larger the sigma, the wider
% the function and the more ill posed the problem).  If sigma is not
% specified, sigma = 0.7 is used.
%
% Usage:
%   
%   >>[A]=BlurMatrix(N,band,sigma)
%
function [A] = BlurMatrix(N,band,sigma)

% Initialization.

if (nargin < 2), band = 3; end
band = min(band,N);
if (nargin < 3), sigma = 0.7; end

% Construct the matrix as a Kronecker product.
z = [exp(-([0:band-1].^2)/(2*sigma^2)),zeros(1,N-band)];
A = toeplitz(z);
A = sparse(A);
A = (1/(2*pi*sigma^2))*kron(A,A);
