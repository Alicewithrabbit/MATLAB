close all
clc;clear;

%The first problem 
num = [1 1.3 2 2.5];
den = [1 0.3 1.2 1];

[A,B,C,D] = tf2ss(num,den);
[z,p,k] = tf2zp(num,den);

%The second problem

num1 = 0.5;
den1 = [0.1 1 0];
den2 = [0.05 1];


[A1,B1,C1,D1] = tf2ss(num1,den1);
[A2,B2,C2,D2] = tf2ss(num1,den2);

[A3,B3,C3,D3] = series(A1,B1,C1,D1,A2,B2,C2,D2);

[A4,B4,C4,D4] = parallel(A1,B1,C1,D1,A2,B2,C2,D2);

[A5,B5,C5,D5] = feedback(A1,B1,C1,D1,A2,B2,C2,D2);

[A6,B6,C6,D6] = append(A1,B1,C1,D1,A2,B2,C2,D2);

sys1 = tf(num1,den1);
sys2 = feedback(sys1,1);

sys3 = tf(num1,den2);
sys4 = feedback(sys2,1);

%The third problem
num3 = 10.*[0.2 1];
den3 = conv([1 0],conv([0.1 1],[0.5 1]));
sys5 = tf(num3,den3);
sys_fin = feedback(sys5,1);
num_fin = cell2mat(sys_fin.num);
den_fin = cell2mat(sys_fin.den);
[A7,B7,C7,D7] = tf2ss(num_fin,den_fin);




