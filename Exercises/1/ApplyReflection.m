%ApplyReflection: Compute the product H*A where H is a 
% Householder reflection matrix such that H*x=norm(x)*e1.

function [HA] = ApplyReflection(A,x)

% "Find the vector v so that H(v)*x=alpha*e1." 
I = eye(max(size(A)));
v = 1;
e1 = eye(size(x));
alpha = sign(x(1))*norm(x);
v = x - alpha*e1;
% H = I - 2 * (v*v')/(v'*v); % Den behöver inte sparas explicit. Räcker med v.

HA = A - 2*v*(v'*A)/(v'*v);


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    