close all 
clc;clear;

num0 = 10;
den0 = [1 2 10];

num = [2 10];
den = [1 2 10];

num1 = [1 0.5 10];
den1 = [1 2 10];

sys0 = tf(num0,den0);
sys = tf(num,den);
sys1 = tf(num1,den1);

damp(sys0)

% [y,t,x] = impulse(sys0,2)
% [y,t,x] = impulse(sys0,[0:0.01:2])

figure(1)
impulse(sys0,'m',sys,'r',sys1,'g')
grid on
legend('System 0','System 1','System 2');