% Uppgift: Förklara varför uttrycket epsilon_mach ~= 3 * (4/3 - 1) - 1
% fungerar att använda för att approximera epsilon_mach
%
% ----------- Kommentar -----------
% Tricket går ut på att komma ner på lägsta möjliga decimal som ej kan
% sparas exakt av datorn som använder binär representation. Då tvingar man
% fram en avrundning från 0.000...1 till närmaste lägsta representation av
% ett decimaltal. 
% 4/3 kan inte skrivas exakt utan sparas med ett fel på 16:e decimalen som
% följer med.
%% Med format long
clear
clc

format long
a = 4/3 % Kan ej skrivas exakt i binär form, avrundas till 1.333333....3X
b = 3*(a - 1) % Är i teorin "oändligt nära" 1, kan ej skrivas exakt från binär form, avrundas
epsilon_mach = b - 1 % Blir 0.000....1X, kan inte heller skrivas exakt, avrundas till lägsta möjliga avrundning
eps; % Matlabs inbyggda

difference = epsilon_mach + eps

%% Med format hex
clc
format hex
a = 4/3
b = 4/3 - 1 % Den 16:e och sista decimalen/biten avrundas till 4 istället för 5
c = 3*(4/3 - 1) % Här är 16:e och sista biten e och inte f
epsilon_mach = 3*(4/3 - 1) - 1
eps
diff = epsilon_mach + eps