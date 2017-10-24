%HouseholderQR: Compute QR decomposition of a rectrangular matrix A using
% Householder reflections. 
%
function [R, Q] = HouseholderQR(A)

[m,n]=size(A);
R = 1;
Q = 1;
if nargout > 1
    Q=eye(m); % If Q is required then start with the identity matrix
end 

for k = 1:min(m,n)
    
    % We now want to apply a reflection to the part 
    % of the matrix given by A(k:m,k:n).
    v = A(k:m,k);
        A(k:m,k:n) = ApplyReflection(A(k:m,k:n),v);
    
    % Vi har att A = QR = H1H2H3R och att H3H2H1A = R
    
    % If needed Apply the same reflection to the Q matrix.
    if nargout > 1
%         Qr = eye(m);
%         Qr(k:m,:) = ApplyReflection(Qr(k:m,:),Ar(k:m,k));
%         Q = Q*Qr; % Se föreläsning 3 slide 2: Q = Q3Q2Q1, eller Q = Q1'Q2'Q3'
        Q(k:m,:) = ApplyReflection(Q(k:m,:),v);
    end
end
Q = Q';
R = A;
% Check if augumented system
% if any(isnan(A(:))) == 1
%    R = A(:,1:(end-1));
% else
%    R = A; 
% end

% Qreal =
%    -0.4264    0.3246    0.7836   -0.3142
%     0.2132   -0.8169    0.2684   -0.4638
%    -0.8528   -0.4220   -0.1933    0.2394
%     0.2132   -0.2218    0.5258    0.7930
