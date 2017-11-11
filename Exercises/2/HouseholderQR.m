%HouseholderQR: Compute QR decomposition of a rectrangular matrix A using
% Householder reflections. 
%
function [R, Q] = HouseholderQR(A)

[m,n]=size(A);
R = 1;
Q = 1; % F�r error annars, variabeln m�ste vara definierad.
if nargout > 1
    Q = eye(m); % If Q is required then start with the identity matrix
end 

for k = 1:min(m,n)
    
    % We now want to apply a reflection to the part 
    % of the matrix given by A(k:m,k:n).
    v = A(k:m,k); % Sparar kolumnvektorn v f�r varje iteration 
        A(k:m,k:n) = ApplyReflection(A(k:m,k:n),v);
    
    % Vi har att A = QR = H1H2H3R och att H3H2H1A = R
    
    % If needed Apply the same reflection to the Q matrix.
    if nargout > 1
%         Qr = eye(m); % G�r att g�ra p� det h�r s�ttet ocks� men det �r ganska on�digt/kr�ngligt
%         Qr(k:m,:) = ApplyReflection(Qr(k:m,:),Ar(k:m,k));
%         Q = Q*Qr; % Se f�rel�sning 3 slide 2: Q = Q3Q2Q1, eller Q = Q1'Q2'Q3'
        Q(k:m,:) = ApplyReflection(Q(k:m,:),v); % Vi utf�r reklektion med Q
    end
end
Q = Q'; % Transponat
R = A;

% Om uppgiften �r f�r augumented system
% if any(isnan(A(:))) == 1
%    R = A(:,1:(end-1));
% else
%    R = A; 
% end