%% (A) Finita differensmetoden - framåt
clear
clc
% Heath, Computer Problem 1.7:
% a) Gör ett program för finita differensmetoden. Testa för tan(x) för x = 1
% b) Jämför felet (error) med kvadraten av sec(x) som är inbyggd funktion
% Plotta magnituden av felet som en funktion av h, för h = 10^-k, k =
% 0,...,16. Använd log-skalan för h och för magnituden av felet.
% c) Finns det ett minimum värde för magnituden av felet?
% d) Hur står sig värdet på h mot tumregeln h ~ sqrt(e_mach) från exempel 1.3?

% a)
a = 1;
b = 1;
h = 10e-6;
f = @(x)tan(x);

n = 15;
df_numerical = zeros(n+1,1);
df_exact = sec(1)^2;
h_range = zeros(n+1,1);
for k = 0:n
    h_range(k+1) = 10^(-k);
    df_numerical(k+1) = df_forward(f, a, b, h_range(k+1));
end

% b)
error = abs(df_numerical - df_exact);
loglog(h_range, error)
title('Forward');
ylabel('Error');
xlabel('h')

% c) Ja, felet har sitt minimum vid k = 8 och h = 10^-8, se figur
% d) Tumregeln säger att: 
% h_thumbrule ~= sqrt(eps) ~= 1.5*10^-8 ~= 10^-8 = h
h_thumbrule = sqrt(eps)

%% (B) Central-differens

% a)
a = 1;
b = 1;
h = 10e-6;
f = @(x)tan(x);

n = 15;
df_numerical = zeros(n+1,1);
df_exact = sec(1)^2;
h_range = zeros(n+1,1);
for k = 0:n
    h_range(k+1) = 10^(-k);
    df_numerical(k+1) = df_central(f, a, b, h_range(k+1));
end

% b)
error = abs(df_numerical - df_exact);
loglog(h_range, error)
loglog(h_range, error)
title('Central');
ylabel('Error');
xlabel('h')
h_thumbrule = sqrt(eps)











