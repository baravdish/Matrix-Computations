function [df] = df_forward(fun, a, b, h)

x = a:h:b;
df = (fun(x+h) - fun(x))/h;
