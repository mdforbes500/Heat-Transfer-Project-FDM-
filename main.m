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

%Initializing coefficient matrix
A = zeros(N,N);

%Initializing constants matrix 
C = zeros(N,1);

%Balance matrix
filename = 'balance_matrix.csv';
B = csvread(filename);

%Nodes 1, 16, 30, 43, 55, 66, 76, 85, 93, 100
e = [1;16;30;43;55;65;75;85;93;100];
l = [2;17;31;44;56;67;77;86;94;101];
for i = 1:size(e,1)
    if i == 1
        A(e(i),e(i)) = A(e(i),e(i)) - 1;
        A(e(i),l(i)) = A(e(i),l(i)) + 1;
        C(e(i),1) = (q_gen*delta_x^2-2*q_out)/(2*k);
    end
    if i > 1
        A(e(i),e(i)) = A(e(i),e(i)) - 1;
        A(e(i),l(i)) = A(e(i),l(i)) + 1;
        C(e(i),1) = 5;
    end
end

%Nodes 15, 29, 42, 54, 65, 75, 84, 92, 99, 105  #FIXME
e = [15, 29, 42, 54, 65, 75, 84, 92, 105];
l = [14;28;41;53;64;74;83;91;98;104];
for i = 1:size(e,1)
    if i == 1
        A(e(i),e(i)) = A(e(i), e(i)) - 2;
        C(e(i)) = C(e(i)) - (q_out*delta_x + q_gen*delta_x^2)/(2*k);
        if mod(i,2) ~= 0
            A(e(i),l(i)) = A(e(i),l(i)) + 0.5;
        else
            A(e(i), l(i)) = A(e(i),l(i)) + 1;
        end
    else
        A(e(i),e(i)) = A(e(i), e(i)) - 3;
        C(e(i)) = C(e(i)) - (q_gen*delta_x^2)/(2*k);
        if mod(i,2) ~= 0
            A(e(i),l(i-1)) = A(e(i),l(i-1)) + 0.5;
        else
            A(e(i), l(i)) = A(e(i),l(i)) + 1;
        end
    end
end

%Nodes 101, 102, 103, 104, 105
e = [101;102;103;104;105];
for i = 1:size(e,1)
    T(e(i),1) = T_ign;
end

%Remaining nodes
e = [1:1:105];


%Solve
% T = A\C;

%Visualization of solution

