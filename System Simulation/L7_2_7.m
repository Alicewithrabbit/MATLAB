close all
clc;clear;
K = 4;
num = K*10;
den = [0.5 1 0];
sys = tf(num,den);
margin(sys);
%w = 6.17rad/s mag = -0.0015 phase = -162 Kv0 = 0.05
% margin(sys)
Phi = (45 - 18)*pi/180
a = (1 + sin(Phi)/(1 - sin(Phi)));
T = 1/(sqrt(a)*6.17);

num1 = [1 1/a*T];
den1 = [1 1/T];
% 
num_af = conv(num,num1);
den_af = conv(den,den1);

sys_af = tf(num_af,den_af)
% [Gm,Pm,Wcg,Wcp] = margin(sys_af)
figure(1)
margin(sys_af)
figure(2)
sys = tf(10,den);
G1 = feedback(sys,1);
G2 = feedback(sys_af,1);
step(G1);grid
hold on
step(G2);grid
hold off


