%Group 5 2D Conduction Project

%Malcolm D. Forbes
%Kristin Lewis
%Phiet Vo
%Vartan Tenkerian

clc
clear
close all

%Number of nodes
N = 30;

%Balance matrix
filename1 = 'balance_matrix.csv';
B = csvread(filename1);

%Position matrix
filename2 = 'position_matrix.csv';
p = csvread(filename2);

%Coefficient matrix
filename3 = 'coefficient_matrix.csv';
A = csvread(filename3);

%Constants matrix
filename4 = 'constants_vector.csv';
C = csvread(filename4);


%Solve
T = zeros(N,1);
T(1:27,1) = A(1:27,1:27)\C(1:27,1);
for i = 28:30
    T(i) = 905.15;
end

Temp_grid = zeros(5,8);
Temp_grid(1,1) = T(1);
Temp_grid(1,2) = T(2);
Temp_grid(1,3) = T(3);
Temp_grid(1,4) = T(4);
Temp_grid(1,5) = T(5);
Temp_grid(1,6) = T(6);
Temp_grid(1,7) = T(7);
Temp_grid(1,8) = T(8);
Temp_grid(2,2) = T(9);
Temp_grid(2,3) = T(10);
Temp_grid(2,4) = T(11);
Temp_grid(2,5) = T(12);
Temp_grid(2,6) = T(13);
Temp_grid(2,7) = T(14);
Temp_grid(2,8) = T(15);
Temp_grid(3,3) = T(16);
Temp_grid(3,4) = T(17);
Temp_grid(3,5) = T(18);
Temp_grid(3,6) = T(19);
Temp_grid(3,7) = T(20);
Temp_grid(3,8) = T(21);
Temp_grid(4,4) = T(22);
Temp_grid(4,5) = T(23);
Temp_grid(4,6) = T(24);
Temp_grid(4,7) = T(25);
Temp_grid(4,8) = T(26);
Temp_grid(5,5) = T(27);
Temp_grid(5,6) = T(28);
Temp_grid(5,7) = T(29);
Temp_grid(5,8) = T(30);

%Visualization of solution
x = 0:-0.04:-0.28;
y = 0.02:0.04:0.18;
[X, Y] = meshgrid(x,y);
alpha = fliplr(X);
beta = flipud(Y);
figure
C = contourf(alpha,beta,Temp_grid);
clabel(C)
title('Steady State Solution for Combustor Mixing Cone');
xlabel('Distance from midline (m)')
ylabel('Distance from igniter (m)')

