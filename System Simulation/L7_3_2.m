close all
clc;clear;

%The first problem
[A,B,C,D] = rmodel(3);
[V,D2] = eig(A);

A_h = V\A*V;

%The second problem
k = 10;
z = -0.5;
p = [-5 -1.5 -1.5];

[A1,B1,C1,D1] = zp2ss(z,p,k);
[V1,J] = jordan(A1);
A1_h = V1\A1*V1;

%The third problem
num = [1 3 2];
den = [1 7 20 50];
[A3,B3,C3,D3] = tf2ss(num,den);
[CA31,CB31,CC31,CD31,T1] = canon(A3,B3,C3,D3,'modal');
[CA32,CB32,CC32,CD32,T2] = canon(A3,B3,C3,D3,'companion');



