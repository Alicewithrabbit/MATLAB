close all
clc;clear;

T = 10;
T1 = 10;
T2 = 0.1;
k = 1;

num = 1;
den = [T 1 0];

sys = tf(num,den);
figure(1)
nyquist(sys)
grid
% axis([-2,10,-150,150])

num1 = [k*T1 k];
den1 = [T2 1 0];

sys1 = tf(num1,den1);
figure(2)
nyquist(sys1)

grid

num2 = [k*T2 k];
den2 = [T1 1 0];

sys2 = tf(num2,den2);
figure(3)
nyquist(sys2)
grid


den31 = [T2 1 0 0];
den32 = [T1 1 0 0];

sys31 = tf(num1,den31);
sys32 = tf(num2,den32);
figure(4)
nyquist(sys31)
grid
figure(5)
nyquist(sys32)
grid