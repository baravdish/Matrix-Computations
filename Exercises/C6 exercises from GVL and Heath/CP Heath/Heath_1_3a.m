% Uppgift: F�rklara varf�r uttrycket epsilon_mach ~= 3 * (4/3 - 1) - 1
% fungerar att anv�nda f�r att approximera epsilon_mach
%
% ----------- Kommentar -----------
% Tricket g�r ut p� att komma ner p� l�gsta m�jliga decimal som ej kan
% sparas exakt av datorn som anv�nder bin�r representation. D� tvingar man
% fram en avrundning fr�n 0.000...1 till n�rmaste l�gsta representation av
% ett decimaltal. 
% 4/3 kan inte skrivas exakt utan sparas med ett fel p� 16:e decimalen som
% f�ljer med.
%% Med format long
clear
clc

format long
a = 4/3 % Kan ej skrivas exakt i bin�r form, avrundas till 1.333333....3X
b = 3*(a - 1) % �r i teorin "o�ndligt n�ra" 1, kan ej skrivas exakt fr�n bin�r form, avrundas
epsilon_mach = b - 1 % Blir 0.000....1X, kan inte heller skrivas exakt, avrundas till l�gsta m�jliga avrundning
eps; % Matlabs inbyggda

difference = epsilon_mach + eps

%% Med format hex
clc
format hex
a = 4/3
b = 4/3 - 1 % Den 16:e och sista decimalen/biten avrundas till 4 ist�llet f�r 5
c = 3*(4/3 - 1) % H�r �r 16:e och sista biten e och inte f
epsilon_mach = 3*(4/3 - 1) - 1
eps
diff = epsilon_mach + eps