function [ R,Q ] = House( A )
%HouseholderQR: Compute QR decomposition of a rectrangular matrix A using
% Householder reflections. 

[m,n]=size(A);

if nargout > 1
    Q = eye(m);   % If Q is required then start with the identity matrix
end

R = 1;
Q = 1;
HA = A;
Q = eye(m);

for k=1:min(m,n)
    
    Qtemp = eye(m);
    % We now want to apply a reflection to the part 
    % of the matrix given by A(k:m,k:n).
    
    % Om vi använder HA så blir det: Q1*A*Q2*A*Q3*A... vi vill ju ha
    % Q1*Q2*Q3*A, så frågan är varför HA är användbar i fallet då n > 1

    [HA, H] = ApplyReflection(HA(k:m,k:n),HA(k:m,k));
    % Går att placera v i R eller A för att spara plats som andra metoder gör
    
    % If needed Apply the same reflection to the Q matrix.
    Qtemp(k:m,k:m) = H;
    Q = Qtemp*Q;
    R = Q*A;
end

end

















