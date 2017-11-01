% Givens rotation: från två givna skalärer a och b så beräknar den här funktionen c = cos(theta) och s = sin(theta)  
% Input:
%       a: skalär
%       b: skalär
% Output:
%       c: skalär, c = cos(theta)
%       s: skalär, s = sin(theta)
%
% Referens: Algoritmen finns att hitta under Algorithm 5.1.3 sida 240 i GVL

function [c,s] = givens(a,b)

if b == 0
    c = 1;
    s = 0;
else
    if abs(b) > abs(a)
        tao = -a/b;
        s = 1/(sqrt(1 + tao^2));
        c = s*tao;
    else
        tao = -b/a;
        c = 1/(sqrt(1 + tao^2));
        s = c*tao;
    end
end

end