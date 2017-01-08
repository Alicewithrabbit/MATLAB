close all
clc;clear;

num = 80;
den = [5 1 0];
sys = tf(num,den);
figure(1)
margin(sys)
sys_m = feedback(sys,1)
figure(2)
step(sys_m)

num1 = [0.8 0];
den1 = [1];

sys_h = tf(num1,den1)
sys_m1 = feedback(sys,sys_h);
sys_m2 = feedback(sys_m1,1)
figure(3)
step(sys_m2)