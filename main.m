clc
clear
close all

%Define Constants
k = 0.02605; %W/m^2*K @ 25 degrees C
T_ign = 632 + 273.15; %K
q_gen = 522.43 * 10^6; %W/m^3
q_out = 706554; %W/m^2
delta_x = 20.0 * 10^-3; %m

%Number of nodes
N = 105;

%Balance matrix
filename1 = 'balance_matrix.csv';
B = csvread(filename1);

%Position matrix
filename2 = 'position_matrix.csv';
p = csvread(filename2);

%Coefficient matrix
filename3 = 'coefficient_matrix.csv';
A = csvread(filename3);



%Solve
% T = A\C;

%Visualization of solution

