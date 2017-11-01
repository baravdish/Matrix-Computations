function [df] = df_central(fun, a, b, h)

x = a:h:b;
df = (fun(x+h) - fun(x-h))/2*h;
