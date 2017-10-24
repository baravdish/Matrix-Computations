function [v, beta] = HH(x)

m = length(x);
if m == 1
    v = 1;
    beta = 0;
else
    sigma = x(2:m)'*x(2:m);
    v = [1; x(2:m)];
    beta = 0;

    if sigma == 0 && x(1) >= 0
        beta = 0;
    elseif sigma == 0 && x(1) < 0
        beta = -2;
    else
        my = sqrt(x(1)*x(1) + sigma);
        if x(1) <= 0
            v(1) = x(1) - my;
        else
            v(1) = -sigma/(x(1) + my);
        end
        beta = 2*v(1)*v(1)/(sigma + v(1)*v(1));
        v = v/v(1);
    end
end


end

end




