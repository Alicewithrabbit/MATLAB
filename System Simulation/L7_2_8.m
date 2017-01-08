close all
clc;clear;
K = 3;
num = K*10;
den = [0.5 1 0];
sys = tf(num,den);
margin(sys);

% w = 1rad/s mag = 25 phase = -117

b = 10^(-9/10);
T = 1/(sqrt(b)*0.5);

num1 = [b*T 1];
den1 = [T 1];

sys_af1 = tf(conv(num1,num),conv(den1,den1))
figure(1)
margin(sys_af1)

figure(2)
sys = tf(num/K,den)
G1 = feedback(sys,1);
G2 = feedback(sys_af1,1);
hold on
step(G1)
step(G2)
hold off