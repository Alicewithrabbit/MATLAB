close all 
clc;clear;
num0 = 10;
den0 = [1 2 10];

num = [2 10];
den = [1 2 10];

num1 = [1 0.5 10];
den1 = [1 2 10];

num2 = [1 0.5 0];
den2 = [1 2 10];

num3 = [1 0];
den3 = [1 2 10];

num4 = [1 0];
den4 = [1 4 10 20];

num5 = [1 0];
den5 = [1 2 20 20 30];

sys0 = tf(num0,den0);
sys = tf(num,den);
sys1 = tf(num1,den1);
sys2 = tf(num2,den2);
sys3 = tf(num3,den3);
sys4 = tf(num4,den4);
sys5 = tf(num5,den5);



printsys(num,den)
[z,p,k] = tf2zp(num,den)


sys_ss = ss(sys)
figure(1)
step(sys0,sys,'m',sys1,'k',sys2,'r',sys3,'b')
legend('System 0','System A','System B','System C','System D')
grid on
[y,t,x] = step(sys)
figure(2)
step(sys4,sys5)
legend('System 4','System 5')
grid on
damp(sys);

