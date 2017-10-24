clear
clc

b = [3, 5, -2, 4]';
A = [2, -5, 3; -1, 8, 5; 4, -1, 7; -1, 3, 2];

% QR with householder transformation
R = HouseHolderQR();
R = R(1:3,:)
x = R(:,1:3)\R(:,4)

% Add new condition/equation to the system
R = [R; 1, 2, 6, 5]
R = givens_QR(R) % Solve it with Givens QR
R = R(1:3,:);
x = R(:,1:3)\R(:,4)

% Verify
x2 = [A; 1 2 6]\[b;5]
% Just checking how far it is from the "real" solution
norm(x-x2)